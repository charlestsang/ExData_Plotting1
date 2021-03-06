getwd()
setwd('/Users/Charlestsang/Dropbox/Data_Science_Coursera/Course4_Wk1/Course4_Wk1_Assignment')
dir()

#Load dataset as data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#Observation on the dataset
str(data)

# The task only use data from the dates 2007-02-01 and 2007-02-02, create a subset corespondingly.

data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")


