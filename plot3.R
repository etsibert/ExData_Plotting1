#Exploring Data, Week1, Assignment1
#2/5/2016
#Eric Tsibertzopoulos, etsibert@hotmail.com
setwd("/users/etsibert/downloads/")
getwd()
data<-read.table("household_power_consumption.txt", header=T, sep=';', stringsAsFactors = F)
data[,c(3:8)]<-sapply(data[,c(3:8)],as.numeric)
data$Date<-strptime(data$Date,"%d/%m/%Y")
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
s<-subset(data, Date%in%c("2007-02-01","2007-02-02"))  #Subset of the data set
rm(data)

#plot3.png
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(s$DateTime, s$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(s$DateTime,s$Sub_metering_2, col="red")
lines(s$DateTime,s$Sub_metering_3, col="blue")
legend("topright",legend=names(s[,7:9]),col = c("black","red","blue"), lty=c(1,1,1))
dev.off()
