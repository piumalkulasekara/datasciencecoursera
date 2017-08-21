library("data.table")

pollutantmean <- function(directory, pollutant, id = 1:332){

  #append .cvs to a number
  files <- paste0(directory,'/', formatC(id, width = 3, flag = "0"),".csv")
  
  #Making one large data table
  list <- lapply(files, data.table::fread)
  dataTabel <- rbindlist(list)
  
  if(c(pollutant) %in% names(dataTabel)){
    return(dataTabel[, lapply(.SD, mean, na.rm = TRUE), .SDcols = pollutant][[1]])
  }
  
}


