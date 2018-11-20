#1. set Working directory

filePath <- "C:\\Coursera\\Data Science\\Plotting\\household_power_consumption"
filePathData <- filePath
setwd(filePathData)


#2. Get the data 

data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

#3. Add names

names <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
colnames(data) <- names

#4. Create DateTime Column

data$DateTime <- with(data, paste0(data$Date," ",data$Time))
data$DateTime <- strptime(data$DateTime,format = "%d/%m/%Y %H:%M:%S")

#5. Create plot and save to device

png(filename="plot3.png")
plot(data$DateTime,data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(data$DateTime,data$Sub_metering_2, type = "l", ylab = "", xlab = "", col = "red")
lines(data$DateTime,data$Sub_metering_3, type = "l", ylab = "", xlab = "", col = "blue")
legend("topright", lwd=c(3,2), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
