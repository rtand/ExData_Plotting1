library("ggplot2")
library("dplyr")
	D<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
	D<-mutate(D,Date=as.Date(D$Date, "%d/%m/%Y"))
	D<-filter(D,Date=="2007-02-01" | Date=="2007-02-02")
	D<-mutate(D,Date_Time=as.POSIXct(sprintf("%s %s",Date,Time),"%Y-%m-%d %H:%M",tz="UTC"))

	png("plot4.png", width=480, height=480)
	par(mfrow = c(2, 2)) 

	plot(D$Date_Time, as.numeric(D$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)

	plot(D$Date_Time, as.numeric(D$Voltage), type="l", xlab="datetime", ylab="Voltage")

	plot(D$Date_Time, as.numeric(D$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
	lines(D$Date_Time, as.numeric(D$Sub_metering_2), type="l", col="red")
	lines(D$Date_Time, as.numeric(D$Sub_metering_3), type="l", col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

	plot(D$Date_Time, as.numeric(D$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

	dev.off()