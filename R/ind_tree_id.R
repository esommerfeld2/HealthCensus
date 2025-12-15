#' Links tree IDs to track individual tree information over the course of 4 years
#'
#' @description
#' `ind_tree_id()` links data in the datasets by individual tree ID (`stem_tag`) to track
#' individual tree health over the span of the study. Extracts each individual tree record and allows users to view
#' how a tree's health indices change over the 2021–2024 period. Ideally used after the `comb_frame()` function.
#'
#' @usage
#' ind_tree_id(all_data, stem_tag_number)
#'
#' @param all_data The combined Harvard Forest dataset from `comb_frame()`
#' @param stem_tag_number The individual tree ID
#'
#' @return
#' A small data frame containing the entries for a particular tree across the four
#' sample years.
#'
#' @export
#' @import dplyr
#'
#' @examples
#' all_data <- comb_frame(data21, data22, data23, data24)
#' ind_tree_id(all_data, 10001)
#'

ind_tree_id <- function(all_data, stem_tag_number) {

  if (!is.data.frame(all_data)) {
    stop("Please input a data frame")
  }

  if (!"stem_tag" %in% names(all_data)) {
    stop("Input must contain a 'stem_tag' column!")
  }

  finaldf <- dplyr::filter(all_data, .data[["stem_tag"]] == stem_tag_number)

  if (nrow(finaldf) == 0) {
    stop("No observations found for this particular stem_tag id")
  }

  return(finaldf)
}
