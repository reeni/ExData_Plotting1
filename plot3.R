setwd("C:\\Users\\Irene\\Desktop\\coursera2015\\exdata_data_household_power_consumption")
filename<-"household_power_consumption.txt"
energy<-read.table(filename, sep=";", header  = TRUE)
sub_date <- as.Date(energy$Date,format="%d/%m/%Y")
rnum1<-which(sub_date == "2007-02-01")
rnum2<-which(sub_date == "2007-02-02")
rnum<-c(rnum1,rnum2)
ga1<-energy[rnum,]
datetime <- strptime(paste(energy[rnum,]$Date, energy[rnum,]$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

--3
par(mfrow=c(1,1), col = "black")
png(filename="plot3.png")
plot(datetime,ga3, type="n", ylim = c(0, 40), ylab= "Engery Sub Metering", xlab="")
ga3<-as.numeric(as.character(ga1$Sub_metering_1))
lines(datetime,ga3, type="l", ylim = c(0, 40),col = "black", ylab ='')
ga4<-as.numeric(as.character(ga1$Sub_metering_2))
lines(datetime,ga4, type="l", ylim = c(0, 40), col = "red",ylab='')
ga5<-as.numeric(as.character(ga1$Sub_metering_3))
lines(datetime,ga5, type="l", ylim = c(0, 40), col = "blue",ylab='')
legend("topright", c("Sub_Metering_1", "Sub_Metering_2","Sub_Metering_3"), lty= c(1,1), col = c("black", "red", "blue"), text.col = c("black", "red","blue"))
dev.off()
