#' Predicts Future Tree Survival Based on Past Health
#'
#' @description
#' `future_tree()` estimates the chances of a tree surviving into a
#' future year based on its observed health measurements across the 2021–2024
#' data set. The function uses probabilities to generate a prediction of survival status based on status and varying levels of external damage/sickness observed.
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
#' # Generate the combined dataset
#' all_data <- comb_frame(data21, data22, data23, data24)
#' future_tree(all_data, stem_tag = 11769)
future_tree <- function(all_data, stem_tag, method = "mean_prob") {
  treeodds <- all_data[all_data$stem_tag == stem_tag, ]
  if (nrow(treeodds) == 0) stop("No data found for this stem_tag")
  required_cols <- c("status", "wounded_main_stem", "canker_swelling_deformity", "rotting_trunk")
  if (!all(required_cols %in% names(treeodds))) stop("Data must include status and severity columns for AU trees")

  treeodds <- treeodds[order(treeodds$year), ]
  survival_prob <- numeric(nrow(treeodds))

  for (i in seq_len(nrow(treeodds))) {
    treestate <- treeodds$status[i]

    if (treestate == "A") {
      survival_prob[i] <- 0.95
    } else if (treestate == "AU") {
      severity_values <- c(treeodds$wounded_main_stem[i],
                           treeodds$canker_swelling_deformity[i],
                           treeodds$rotting_trunk[i])
      # NA observations
      if (all(is.na(severity_values))) {
        severity <- 0.5
      } else {
        severity <- mean(severity_values, na.rm = TRUE) / 3
      }
      survival_prob[i] <- 0.95 - 0.7 * severity
      survival_prob[i] <- max(survival_prob[i], 0)
    } else if (treestate %in% c("DS", "DG", "DN")) {
      survival_prob[i] <- 0
    } else {
      survival_prob[i] <- NA
    }
  }

  year_probs <- data.frame(
    year = treeodds$year,
    status = treeodds$status,
    wounded_main_stem = treeodds$wounded_main_stem,
    canker_swelling_deformity = treeodds$canker_swelling_deformity,
    rotting_trunk = treeodds$rotting_trunk,
    prob = survival_prob
  )

  list(
    stem_tag = stem_tag,
    last_year = treeodds$year[nrow(treeodds)],
    next_year_survival_prob = survival_prob[nrow(treeodds)],
    year_probs = year_probs
  )
}
