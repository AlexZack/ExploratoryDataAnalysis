plot_1 <- function() {
       ## Computation & design hystogram of Global Active Power in kilowatts
       ## between 1/2/2007 and 2/2/2007

       ## The function load_cons() read the data from the file "household_power_consumption.txt"       
       ## and create the dataframe "dd_ok" with the right data of Global Active Power
       ## between 1/2/2007 and 2/2/2007
       source("load_data.R")
       dd_ok <- load_cons()

       ## Open PNG device
       png(file = "plot1.png", width = 480, height = 480)

       ## Launch the histogram
       hist(dd_ok$Global_active_power, col = "red", breaks = 12, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")

       ## Copy Hystogram to PNG file
       ##dev.copy(png, file = "plot1.png") 

       ## Close the PNG device
       dev.off() 
           
}