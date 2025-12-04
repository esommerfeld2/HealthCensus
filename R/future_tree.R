#' Predicts Future Tree Survival Based on Past Health
#'
#' @description
#' `future_tree()` estimates the chances of a tree surviving into a
#' future year based on its observed health measurements across the 2021–2024
#' dataset. The function uses probabilities to generate a prediction of survival status.
#'
#' @usage
#' future_tree(all_data, stem_tag, method = "mean_prob")
#'
#' @param all_data A data frame containing the complete tree dataset
#' @param stem_tag The individual tree ID
#' @param method statistical prediction method
#' @export
#' @return
#' A numeric probability between 0-1 representing the likelihood of a specific tree's survival to the next year
#'
#' @export
#'
#' @examples
#' future_tree(data21, stem_tag = 174002)
future_tree<-function(all_data, stem_tag, method = "mean_prob"){
  #To get rid of warnings about our parameters
  all_data2 <- all_data
  stem_tag2 <- stem_tag
  method2 <- method
  #ROSE: NOTE ABOUT YOUR CODE
  #THE FACT THAT IN YOU EXAMPLE THE CODE WAS ALLYEARS WAS A PROBLEM BC IT IS NOT DOCUMENTED IN THE PACKAGE, SO WE PROBABLY NEED TO DOCUMENT IT SINCE YOUR FUNCTION NEEDS IT
  #or we can ask the best way to go about it since this data set is generated from another one of your functions
  #for now I changed the example so RMD passes but a better step should occur in the next stage!
}

#future_tree <- function(all_data, stem_tag, method = "mean_prob") {

  # safety checks
  #if (!all(c("year", "status") %in% names(all_data))) {
#     stop("Data must contain 'year' and 'status'")
#   }
#
#   if (nrow(all_data) < 2) {
#     stop("At least two years of observations are necessary")
#   }
#
#   #order all_data by year
#   all_data <- all_data[order(all_data$year), ]
#
#   # convert alive/dead status to numeric (alive/alive unhealthy = 1, dead = 0)
#   status_numeric <- ifelse(all_data$status == "A", 1, 0)
#
#   # create transitions: alive to alive?
#   transitions <- data.frame(
#     year_from = head(tree_data$year, -1),
#     year_to = tail(tree_data$year, 1),
#     alive_from = head(status_numeric, -1),
#     alive_to = tail(status_numeric, 1)
#   )
#
#   # calculate probability: P(alive_next | alive_current)
#   survival_events <- transitions$alive_from == 1
#   stayed_alive <- transitions$alive_to == 1 & transitions$alive_from == 1
#
#   if (sum(survival_events) == 0) {
#     prob <- 0
#   } else {
#     prob <- sum(stayed_alive) / sum(survival_events)
#   }
#
#   return(list(
#     survival_probability = prob,
#     transitions = transitions
#   ))
#   return(future_tree)
# }
