plot2 <- function() {
  
  library(base)
  
  ## Read the data file
  raw_file <- read.table("household_power_consumption.txt", sep = ";" , header = TRUE, stringsAsFactors=FALSE)
  
  ## Create new data frame that will combine date and time
  formatted_file <- raw_file[,-2]
  formatted_file[,1] <- paste(raw_file[,1],raw_file[,2])
  formatted_file[,1] <- as.data.frame(strptime(formatted_file[,1], "%d/%m/%Y %H:%M:%S"))
  colnames(formatted_file)[1] <- "Date_time"
  
  
  ## Create new data frame that subsets the required dates
  subsetted_file <- subset(formatted_file, Date_time > "2007-01-31 23:59:59" & Date_time < "2007-02-03 00:00:00")
  rownames(subsetted_file) <- NULL
  subsetted_file[,2] <- as.numeric(subsetted_file[,2])
  subsetted_file[,3] <- as.numeric(subsetted_file[,3])
  subsetted_file[,4] <- as.numeric(subsetted_file[,4])
  subsetted_file[,5] <- as.numeric(subsetted_file[,5])
  subsetted_file[,6] <- as.numeric(subsetted_file[,6])
  subsetted_file[,7] <- as.numeric(subsetted_file[,7])
  
  ## Create plot2.png
  png(filename="plot2.png",width=480,height=480)
  plot(subsetted_file[,1], subsetted_file[,2], type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  dev.off()
  
}
