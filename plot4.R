setwd("C:\\Users\\Irene\\Desktop\\coursera2015\\exdata_data_household_power_consumption")
filename<-"household_power_consumption.txt"
energy<-read.table(filename, sep=";", header  = TRUE)
sub_date <- as.Date(energy$Date,format="%d/%m/%Y")
rnum1<-which(sub_date == "2007-02-01")
rnum2<-which(sub_date == "2007-02-02")
rnum<-c(rnum1,rnum2)
datetime <- strptime(paste(energy[rnum,]$Date, energy[rnum,]$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

--4
png(filename="plot4.png")
par(mfrow=c(2,2), col = "black")

ga2<-as.numeric(as.character(ga1$Global_active_power))
plot(datetime,ga2,type ="l",ylab = "Global Active Power", xlab = "" ,col = "black")

ga6<-as.numeric(as.character(ga1$Voltage))
plot(datetime,ga6,type ="l", col = "black", ylab= "Voltage")


plot(datetime,ga3, type="n", ylim = c(0, 40), ylab= "Engery Sub Metering", xlab="")
ga3<-as.numeric(as.character(ga1$Sub_metering_1))
lines(datetime,ga3, type="l", ylim = c(0, 40),col = "black", ylab ='')
ga4<-as.numeric(as.character(ga1$Sub_metering_2))
lines(datetime,ga4, type="l", ylim = c(0, 40), col = "red",ylab='')
ga5<-as.numeric(as.character(ga1$Sub_metering_3))
lines(datetime,ga5, type="l", ylim = c(0, 40), col = "blue",ylab='')
legend("topright", c("Sub_Metering_1", "Sub_Metering_2","Sub_Metering_3"), lty= c(1,1), col = c("black", "red", "blue"), text.col = c("black", "red","blue"),cex=0.8, pt.cex = 0.5)


ga7<-as.numeric(as.character(ga1$Global_reactive_power))
plot(datetime,ga7,type ="h", col = "black", ylab= "Global_Reactive_Power")
dev.off()

