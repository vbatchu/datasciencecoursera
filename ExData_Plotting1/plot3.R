sourceFile <- "./data/household_power_consumption.txt"
input <- read.table(sourceFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filteredData <- input[input$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(filteredData$Date, 
                           filteredData$Time, sep=" "),
                            "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(datetime, filteredData$Sub_metering_1, type="l", col="black",
     ylab="Energy Submetering", 
     xlab="")
lines(datetime, filteredData$Sub_metering_2, type="l", col="red")
lines(datetime, filteredData$Sub_metering_3, type="l", col="blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1, lwd=2.5
       )

dev.off()