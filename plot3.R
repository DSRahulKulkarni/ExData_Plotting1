df <- read.table("household_power_consumption 2.txt", sep = ";", header = TRUE)

df <- subset(df, Date == "2/2/2007" | Date == "1/2/2007")
df <- df
Dates <- as.Date(df$Date, "%d/%m/%Y")
df$Date <- Dates
df <- df
df[,2:9][df[,2:9]=="?" ] <- NA
df<-df
GlobalActivePower <- as.numeric(as.character(df$Global_active_power))
df$Global_active_power <- GlobalActivePower
df <- df
df$ExactTime <- paste(df$Date, df$Time)
df$ExactTime <- as.POSIXct(df$ExactTime)

df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
png(filename = "plot3.png", width = 480, height = 480,units = "px", bg = "transparent")
plot(df$ExactTime, df$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(df$ExactTime, df$Sub_metering_2, col = "red")
lines(df$ExactTime, df$Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c(1,2,4), cex = 0.5)
dev.off()




