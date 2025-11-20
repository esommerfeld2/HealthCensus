#' Data Frame Creation by Variable
#'
#' @description
#' Take one data frame and break it into individual data frames given a variable.
#'
#' @details
#' The original data frame will be broken up into several different data frames based on the categorical column provided. The new data frames will be stored in a list.
#'
#' @param df the data frame you want to break.
#' @param x represents the categorical column in the data set the data will be broken by.
#'
#' @returns A list of data frames, original column names from the provided data frame intact.
#' @export
#' @import dplyr
#' @import tidyr
#'
#' @examples df_break_by(data21, "crown_position")
#' df_break_by(data22, "species")
#'
df_break_by <- function(df, x){

  #Get levels
  levelsOfColumn <- unique(df[[x]])

  #Final list to return
  final_list <- list()

  #Loop through levels
  for(i in levelsOfColumn){

    #Ignore the NAs
    if(is.na(i)){
      next
    }

    #Filter data
    filtered_data <- df[df[[x]] == i, ]

    #add data frame to list
    newName <- paste("df_for", x, as.character(i), sep = "_")
    final_list[[newName]] <- filtered_data
  }

  #Return final list
  return(final_list)

  #This function was to simple to code?: next step add so that you can break by two levels

}
