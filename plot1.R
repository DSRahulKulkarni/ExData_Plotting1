df <- read.table("household_power_consumption 2.txt", sep = ";", header = TRUE)

df <- subset(df, Date == "2/2/2007" | Date == "1/2/2007")
Dates <- as.Date(df$Date, "%d/%m/%Y")
df$Date <- Dates
df[,2:9][df[,2:9]=="?" ] <- NA
GlobalActivePower <- as.numeric(as.character(df$Global_active_power))
df$Global_active_power <- GlobalActivePower
png(filename = "plot1.png", width = 480, height = 480,units = "px", bg = "transparent")
hist(df$Global_active_power, 12, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency")
dev.off()

