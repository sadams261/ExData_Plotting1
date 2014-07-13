working_dir <-paste(getwd(),"/",sep="")
data <-read.csv(paste(working_dir,"household_power_consumption.txt",sep=""),header=TRUE, sep=";",colClasses = "character",na.strings="?")
# Get Subset of data for desired days. fix date and time

feb <- subset(data,((as.Date(Date,"%d/%m/%Y")=="2007-02-01") | (as.Date(Date,"%d/%m/%Y")=="2007-02-02")))
feb[,10] <-  as.POSIXct(paste(feb$Date,feb$Time),format="%d/%m/%Y%H:%M:%S")
feb$Global_active_power <- as.numeric(feb$Global_active_power)

#Plot
png(filename="Plot1.png")
hist(feb$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()