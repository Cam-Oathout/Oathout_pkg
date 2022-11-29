#' Presence Absence Function: Visualizing the presence or absence of a species based on other parameters in the data set.
#'
#'@param data = object you named your data when you read it in
#'@param x = column from the data frame you want to go on the x axis
#'@param y = column from the data frame you want to go on the y axis
#'@param col = column from the data frame you want to file the tiles for presence absence data
#'
#'@return ggplot showing presence absence of a species in the data frame
#'
#'
pres.abs.plot <- function(data, x, y, col){
  plot <- ggplot(data, aes({{x}}, {{y}}, fill = {{col}})) +
           geom_tile(show.legend = TRUE)
     return(plot)
}