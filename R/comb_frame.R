#' Combine Annual Tree Data
#'
#' @description
#' `comb_frame()` merges the data frames from 2021–2024 into a single data frame.
#' It adds a categorical variable `year` to indicate the year of each observation.
#'
#' @usage
#' comb_frame(data21, data22, data23, data24)
#'
#' @param data21 Data frame for year 2021
#' @param data22 Data frame for year 2022
#' @param data23 Data frame for year 2023
#' @param data24 Data frame for year 2024
#'
#' @return
#' A combined data frame with all observations across the four years and a new
#' `year` column as a factor.
#'
#' @export
#'
#' @examples
#' combined <- comb_frame(data21, data22, data23, data24)
comb_frame <- function(data21, data22, data23, data24) {
  # check to make sure inputs are data frames
  if (!all(sapply(list(data21, data22, data23, data24), is.data.frame))) {
    stop("Only input data frames!")
  }

  # check that columns match
  cols <- list(names(data21), names(data22), names(data23), names(data24))
  if (!all(sapply(cols, identical, cols[[1]]))) {
    stop("Column names do not match")
  }

  # Add year column as categorical
  data21 <- dplyr::mutate(data21, year = factor(2021))
  data22 <- dplyr::mutate(data22, year = factor(2022))
  data23 <- dplyr::mutate(data23, year = factor(2023))
  data24 <- dplyr::mutate(data24, year = factor(2024))

  dplyr::bind_rows(data21, data22, data23, data24)
}
