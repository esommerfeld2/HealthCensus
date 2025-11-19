#' Data Frame Creation by Variable
#'
#' @description
#' Take one data frame and break it into individual data frames given a variable.
#'
#' @details
#' The orignal data frame will be broken up into several different data frames based on the categorical column provided. The new data frames will be stored in a list.
#'
#' @param df the data frame you want to break.
#' @param x represents the categorical column in the data set the data will be broken by.
#'
#' @returns A list of data frames, orginal column names from the provided data frame intact.
#' @export
#' @import dplyr
#' @import tidyr
#'
#' @examples df_break_by(data21, "crown_position")
#' df_break_by(data22, "species")
#'
df_break_by <- function(df, x){

# a function that does something :0

}
