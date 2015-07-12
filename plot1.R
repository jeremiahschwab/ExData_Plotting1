plot1 <- function() {
  
  ## Read the data file
  raw_file <- read.table("household_power_consumption.txt", sep = ";" , header = TRUE, stringsAsFactors=FALSE)
  
  ## Create new data frame that will combine date and time
  formatted_file <- raw_file[,-2]
  formatted_file[,1] <- paste(raw_file[,1],raw_file[,2])
  formatted_file[,1] <- as.data.frame(strptime(formatted_file[,1], "%d/%m/%Y %H:%M:%S"))
  colnames(formatted_file)[1] <- "DateTime"
  
  
  ## Create new data frame that subsets the required dates
  subsetted_file <- subset(formatted_file, DateTime > "2007-01-31 23:59:59" & DateTime < "2007-02-03 00:00:00")
  rownames(subsetted_file) <- NULL
  subsetted_file[,2] <- as.numeric(subsetted_file[,2])
  subsetted_file[,3] <- as.numeric(subsetted_file[,3])
  subsetted_file[,4] <- as.numeric(subsetted_file[,4])
  subsetted_file[,5] <- as.numeric(subsetted_file[,5])
  subsetted_file[,6] <- as.numeric(subsetted_file[,6])
  subsetted_file[,7] <- as.numeric(subsetted_file[,7])

  ## Create plot1
  plot1 <- hist(subsetted_file[,2], xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red")
  
  ## Create plot1.png
  png(filename="plot1.png",width=480,height=480)
  plot(plot1, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red")
  dev.off()
  
}
