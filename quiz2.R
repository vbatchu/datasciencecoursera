install.packages("sqldf")
library(sqldf)
setwd("C:/Users/vbatc_000/Desktop/Coursera/GettingAndCleaningData/data")
acs <- read.csv("./getdata-data-ss06pid.csv", header=T, sep=",") 

sqldf("select pwgtp1 from acs where AGEP < 50")

sqldf("select distinct AGEP from acs")
unique(acs$AGEP)
 
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con)
close(con)
sapply(htmlCode[c(10, 20, 30, 100)], nchar)
##<meta name="Distribution" content="Global" /> 
##  45 
##<script type="text/javascript"> 
##  31 
##})(); 
## 7 
##\t\t\t\t<ul class="sidemenu"> 
##  25 
list.files()
data <- read.csv("./getdata-wksst8110.for", header=T)
sum(df[,4])
##32426.7