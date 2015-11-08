library("ggplot2")
library("dplyr")
	D<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
	D<-mutate(D,Date=as.Date(D$Date, "%d/%m/%Y"))
	D<-filter(D,Date=="2007-02-01" | Date=="2007-02-02")
	D<-mutate(D,Date_Time=as.POSIXct(sprintf("%s %s",Date,Time),"%Y-%m-%d %H:%M",tz="UTC"))

	png("plot1.png", width=480, height=480)
	hist(as.numeric(D$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
	dev.off()


