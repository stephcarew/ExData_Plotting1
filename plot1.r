data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE)
data$Date_Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Global_active_power<-as.numeric(data$Global_active_power)
data1 <- data[ which(data$Date_Time >= "2007-02-01" & data$Date_Time < "2007-02-03") , ]
png("plot1.png",width = 480, height = 480)
hist(data1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()