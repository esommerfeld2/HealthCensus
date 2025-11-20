#' Links tree IDs to track individual tree information over the course of 4 years
#'
#' @description
#' `ind_tree_id()` links data in the datasets by individual tree ID (`stem_tag`) to track
#' individual tree health over the span of the study. Extracts each individual tree record and allows users to view
#' how a tree's health indices change over the 2021–2024 period. Ideally used after the `comb_frame()` function.
#'
#' @usage
#' ind_tree_id(all_data, stem_tag)
#'
#' @param all_data The combined Harvard Forest dataset from `comb_frame()`
#' @param stem_tag The individual tree ID
#'
#' @return
#' A small data frame containing the entries for a particular tree across the four
#' sample years.
#'
#' @examples
#' ind_tree_id(all_data, stem_tag = 174002)
#'
ind_tree_id<- function(all_data, stem_tag){}
