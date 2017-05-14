## PLOT #2

##Load the  “Individual household electric power consumption Data Set” from the UC Irvine Machine Learning Repository, 
## Plot line graph of the Global Active Power consumption (Kw)

##PLOT 2 STEPS

##1 plot2("household_power_consumption.txt").
##2 Read into R, assign to power data frame.
##3 Reformat the date column is reformatted.
##4 Subset two days of interest, assigned to new data frame named "df".
##5 Format the Global_active_power col as a numeric vector
##6 Add a new "timestamp" column (date and time merged and reforamtted as a POSIXct class) to df.
##7 Generate Plot, x-axis (timestamped) and y-axis (global active power).
##8 Generate 480 x 480 image. 
##9 Print statemen.

plot2 <- function(file) {
        power <- read.table(file, header=T, sep=";")
        power$Date <- as.Date(power$Date, format="%d/%m/%Y")
        df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
        
        df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
        df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
        
        plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        
        dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
        cat("plot2.png has been saved in", getwd())
}
 