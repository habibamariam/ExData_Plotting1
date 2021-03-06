##bringing data on Rand reading it

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
##setting the screen parameter
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
##making plots

with(electricity_1,{plot(Global_active_power~datetime,type="l",ylab = "Global Active Power",xlab="")
    plot(Voltage~datetime,type="l",ylab = "Voltage",xlab="datetime")
    plot(Sub_metering_1~datetime,type="l",ylab = "Global sub metering",xlab="")
    lines(Sub_metering_2~datetime,col="red")
    lines(Sub_metering_3~datetime,col="blue")
    legend("topright", col=c("black", "red", "blue"),lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~datetime,type="l",ylab = "Global_Reactive_power",xlab="")
    })
##copying as png file

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()
