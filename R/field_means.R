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
#' A data frame a one row for each level of `y` (the categorical variable) containing the mean of `x` (the numeric variabl
#'
#' @importFrom stats aggregate as.formula
#' @export
#' @examples
#' field_means(data21, x = "dbh", y = "species")
#'

field_means <- function(data, x, y) {
  # Make a local copy of the dataset so it doesn't alter variables elsewher
  dfformean <- data
  # make year into factor instead of numeric var
  if ("year" %in% colnames(dfformean)) {
    dfformean$year <- as.factor(dfformean$year)
  }
  #get rid of irrelevant columns
  exclude_cols <- c("notes", "stem_tag","qx","qy")
  # assign numeric and categorical to the columns, excludes bad ones
  numeric_vars <- names(dfformean)[sapply(dfformean, is.numeric) & !(names(dfformean) %in% exclude_cols)]
  categorical_vars <- names(dfformean)[sapply(dfformean, function(x) is.factor(x) || is.character(x)) &
                                      !(names(dfformean) %in% exclude_cols)]
  # Check x input
  if (!(x %in% names(dfformean))) {
    stop(
      "`x` must be a numeric column in the provided data frame. Available numeric columns are: ",
      paste(numeric_vars, collapse = ", ")
    )
  }
  if (!(x %in% numeric_vars)) {
    stop(
      "`x` must be numeric. Available numeric columns are: ",
      paste(numeric_vars, collapse = ", ")
    )
  }

  # Check y input
  if (!(y %in% names(dfformean))) {
    stop(
      "`y` must be a categorical column in the provided data frame. Available columns are: ",
      paste(categorical_vars, collapse = ", ")
    )
  }
  if (!(y %in% categorical_vars)) {
    stop(
      "`y` must be categorical (character or factor). Available categorical columns are: ",
      paste(categorical_vars, collapse = ", ")
    )
  }

  aggregate_formula <- as.formula(paste(x, "~", y))
  result <- aggregate(aggregate_formula, data = dfformean, FUN = mean, na.rm = TRUE)
  names(result) <- c(y, paste0(x, "_mean"))
  return(result)
}
