sourceFile <- "./data/household_power_consumption.txt"
input <- read.table(sourceFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filteredData <- input[input$Date %in% c("1/2/2007","2/2/2007") ,]
head(filteredData)
library(datasets)
globalActivePower <- as.numeric(filteredData$Global_active_power)
png(plot1.png", width=480, height=480)
hist(globalActivePower, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()