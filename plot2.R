plot_2 <- function() {
       ## Computation & design plot on the trend of Global Active Power 
       ## between Thursday (1/2/2007) and Saturday (2/2/2007) 
       
       ## The function load_cons() read the data from the file "household_power_consumption.txt"       
       ## and create the dataframe "dd_ok" with the right data of Global Active Power
       ## between 1/2/2007 and 2/2/2007
       source("load_data.R")
       dd_ok <- load_cons()
       
       Sys.setlocale("LC_TIME", "English")

       ## Add a new column called "Timestamp" to dd_ok dataframe. 
       ## The new column contains "Date + Time" data
       dd_ok$Timestamp <- strptime(paste(dd_ok$Date, dd_ok$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

       ## Open PNG device
       png(file = "plot2.png", width = 480, height = 480)
       
       ## Launch the plot
       plot(dd_ok$Timestamp, dd_ok$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (Kilowatts)")

       ## Close the PNG device
       dev.off() 
}