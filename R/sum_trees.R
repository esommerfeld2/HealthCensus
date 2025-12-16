#' Sum Number of Trees per Level of Categorical Variable
#'
#' @description Calculates total number of trees for each level of a given categorical variable from the dataset for any given year between 2021-2024.
#' @param data A data frame for a given year between 2021-2024 containing tree health census data.
#' @param cat_var A character string which gives the name of the chosen categorical variable for which the number of trees per level will be counted, such as 'species', 'status', 'fad', etc.
#'
#' @return A tibble with two columns, the first of which will contain the names of the levels of the selected categorical variable, and the second of which contains the sum values for each level of the categorical variable.
#' @export
#' @import dplyr
#' @import tidyr
#' @examples
#' sum_trees(data23, "species")
#'
sum_trees <- function(data, cat_var) {

  # check that variable exists in dataset/matches name of column in dataset
  if (is.null(data[[cat_var]])) {
    stop("cat_var must match the name of a column in the dataset.")
  }

  # converting cat_var into a character object/symbol
 var <- sym(cat_var)

  # sum the number of trees for each level of the cat_var, use !! to evaluate var in group_by
  sums <- data |>
    group_by(!!var) |>
    summarize(n = n())

  # rename column in subsetted data
  sums <- sums |>
    rename('Categorical Variable' = !!cat_var)

  return(sums)
}

