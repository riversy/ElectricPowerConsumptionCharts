###
# This R file creates PNG file with 
# Histogram 
###

source("ElectricPowerConsumptionCharts/data.R")

createChart <- function(){

    # Prepare data
    data <- getData()  
    data$Global_active_power <- as.numeric(format(data$Global_active_power))
    
    # Set default font size
    par(ps = 12, mfrow = c(1, 1)) 
    
    # Print Histogram
    hist(
        data$Global_active_power, 
        col="#FF2500", 
        main = "Global Active Power",
        xlab = "Global Active Power (kilowatts)"
    )
    
    # Save it to file
    dev.copy(png, file = "ElectricPowerConsumptionCharts/plot1.png", width = 504, height = 504)
    dev.off()
}

createChart()