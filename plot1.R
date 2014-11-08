plot_1 <- function() {
       ## Computation & design hystogram of Global Active Power in kilowatts
       ## between 1/2/2007 and 2/2/2007

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
              
       ## Open PNG device
       png(file = "plot1.png", width = 480, height = 480)

       ## Launch the histogram
       hist(dd_ok$Global_active_power, col = "red", breaks = 12, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")

       ## Copy Hystogram to PNG file
       ##dev.copy(png, file = "plot1.png") 

       ## Close the PNG device
       dev.off() 
           
}