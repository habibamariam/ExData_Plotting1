##bring the data
setwd("D:/Coursera data Science/Exploratory Data Analysis/Assignment week 1/New folder")
electricity<-read.csv("household_power_consumption.txt",header = T,sep = ';',na.strings = "?",nrows =2075259,check.names = F,stringsAsFactors = F,comment.char = "",quote='\"')
names(electricity)
##data manipulation
electricity_1<-subset(electricity,Date%in%c("1/2/2007","2/2/2007"))
electricity_1$Date=as.Date(electricity_1$Date,format = "%d/%m/%Y")
datetime<-paste(as.Date(electricity_1$Date),electricity_1$Time)
electricity_1$datetime<-as.POSIXct(datetime)
names(electricity_1)
head(electricity_1$datetime)
##plot
plot(electricity_1$Global_active_power~electricity_1$datetime,type="l",ylab = "Global Active Power(Kilowatts)",xlab="")
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
