#Data Clean-Up Function 

cleandata <- function(filepath){
  data_raw <- read_csv(filepath)
  clean <- na.omit(data_raw)
  check <- anyNA(clean)
  return(check) 
}

cleandata("Data/eDNA_data.csv")
