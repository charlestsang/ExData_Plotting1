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

#Plot 1
hist(sub_data$Global_active_power, main="Global_active_power", 
     xlab="Global_active_power (kilowatts)", ylab="Frequency", col="Red")

#Copy to png file
dev.copy(png, file="./plot1.png", height=480, width=480)
dev.off()



