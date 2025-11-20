#' Compute Means for each Numeric Tree Health Variable
#'
#' @description
#' `field_means()` calculates the mean of a numeric variable (like DBH,
#' percentage of crown living, etc.) grouped by a categorical variable (like the
#' species, crown position, or status).
#'
#' @usage
#' field_means(data, x, y)
#'
#' @param data A data frame with numeric data variables from the tree dataset
#' @param x A string naming the numeric variable to take the mean from
#' @param y A string naming the grouping categorical variable
#'
#' @return
#' A data frame a one row for each level of `y` (the categorical variable) containing the mean of `x` (the numeric variable)
#'
#' @examples
#' field_means(hf_data, x = "dbh", y = "species")
#'
field_means <-function(data, x, y)
{
  #To get rid of warnings about our parameters
  data2 <- data
  x2 <- x
  y2 <- y
}
