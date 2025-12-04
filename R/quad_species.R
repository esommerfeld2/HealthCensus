#' Getting a List of Quadrats with the Most or Least of a Tree Species
#'
#' @description
#' WRITE
#'
#' @details
#' WRITE
#'
#' @param df the data frame you want to search through
#' @param species the species you want to find
#' @param most defulat true, meaning you are getting quadrats with the most of that spieces
#'
#' @returns list of top 5 quadrats
#' @export
#' @import dplyr
#' @import tidyr
#'
#' @examples quad_species(data21, "SP", most = TRUE)
#' quad_species(data22, "SP", most= FALSE)
#'
quad_species <- function(df, species, most = TRUE){

  if(most){
    df <- df
  }




}
