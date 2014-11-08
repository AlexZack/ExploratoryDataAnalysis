plot_3 <- function() {
       ## Computation & design plot on the household energy usage
       ## between Thursday (1/2/2007) and Saturday (2/2/2007) 
       ## of Sub_metering_1, Sub_metering_2 and Sub_metering_3
 
       ## Read text file "household_power_consumption.txt" that contains
       ## measurements of electric power consumption in one household with a 
       ## one-minute sampling rate over a period of almost 4 years.
       ## Then create a new data frame dd_ok with only records within the
       ## interval time: 2007-02-01 to 2007-02-02.
         
       ## Dataframe "data_hd" contain all record of the file household_power_consumption.txt
       data_hd <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")
        
       ## Dataframe "dd_ok" will contain only records within the
       ## interval time: 2007-02-01 to 2007-02-02
       startdate <- "1/2/2007"  
       enddate <- "2/2/2007"        
       dd_ok <- data.frame()
       dd_ok <- data_hd[(data_hd$Date == startdate | data_hd$Date == enddate),]

       ## Subsetting dataframe dd_ok considering only: Date, Sub_metering_1, Sub_metering_2, Sub_metering_3
       dd_01 <- subset(dd_ok, select = c(Date, Sub_metering_1, Sub_metering_2, Sub_metering_3))
       
       Sys.setlocale("LC_TIME", "English")

       ## Add a new column called "Timestamp" to dd_01 dataframe. The new column contains "Date + Time" data
       dd_01$Timestamp <- strptime(paste(dd_ok$Date, dd_ok$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
       
       ## Data series are different range than other ones, then is necessary to include a ylim argument 
       ## on the Sub_metering_2 and Sub_metering_3 plot to fit them all in      
       yrange <- range(c(dd_ok$Sub_metering_1, dd_ok$Sub_metering_2, dd_ok$Sub_metering_3))
       
       ## Open PNG device
       png(file = "plot3.png", width = 480, height = 480)

       ## Launch the plot
       plot(dd_01$Timestamp, dd_ok$Sub_metering_1,  type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
       par(new=T)
       plot(dd_01$Timestamp, dd_ok$Sub_metering_2, type = "l", col = "red", ylim = yrange, xlab = "", ylab = "")
       par(new=T)
       plot(dd_01$Timestamp, dd_ok$Sub_metering_3, type = "l", col = "blue", ylim = yrange, xlab = "", ylab = "")
       par(new=F)

       legend("topright", col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1) 

       ## Close the PNG device
       dev.off() 
     
}