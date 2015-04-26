# Getting and Cleaning Data
# Coursera
# John Hopkins University

# Venkat Batchu
#Q1.Apply strsplit() to split all the names of the data frame
#  on the characters "wgtp". 
# What is the value of the 123 element of the result set.


if (!file.exists("./data")){dir.create("./data")}
dataSource <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'

# download from the given URL
download.file(dataSource, destfile="./data/ACS.csv")

# read the data
ACS <- read.csv("./data/ACS.csv")

splitNames = strsplit(names(ACS),"wgtp")
splitNames[[123]]

## [1] ""   "15"
# Q2. 
#  Download GDP data & Education data using given URLs

if (!file.exists("./data")){dir.create("./data")}
inputFile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
outputFile <- './data/GDP.csv'

download.file(inputFile, outputFile)

# read the data

gdp <- read.csv('GDP.csv', header=F, skip=5, nrows=190)

gdpcol<-gsub(",","",gdp$V5)

# convert to integer and calculate mean
gdpcol <- as.integer(gdpcol)
mean(gdpcol, na.rm=TRUE)

#Q3.

countryNames <- gdp[,4]
grep("^United", countryNames)

