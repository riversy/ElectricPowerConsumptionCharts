###
# This R file creates PNG file with 
# Plot 3
###

source("ElectricPowerConsumptionCharts/data.R")

createChart <- function(){

    # Prepare the data
    data <- getData()    
    data$Sub_metering_1 <- as.numeric(format(data$Sub_metering_1))
    data$Sub_metering_2 <- as.numeric(format(data$Sub_metering_2))
    data$Sub_metering_3 <- as.numeric(format(data$Sub_metering_3))
    data$num <- seq(1, 3, length.out = nrow(data))
    
    # Set default font size
    par(ps = 12) 

    # Open plot device and print first chart
    plot(
        data$num,
        data$Sub_metering_1,     
        type = "l",
        xaxt = "n",        
        ann = FALSE
    )

    # Print second chart with red color 
    lines(
        data$num,
        data$Sub_metering_2,     
        col = "red"
    )

    # Print third chart with blue color
    lines(
        data$num,
        data$Sub_metering_3,     
        col = "blue"
    )

    # Print line legends
    legend(
        "topright", 
        col = c("black", "red", "blue"), 
        lty = c(1, 1, 1),
        lwd = c(1, 1, 1),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")    
    )

    # Print hunman readable X axis values
    axis(
        side = 1, 
        at = 1:3, 
        labels = c("Thu","Fri","Sat")
    )

    # Print Y Label
    title(
        ylab = "Energy sub metering"
    )

    # Copy dispya device into PNG device
    dev.copy(png, file = "ElectricPowerConsumptionCharts/plot3.png", width = 504, height = 504)

    # Close PNG device 
    dev.off()

    # Profit ヽ(^ᴗ^)丿
}

createChart()