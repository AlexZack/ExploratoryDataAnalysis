plot_2 <- function() {
       ## Computation & design plot on the trend of Global Active Power 
       ## between Thursday (1/2/2007) and Saturday (2/2/2007) 
       
       ## Read text file "household_power_consumption.txt" that contains
       ## measurements of electric power consumption in one household with a 
       ## one-minute sampling rate over a period of almost 4 years.
       ## Then create a new data frame dd_ok with only records within the
       ## interval time: 2007-02-01 to 2007-02-02.
         
       ## Dataframe "data_hd" contain all record of the file household_power_consumption.txt
       data_hd <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")
       x <- nrow(data_hd)
       
       ## Dataframe "dd_ok" will contain only records within the
       ## interval time: 2007-02-01 to 2007-02-02
       startdate <- "1/2/2007"  
       enddate <- "2/2/2007"        
       dd_ok <- data.frame()
       dd_ok <- data_hd[(data_hd$Date == startdate | data_hd$Date == enddate),]
       
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