plot_4 <- function() {
       ## Computation & design plot of Global Active Power, Voltage, Energy submetering,
       ## Sub_metering and Global Reactive Power

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


       Sys.setlocale("LC_TIME", "English")

       ##Add a new column called "Timestamp" to dd_01 dataframe. The new column contain "Date + Time" data
       dd_ok$Timestamp <- strptime(paste(dd_ok$Date,dd_ok$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
       
       ## Open PNG device
       png(file = "plot4.png", width = 480, height = 480)

       ## Data series are different range than other ones, then is necessary to include a ylim argument 
       ## on the Sub_metering_2 and Sub_metering_3 plot to fit them all in      
       yrange <- range(c(dd_ok$Sub_metering_1, dd_ok$Sub_metering_2, dd_ok$Sub_metering_3))

       with(dd_ok, {
            
            par(mfrow = c(2, 2))

            ##Launch Plot 1 - Global_active_power
            plot(dd_ok$Timestamp, dd_ok$Global_active_power,  type = "l", col = "black", xlab = "", ylab = "Global Active Power")

            ##Launch Plot 2 - Voltage
            plot(dd_ok$Timestamp, dd_ok$Voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage")

            ##Launch Plot 3 - Energy Sub Meetering
            plot(dd_ok$Timestamp, dd_ok$Sub_metering_1,  type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
            par(new=T)
            plot(dd_ok$Timestamp, dd_ok$Sub_metering_2, type = "l", col = "red", ylim = yrange, xlab = "", ylab = "")
            par(new=T)
            plot(dd_ok$Timestamp, dd_ok$Sub_metering_3, type = "l", col = "blue", ylim = yrange, xlab = "", ylab = "")
            par(new=F)
            legend("topright", col=c("black","red","blue"), bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)
   
            ##Launch Plot 4 - Global Reactive Power
            plot(dd_ok$Timestamp, dd_ok$Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Global Reactive Power")
 
       })

       ## Close the PNG device
       dev.off() 
}