#' Mean Grouped
#'
#' @description
#' This function takes the mean of some argument x grouped by some categorical variable y.
#'
#' @details
#' The function will take x, which will be a column from a data frame containing numeric data, and then it will take the mean of the values. If no categorical variable y is provided, it will simply take the total mean of the values. If y is provided, it will group the data by that variable and return the mean value for each group. The function can only be used on data frames, and x must be numeric while y must be categorical.
#'
#' @param x represents the column of the data frame the function will take the mean of.
#' @param y represents the categorical value the data will be grouped by.
#' @param ... any additional arguments passed to the base mean function.
#'
#' @returns A data frame with a column of names of the groups in y, and another column with the resulting means.
#' @export
#'
#' @examples mean_grouped(x= data21$dbh, y= data21$status)
#' mean_grouped(data22$percentage_of_crown_living, data22$crown_position)
mean_grouped <- function(x, y,...)
{
  mean(x)
}
