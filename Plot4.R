getwd()
setwd('/Users/Charlestsang/Dropbox/Data_Science_Coursera/Course4_Wk1/Course4_Wk1_Assignment')
dir()

#Load dataset as data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#Observation on the dataset
str(data)

# The task only use data from the dates 2007-02-01 and 2007-02-02, create a subset corespondingly.

sub_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")

#Plot 4
dtime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(dtime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(sub_data, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global_active_power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global_active_power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

#Copy to png file
dev.copy(png, file="./plot4.png", height=480, width=480)
dev.off()