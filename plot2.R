###
# This R file creates PNG file with 
# Plot 2 
###

source("ElectricPowerConsumptionCharts/data.R")

createChart <- function(){

    data <- getData()    
    data$Global_active_power <- as.numeric(format(data$Global_active_power))
    data$num <- seq(1, 3, length.out = nrow(data))

    par(ps = 12)
    
    plot(
        data$num,
        data$Global_active_power,     
        type = "l",
        xaxt = "n",        
        ann = FALSE
    )
    
    title(
        ylab = "Global Active Power (kilowatts)"
    )

    axis(
        side = 1, 
        at = 1:3, 
        labels = c("Thu","Fri","Sat")
    )
    
    dev.copy(png, file = "ElectricPowerConsumptionCharts/plot2.png", width = 504, height = 504)
    dev.off()
}

createChart()