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
png(filename = "plot2.png", width = 480, height = 480,units = "px", bg = "transparent")
plot(df$ExactTime, df$Global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type = "n")
lines(df$ExactTime, df$Global_active_power)

dev.off()


