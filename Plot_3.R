## PLOT 3 

##Load the “Individual household electric power consumption Data Set”

##PLOT 3 STEPS

##1 plot3("household_power_consumption.txt")
##2 Load in R, assign to  data frame. 
##3 Reformat the date column.
##4 Subset two days of interest (from power data frame), assign to new data frame ("df").
##5 Reformat Sub_metering cols (as numeric vectors).
##6 Add "timestamp" column to df (merged date and time, reformat as POSIXct class).
##7 GeneratePlot #3 
##8 Create 480 x 480 pixel image.
##9 Save

plot3 <- function(file) {
        power <- read.table(file, header=T, sep=";")
        power$Date <- as.Date(power$Date, format="%d/%m/%Y")
        df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
        
        df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
        df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
        df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
        
        df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
        
        plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(df$timestamp,df$Sub_metering_2,col="red")
        lines(df$timestamp,df$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
        dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()
        cat("plot3.png has been saved in", getwd())
}
