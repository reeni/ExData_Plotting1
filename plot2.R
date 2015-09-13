setwd("C:\\Users\\Irene\\Desktop\\coursera2015\\exdata_data_household_power_consumption")
filename<-"household_power_consumption.txt"
energy<-read.table(filename, sep=";", header  = TRUE)
sub_date <- as.Date(energy$Date,format="%d/%m/%Y")
rnum1<-which(sub_date == "2007-02-01")
rnum2<-which(sub_date == "2007-02-02")
rnum<-c(rnum1,rnum2)
ga1<-energy[rnum,]
datetime <- strptime(paste(energy[rnum,]$Date, energy[rnum,]$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1), col = "black")
png(filename="plot2.png")
ga2<-as.numeric(as.character(ga1$Global_active_power))
plot(datetime,ga2,type ="l",ylab = "Global Active Power", xlab = "" ,col = "black")
dev.off()
