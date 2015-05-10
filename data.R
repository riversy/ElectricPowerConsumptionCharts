###
# Load data from file and subset it by date
###

getData <- function(file = "household_power_consumption.txt"){

    data <- read.csv(file, sep = ";")
    data$Date <- dmy(data$Date)
    sub_data <- data[
        data$Date == ymd("2007-02-01") | 
        data$Date == ymd("2007-02-02"),
    ]
    sub_data$Global_active_power <- as.numeric(format(sub_data$Global_active_power))
    sub_data
}