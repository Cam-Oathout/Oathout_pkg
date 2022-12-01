#' Data Clean-Up Function removes NA values in the csv data file
#'@param filepath where your data file is stored in R
#' 
#'@return if all NAs are removed then the last line in the console should be False, if NAs are not removed it will be True
#'
#'@export
#'
cleandata <- function(filepath){
  data_raw <- read_csv(filepath)
  clean <- na.omit(data_raw)
  check <- anyNA(clean)
  return(clean) 
}