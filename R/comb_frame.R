#' Combine the data frames from multiple years into a single data frame
#'
#' @description
#' `comb_frame()` merges the data frames from each year in the package into one
#' data frame. It creates a seperate `year` categorical variable for the data across the years 2021-2024
#'
#' @usage
#' comb_frame(data21, data22, data23, data24)
#'
#' @param data21 A data frame containing the tree data frame for year 2021
#' @param data22 A data frame containing the tree data frame for year 2022
#' @param data23 A data frame containing the tree data frame for year 2023
#' @param data24 A data frame containing the tree data frame for year 2024
#'
#' @return
#' A data frame containing all cleaned and combined observations across the
#' four years, with a new column of the categorical variable `year`.
#'
#' @export
#' @import dplyr
#' @examples
#' comb_frame(data21, data22, data23, data24)
#'
# comb_frame<- function(data21, data22, data23, data24){
#   #To get rid of warnings about our parameters
#   data212 <- data21
#   data222<- data22
#   data232 <- data23
#   data242 <- data24
# }

comb_frame <- function(data21, data22, data23, data24) {
#safety check to see if user put in dataframe
  if (!all(sapply(list(data21, data22, data23, data24), is.data.frame))) {
    stop("Only input data frames!")
  }
#safety check to see if data frames columns match before binding
  cols <- list(names(data21), names(data22), names(data23), names(data24))
  if (!all(sapply(cols, identical, cols[[1]]))) {
    stop("Column names do not match")
  }

  data21 <- dplyr::mutate(data21, year = 2021)
  data22 <- dplyr::mutate(data22, year = 2022)
  data23 <- dplyr::mutate(data23, year = 2023)
  data24 <- dplyr::mutate(data24, year = 2024)

  dplyr::bind_rows(data21, data22, data23, data24)
}
