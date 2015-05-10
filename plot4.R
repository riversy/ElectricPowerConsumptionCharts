###
# This R file creates PNG file with 
# Plot 4
###

source("ElectricPowerConsumptionCharts/data.R")

createChart <- function(){

    # Prepare the data
    data <- getData()    
    data$Sub_metering_1 <- as.numeric(format(data$Sub_metering_1))
    data$Sub_metering_2 <- as.numeric(format(data$Sub_metering_2))
    data$Sub_metering_3 <- as.numeric(format(data$Sub_metering_3))
    data$Global_active_power <- as.numeric(format(data$Global_active_power))
    data$Global_reactive_power <- as.numeric(format(data$Global_reactive_power))
    data$Voltage <- as.numeric(format(data$Voltage))
    data$num <- seq(1, 3, length.out = nrow(data))
    
    # Set default font size
    par(ps = 12, mfrow = c(2, 2)) 

    # Plot 1
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
    
    # Plot 2
    plot(
        data$num,
        data$Voltage,     
        type = "l",
        xaxt = "n",        
        ann = FALSE
    )
    
    title(
        ylab = "Voltage",
        xlab = "datetime",
    )

    axis(
        side = 1, 
        at = 1:3, 
        labels = c("Thu","Fri","Sat")
    )
    

    # Plot 3
    plot(
        data$num,
        data$Sub_metering_1,     
        type = "l",
        xaxt = "n",        
        ann = FALSE
    )
    
    lines(
        data$num,
        data$Sub_metering_2,     
        col = "red"
    )

    lines(
        data$num,
        data$Sub_metering_3,     
        col = "blue"
    )

    legend(
        "topright", 
        col = c("black", "red", "blue"), 
        lty = c(1, 1, 1),
        lwd = c(1, 1, 1),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        bty = "n"
    )

    axis(
        side = 1, 
        at = 1:3, 
        labels = c("Thu","Fri","Sat")
    )

    title(
        ylab = "Energy sub metering"
    )

    # Plot 4
    plot(
        data$num,
        data$Global_reactive_power,     
        type = "l",
        xaxt = "n",        
        ann = FALSE
    )
    
    title(
        ylab = "Global_reactive_power",
        xlab = "datetime",
    )

    axis(
        side = 1, 
        at = 1:3, 
        labels = c("Thu","Fri","Sat")
    )

    # Copy dispya device into PNG device
    dev.copy(png, file = "ElectricPowerConsumptionCharts/plot4.png", width = 504, height = 504)

    # Close PNG device 
    dev.off()

}

createChart()