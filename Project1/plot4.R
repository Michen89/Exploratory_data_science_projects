# For plot 4

# Setting out the working directory
setwd("D:/Cursos 2015/Coursera/Specializations/The Data Scientists Toolbox/Exploratory Data Analysis/Week 1/exdata-data-household_power_consumption")

# Reading the dataframe:
df_1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", na.strings = "?")

# Global active power
df_1_Gap <- df_1$Global_active_power # Storing all data from Global active power (Gap) column
df_1_Date <- df_1$Date # Storing all data from Date column
x <- df_1_Gap[df_1_Date == "1/2/2007"] # Selecting Gap for 1/2/2007
y <- df_1_Gap[df_1_Date == "2/2/2007"] # Selecting Gap for 2/2/2007
time <- 1:(2*1440)
z <- data.frame(time, c(x, y)) # Regrouping datasets into a new one 

# For Sub_metering_1
df_1_Subm1 <- df_1$Sub_metering_1 # Storing all data from Sub_metering_1 (Subm1) column
x_1 <- df_1_Subm1[df_1_Date == "1/2/2007"] # Selecting for 1/2/2007
y_1 <- df_1_Subm1[df_1_Date == "2/2/2007"] # Selecting for 2/2/2007

# For Sub_metering_2
df_1_Subm2 <- df_1$Sub_metering_2 # Storing all data from Sub_metering_2 (Subm2) column
x_2 <- df_1_Subm2[df_1_Date == "1/2/2007"] # Selecting for 1/2/2007
y_2 <- df_1_Subm2[df_1_Date == "2/2/2007"] # Selecting for 2/2/2007

# For Sub_metering_3
df_1_Subm3 <- df_1$Sub_metering_3 # Storing all data from Sub_metering_3 (Subm3) column
x_3 <- df_1_Subm3[df_1_Date == "1/2/2007"] # Selecting for 1/2/2007
y_3 <- df_1_Subm3[df_1_Date == "2/2/2007"] # Selecting for 2/2/2007

z_1 <- data.frame(c(x_1, y_1)) # Regrouping datasets into a new one 
z_2 <- data.frame(c(x_2, y_2))
z_3 <- data.frame(c(x_3, y_3))
Sum_Ms <- data.frame(z_1, z_2, z_3)

# For Voltage
df_1_V <- df_1$Voltage
x_V <- df_1_V[df_1_Date == "1/2/2007"] # Selecting for 1/2/2007
y_V <- df_1_V[df_1_Date == "2/2/2007"] # Selecting for 2/2/2007
V_frame <- data.frame(time, c(x_V, y_V))

# For Global reactive power
df_1_Grp <- df_1$Global_reactive_power # Storing all data from Global reactive power (Grp) column
x_Grp <- df_1_Grp[df_1_Date == "1/2/2007"] # Selecting Grp for 1/2/2007
y_Grp <- df_1_Grp[df_1_Date == "2/2/2007"] # Selecting Grp for 2/2/2007
time <- 1:(2*1440)
z_Grp <- data.frame(time,c(x_Grp, y_Grp)) # Regrouping datasets into a new one 




# Plotting
png(filename = "plot4.png", width = 480, height = 480)
par(mar = c(3,5,2,2)+.1)
old.par <- par(mfrow = c(2,2))

# Global active power
plot(time, (z$c.x..y.), type = "l", ann = FALSE, axes = FALSE)
axis(1, at=c(1, 1440, 2880), lab=c("Thu","Fri","Sat"))
axis(2, las=1, at=2*0:6)
box()
title(ylab = "Global Active Power (kilowatts)")

# For Voltage
plot(time, V_frame$c.x_V..y_V., type = "l", ann = T, axes = FALSE, ylab = "Voltage", xlab = "datatime")
axis(1, at=c(1, 1440, 2880), lab=c("Thu","Fri","Sat"))
axis(2, at = 3*0:248)
box()


# Sub_metering_plots
plot(time, (Sum_Ms$c.x_1..y_1.), type = "l", ann = FALSE, axes = FALSE)
lines((Sum_Ms$c.x_2..y_2.), type = "l", col = "red")
lines((Sum_Ms$c.x_3..y_3.), type = "l", col = "blue")
axis(1, at=c(1, 1440, 2880), lab=c("Thu","Fri","Sat"))
axis(2, las=1, at=10*0:30)
box()
title(ylab = "Energy sub metering")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), horiz = FALSE, cex = 0.8)

# For Global reactive power
plot(time, (z_Grp$c.x_Grp..y_Grp.), type = "l", ann = FALSE, axes = FALSE)
axis(1, at=c(1, 1440, 2880), lab=c("Thu","Fri","Sat"))
axis(2)
box()
title(ylab = "Global_rective_power")
title(xlab = "datatime")

par(old.par)
dev.off()