# For plot 1

# Setting out the working directory
setwd("D:/Cursos 2015/Coursera/Specializations/The Data Scientists Toolbox/Exploratory Data Analysis/Week 1/exdata-data-household_power_consumption")

# Memory calculation
nrows <- 2075259
ncols <- 9
bits <- 64

Memory_estimation <- function(numrows, numcols, numbits){
        
        if(numbits == 64) numbytes <- 4 else numbytes <- 2 # for 32 bits
        
        total_bytes <- numrows*numcols*numbytes    
        
        Memrequired <- total_bytes/(2^20) # 2^20 bytes/Mb
        # the answer will be in Mb
        print("Memory required in Mb:")
        return(Memrequired)
}

Memory_estimation(nrows, ncols, bits)

# Reading the dataframe:
df_1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", na.strings = "?")

df_1_Gap <- df_1$Global_active_power # Storing all data from Global active power (Gap) column
df_1_Date <- df_1$Date # Storing all data from Date column
x <- df_1_Gap[df_1_Date == "1/2/2007"] # Selecting Gap for 1/2/2007
y <- df_1_Gap[df_1_Date == "2/2/2007"] # Selecting Gap for 2/2/2007
time <- 1:(2*1440)
z <- data.frame(time, c(x, y)) # Regrouping datasets into a new one 

# Plotting
png(filename = "plot1.png", width = 480, height = 480)
plot(hist(z$c.x..y),  main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()
