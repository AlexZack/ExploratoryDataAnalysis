plot_3 <- function() {
       ## Computation & design plot on the household energy usage
       ## between Thursday (1/2/2007) and Saturday (2/2/2007) 
       ## of Sub_metering_1, Sub_metering_2 and Sub_metering_3
 
       ## The function load_cons() read the data from the file "household_power_consumption.txt"       
       ## and create the dataframe "dd_ok" with the right data of Global Active Power
       ## between 1/2/2007 and 2/2/2007
       source("load_data.R")       
       dd_ok <- load_cons()

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