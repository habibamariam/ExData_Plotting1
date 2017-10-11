##bringing data on R 
setwd("D:/Coursera data Science/Exploratory Data Analysis/Assignment week 1/New folder")
electricity<-read.csv("household_power_consumption.txt",header = T,sep = ';',na.strings = "?",nrows =2075259,check.names = F,stringsAsFactors = F,comment.char = "",quote='\"')
##data manipulation
names(electricity)
electricity_1<-subset(electricity,Date%in%c("1/2/2007","2/2/2007"))
electricity_1$Date=as.Date(electricity_1$Date,format = "%d/%m/%Y")
datetime<-paste(as.Date(electricity_1$Date),electricity_1$Time)
electricity_1$datetime<-as.POSIXct(datetime)
names(electricity_1)
head(electricity_1$datetime)
##plotting the data

with(electricity_1,{plot(Sub_metering_1~datetime,type="l",ylab = "Global sub metering",xlab="")
    lines(Sub_metering_2~datetime,col="red")
    lines(Sub_metering_3~datetime,col="blue")
    })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##making png file
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
