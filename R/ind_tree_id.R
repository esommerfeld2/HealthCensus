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
#' x <- comb_frame(data21, data22, data23, data24)
#' ind_tree_id(x, stem_tag_number = 174002)
#'
#ind_tree_id<- function(all_data, stem_tag){
 # all_data2 <- all_data
 # stem_tag2 <- stem_tag

  #We will have to document all_data for this function to work, for now I changed it to be the object data21 so our tests pass
  #But later we will document so this function makes sense
#}

#safety checks?
ind_tree_id <- function(all_data, stem_tag_number) {
  finaldf<- all_data %>%
    dplyr::filter(.data[["stem_tag"]] == stem_tag_number)
  return(finaldf)

}
