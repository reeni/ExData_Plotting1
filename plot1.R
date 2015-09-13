setwd("C:\\Users\\Irene\\Desktop\\coursera2015\\exdata_data_household_power_consumption")
filename<-"household_power_consumption.txt"
energy<-read.table(filename, sep=";", header  = TRUE)
sub_date <- as.Date(energy$Date,format="%d/%m/%Y")
rnum1<-which(sub_date == "2007-02-01")
rnum2<-which(sub_date == "2007-02-02")
rnum<-c(rnum1,rnum2)
datetime <- strptime(paste(energy[rnum,]$Date, energy[rnum,]$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

--1
par(mfrow=c(1,1), col = "black")
png(filename="plot1.png")
ga2<-as.numeric(as.character(ga1$Global_active_power))
hist(ga2, xlab ="Global Active Power", breaks = 12,xlim = c(0,8), ylim = c(0,1200),main = "Global Active Power",freq= TRUE, col = "red")

dev.off()