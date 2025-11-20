#' Sum Number of Trees per Level of Categorical Variable
#'
#' @description Calculates total number of trees for each level of a given categorical variable from the dataset for any given year between 2021-2024.
#' @param data: A data frame for a given year between 2021-2024 containing tree health census data.
#' @param cat_var: A character string which gives the name of the chosen categorical variable for which the number of trees per level will be counted, such as 'species', 'status', 'fad', etc.
#'
#' @return A tibble with two columns, the first of which will contain the names of the levels of the selected categorical variable, and the second of which contains the sum values for each level of the categorical variable.
#' @export
#'
#' @examples
#' sum_trees(data23, "species")
#'
#' # use to create a visualization
#' library(ggplot2)
#' sum_trees(data23, "species) |>
#'   ggplot(aes(x = Categorical Variable, y = n)) +
#'   geom_col() +
#'   labs(title = "Number of Trees per Species",
#'   x = "Species",
#'   y = "Count") +
#'   theme_minimal()
sum_trees <- function(data, cat_var) {
  if (!requireNamespace("dplyr")) {
    stop("Package 'dplyr' is required but not installed.")
  }

  # check that variable exists in dataset
  if (!cat_var %in% names(data)) {
    stop("cat_var must match the name of a column in the dataset.")
  }

  # sum the number of trees for each level of the cat_var
  summed <- data |>
    group_by(.data[[cat_var]]) |>
    summarize(n = n(), .groups = "drop")

  # rename column
  names(summed)[1] <- "Categorical Variable"

  return(summed)
}
