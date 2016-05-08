sourceFile <- "./data/household_power_consumption.txt"
input <- read.table(sourceFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filteredData <- input[input$Date %in% c("1/2/2007","2/2/2007") ,]

# if we add converted Date & Time to the DF then there is no need to convert
# y axis variable

datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
library(datasets)
plot(datetime, filteredData$Global_active_power, 
     type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()