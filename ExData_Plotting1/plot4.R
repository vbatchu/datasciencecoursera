sourceFile <- "../data/household_power_consumption.txt"
input <- read.table(sourceFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filteredData <- input[input$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, filteredData$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, filteredData$Voltage, 
     type="l", xlab="datetime", ylab="Voltage")

plot(datetime, filteredData$Sub_metering_1, 
     type="l", ylab="Energy Submetering", xlab="")
lines(datetime, filteredData$Sub_metering_2, 
      type="l", col="red")
lines(datetime, filteredData$Sub_metering_3, 
      type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, filteredData$Global_reactive_power, 
     type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()