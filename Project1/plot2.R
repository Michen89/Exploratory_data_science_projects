# For plot 2

# Setting out the working directory
setwd("D:/Cursos 2015/Coursera/Specializations/The Data Scientists Toolbox/Exploratory Data Analysis/Week 1/exdata-data-household_power_consumption")

# Reading the dataframe:
df_1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", na.strings = "?")

df_1_Gap <- df_1$Global_active_power # Storing all data from Global active power (Gap) column
df_1_Date <- df_1$Date # Storing all data from Date column
x <- df_1_Gap[df_1_Date == "1/2/2007"] # Selecting Gap for 1/2/2007
y <- df_1_Gap[df_1_Date == "2/2/2007"] # Selecting Gap for 2/2/2007
time <- 1:(2*1440)

z <- data.frame(time, c(x, y)) # Regrouping datasets into a new one 

# Plotting
png(filename = "plot2.png", width = 480, height = 480)
plot(time, (z$c.x..y.), type = "l", ann = FALSE, axes = FALSE)
axis(1, at=c(1, 1440, 2880), lab=c("Thu","Fri","Sat"))
axis(2, las=1, at=2*0:6)
box()
title(ylab = "Global Active Power (kilowatts)")
dev.off()