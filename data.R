###
# Load data from file and subset it by date
###

getData <- function(file = "household_power_consumption.txt"){

    data <- read.csv(file, sep = ";")
    data$Date <- strptime(data$Date,"%d/%m/%Y")
    data[
        data$Date == strptime("2007-02-01", "%Y-%m-%d") | 
        data$Date == strptime("2007-02-02", "%Y-%m-%d"),
    ]

}