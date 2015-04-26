# Getting and Cleaning Data
# Coursera
# John Hopkins University

# Venkat Batchu
#Q1. The Amerian Community Survey distributed downloadable data
# about United states communities.Down load the 2006 microdata survey
# about housing for the state of Idaho using download.file.

if (!file.exists("./data")){dir.create("./data")}
dataSource <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'

# download from the given URL
download.file(dataSource, destfile="./data/ACS.csv")

# read the data
ACS <- read.csv("./data/ACS.csv")

# create logical vector
ACS$agricultureLogical <- ACS$ACR==3 & ACS$AGS==6

# read lines
print(which(ACS$agricultureLogical))
#----------------------------------------------------
#Q2. Using the jpeg package read the picture

# load package
#install.packages("jpeg")
library(jpeg)

inputFile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
downloadFile <- 'jeff.jpg'

# download from the URL
download.file(inputFile, downloadFile, mode='wb' )


# load the data
picture <- readJPEG('jeff.jpg', native=TRUE)

# get the quantile info
quantile(picture, probs = c(0.3, 0.8) )

#Q3. 
#  Download GDP data & Education data using given URLs

inputFile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
outputFile <- 'GDP.csv'

download.file(inputFile, outputFile)

# specify the right lines
# read the data

gdp <- read.csv('GDP.csv', header=F, skip=5, nrows=190)

# Education data file
inputFile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
outputFile <- 'EDU.csv'

download.file(inputFile, outputFile )

# read edu file
edu <- read.csv('EDU.csv',stringsAsFactors=FALSE)
# merge datasets
mergedData <- merge(gdp, edu, by.x='V1', by.y='CountryCode', sort=TRUE)
#View(mergedData)
# sort the joined data
library(plyr)
sortedMergedData <-arrange(mergedData, -V2) 
#sortedMergedData$V2
# Q4.
# OECD
mean(mergedData[mergedData$Income.Group=='High income: OECD',]$V2)
# non OECD
mean(mergedData[mergedData$Income.Group=='High income: nonOECD',]$V2)

# Q5.
# Cut GDP rankings into 5 separate quantile groups.
# Make a table Rank intervals versus income Group

rank_quantile<-cut(mergedData$V2, 
          breaks = quantile (mergedData$V2, c (0.0,0.2,0.4,0.6,0.8,1)), 
           include.lowest = TRUE) 
# sum Income.Group  group by rank_quantile

aggregate (mergedData$Income.Group, list(rank_quantile), FUN = table)
