##bring and read the data 
setwd("D:/Coursera data Science/Exploratory Data Analysis/Assignment week 1/New folder")

##data manupulation
electricity<-read.csv("household_power_consumption.txt",header = T,sep = ';',na.strings = "?",nrows =2075259,check.names = F,stringsAsFactors = F,comment.char = "",quote='\"')
names(electricity)
head(electricity)
electricity_1<-subset(electricity,Date%in%c("1/2/2007","2/2/2007"))
electricity_1$Date=as.Date(electricity_1$Date,format = "%d/%m/%Y")
head(electricity_1)

##plotting a red histogram
hist(electricity_1$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)",ylab = "Frequency")
##making a copy of hist as png image
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
