working_dir <-paste(getwd(),"/",sep="")
data <-read.csv(paste(working_dir,"household_power_consumption.txt",sep=""),header=TRUE, sep=";",colClasses = "character",na.strings="?")
# Get Subset of data for desired days. fix date and time

feb <- subset(data,((as.Date(Date,"%d/%m/%Y")=="2007-02-01") | (as.Date(Date,"%d/%m/%Y")=="2007-02-02")))
feb[,10] <-  as.POSIXct(paste(feb$Date,feb$Time),format="%d/%m/%Y%H:%M:%S")
feb$Global_active_power <- as.numeric(feb$Global_active_power)

#Plot
png(filename="Plot2.png")
plot(y=feb$Global_active_power,x=feb$V10,type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()