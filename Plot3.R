working_dir <-paste(getwd(),"/",sep="")
data <-read.csv(paste(working_dir,"household_power_consumption.txt",sep=""),header=TRUE, sep=";",colClasses = "character",na.strings="?")
# Get Subset of data for desired days. fix date and time

feb <- subset(data,((as.Date(Date,"%d/%m/%Y")=="2007-02-01") | (as.Date(Date,"%d/%m/%Y")=="2007-02-02")))
feb[,10] <-  as.POSIXct(paste(feb$Date,feb$Time),format="%d/%m/%Y%H:%M:%S")
feb$Global_active_power <- as.numeric(feb$Global_active_power)

#plot3
png(filename="Plot3.png")
#Empty frame, then add desired line graphs
plot(y=feb$Sub_metering_1,x=feb$V10,type="n",ylab="Energy Sub metering", xlab="")
points(y=feb$Sub_metering_1,x=feb$V10,type="l",ylab="Energy Sub metering", xlab="",col="black")
points(y=feb$Sub_metering_2,x=feb$V10,type="l",ylab="Energy Sub metering", xlab="",col="red")
points(y=feb$Sub_metering_3,x=feb$V10,type="l",ylab="Energy Sub metering", xlab="",col="blue")
#add legend
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()