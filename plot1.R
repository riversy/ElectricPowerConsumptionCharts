###
# This R file creates PNG file with 
# Histogram 
###

source("ElectricPowerConsumptionCharts/data.R")

createChart <- function(){

    data <- getData()    
    data$Global_active_power <- as.numeric(format(data$Global_active_power))
    hist(
        data$Global_active_power, 
        col="#FF2500", 
        main = "Global Active Power",
        xlab = "Global Active Power (kilowatts)"
    )
    dev.copy(png, file = "ElectricPowerConsumptionCharts/plot1.png", width = 504, height = 504)
    dev.off()
}

createChart()