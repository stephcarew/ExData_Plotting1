data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE)
data$Date_Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Global_active_power<-as.numeric(data$Global_active_power)
data1 <- data[ which(data$Date_Time >= "2007-02-01" & data$Date_Time < "2007-02-03") , ]
png("plot3.png",width = 480, height = 480)
plot(data1$Date_Time, data1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
par(new=T)
plot(data1$Date_Time, data1$Sub_metering_2, type = "l", col = "red", axes = F, ylim = range(0:40), xlab = "", ylab = "")
par(new=T)
plot(data1$Date_Time, data1$Sub_metering_3, type = "l", col = "blue", axes = F, ylim = range(0:40), xlab = "", ylab = "")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(1,1),col=c("black","red","blue"))
dev.off()