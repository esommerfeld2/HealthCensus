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
#' @examples
#' all_data <- comb_frame(data21, data22, data23, data24)
#'
comb_frame<- function(df, x){}
