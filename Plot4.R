working_dir <-paste(getwd(),"/",sep="")
data <-read.csv(paste(working_dir,"household_power_consumption.txt",sep=""),header=TRUE, sep=";",colClasses = "character",na.strings="?")
# Get Subset of data for desired days. fix date and time

feb <- subset(data,((as.Date(Date,"%d/%m/%Y")=="2007-02-01") | (as.Date(Date,"%d/%m/%Y")=="2007-02-02")))
feb[,10] <-  as.POSIXct(paste(feb$Date,feb$Time),format="%d/%m/%Y%H:%M:%S")
feb$Global_active_power <- as.numeric(feb$Global_active_power)

#Plot 4
png(filename="Plot4.png")
# set 2x2 output
par(mfrow=c(2,2))
#top left
plot(y=feb$Global_active_power,x=feb$V10,type="l",ylab="Global Active Power", xlab="")

#top right
plot(y=feb$Voltage,x=feb$V10,type="l",ylab="Voltage", xlab="datetime")

#bottom left
plot(y=feb$Sub_metering_1,x=feb$V10,type="n",ylab="Energy Sub metering", xlab="")
points(y=feb$Sub_metering_1,x=feb$V10,type="l",ylab="Energy Sub metering", xlab="",col="black")
points(y=feb$Sub_metering_2,x=feb$V10,type="l",ylab="Energy Sub metering", xlab="",col="red")
points(y=feb$Sub_metering_3,x=feb$V10,type="l",ylab="Energy Sub metering", xlab="",col="blue")
#legend 
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

#bottom right
plot(y=feb$Global_reactive_power,x=feb$V10,type="l",ylab="Global_reactive_power", xlab="datetime")
dev.off()