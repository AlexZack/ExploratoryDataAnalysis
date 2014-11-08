load_cons <- function() {
       ## This function reads text file "household_power_consumption.txt" that contains
       ## measurements of electric power consumption in one household with a 
       ## one-minute sampling rate over a period of almost 4 years.
       ## Then create a new data frame with only records within the
       ## interval time: 2007-02-01 to 2007-02-02.
         
       ## Dataframe "data_hd" contain all record of the file household_power_consumption.txt
       data_hd <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")
       x <- nrow(data_hd)
       
       ## Dataframe "data_ok" will contain only records within the
       ## interval time: 2007-02-01 to 2007-02-02
       startdate <- "1/2/2007"  
       enddate <- "2/2/2007"        
       data_ok <- data.frame()
       data_ok <- data_hd[(data_hd$Date == startdate | data_hd$Date == enddate),]
              
       ## for(i in 1:x) {
       ## only records with data within the interval time: 2007-02-01 to 2007-02-02
       ##    aa <- data_hd[i,"Date"]
       ##    if(aa == startdate | aa == enddate) data_ok <- rbind(data_ok, data_hd[i,])
       ##    if(aa == "3/2/2007") break
       ## }   
  
       return(data_ok)           
}