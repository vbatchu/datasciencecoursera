file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
file.dest <- 'ACS2.csv'

# download from the URL
download.file(file.url, file.dest )

# load the data.table package
install.packages("data.table")
library(data.table)
file.info("ACS2.csv")
getwd()

# read the data
DT <- fread('ACS2.csv')

# time the proc
system.time(replicate(1000,(mean(DT$pwgtp15,by=DT$SEX))))
system.time(replicate(1000,(tapply(DT$pwgtp15,DT$SEX,mean))))
system.time(replicate(1000,(sapply(split(DT$pwgtp15,DT$SEX),mean))))
system.time(replicate(1000,(mean(DT[DT$SEX==1,]$pwgtp15)))) 
system.time(replicate(1000,( mean(DT[DT$SEX==2,]$pwgtp15))))
system.time(replicate(1000,(DT[,mean(pwgtp15),by=SEX])))
system.time(replicate(1000,(rowMeans(DT)[DT$SEX==1])))
system.time(replicate(1000,(rowMeans(DT)[DT$SEX==2])))
mean(DT$pwgtp15,by=DT$SEX)
tapply(DT$pwgtp15,DT$SEX,mean)
mean(DT[DT$SEX==1,]$pwgtp15)
mean(DT[DT$SEX==2,]$pwgtp15)
DT[,mean(pwgtp15),by=SEX]
rowMeans(DT)[DT$SEX==2]