#' Adding Column Counts Function: Creating a new column counting values in a row across columns
#'
#' @param data = object you named your data when you read it in
#' @param col1 = column name where you want your row count to begin
#' @param col2 = = column name where you want your row count to end 
#' 
#' @return if new count column is added the tibble/df should be returned with one more column number than your original data frame
#' 
#' @examples 
#' addcol(df, "column1", "column5")
#' 
#' 
addcol <- function(data, col1, col2){
  check1 <- ncol(data)
  newcol <- data %>% rowwise() %>% mutate(n = sum(c_across(col1:col2)))
  check2 <- ncol(newcol)
  check2 == check1+1
  return(newcol)
}