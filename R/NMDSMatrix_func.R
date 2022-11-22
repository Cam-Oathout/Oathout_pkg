#' Creating an NMDS Matrix Function: Creating a matrix from your data frame to make an NMDS plot
#' 
#' @param data = object you named your data when you read it in
#' @param col1 = column from the data frame you want to use in your NMDS analysis, such as a column listing the names of your detected species
#' @param col2 = a different column from the data frame you want to use in your NMDS analysis, such as a count of your detected species
#' @param col3 = a different column from the others in the data frame you want to use in your NMDS analysis, such as different habitats or other relevent differences
#' 
#' @return matrix showing species counts for different habitats or other relevent differences  
#' 
#' 
#' 
#'  
NMDSmatrix <- function(data, col1, col2, col3) {
     speciesmatrix <- data %>% 
           select({{col1}}, {{col2}}, {{col3}}) %>% 
           group_by({{col2}}, {{col3}}) %>% 
           spread({{col2}}, {{col3}}) %>% 
           data.matrix(rownames.force = data$col2)
     return(speciesmatrix)
 } 