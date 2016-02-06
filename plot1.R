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

#plot1.png
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(s$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
