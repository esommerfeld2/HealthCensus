#' Summary of Health Data
#'
#' @description
#' Prints the health summary statistics of the data set grouped by the given parameter.
#'
#' @details
#' For each categorical level the number of trees for each status is calculated. Additionally the mean and median percentage of crown intact and living is calculated.
#'
#' @param df the data frame you want a summary of
#' @param x represents the categorical column in the data set the data will be grouped by.
#'
#' @returns A data frame with a column with the name of the summary statistic, and a column with the resulting numbers for each level.
#' @export
#' @importFrom stats median
#' @import dplyr
#' @import tidyr
#'
#' @examples summary_health(data21, "crown_position")
#' summary_health(data22, "wounded_main_stem")
#'
summary_health <- function(df, x){

  #check to make sure x is a column in df
  if(is.null(df[[x]])){
    stop("Column not found in data frame")
  }

  #if x is a factor, sort by levels by the different levels hard coded into x
  if(is.factor(df[[x]])){
    levelsOfColumn <- levels(df[[x]])
  }else{
    levelsOfColumn <- unique(df[[x]])
  }

  #Create final data frame
  statistic_names <- c("A_count", "AU_count", "DC_count", "DN_count", "DS_count",
                       "mean_crown_living", "median_crown_living",
                       "mean_crown_intact", "median_crown_intact")
  final_df <- as.data.frame(statistic_names)

  #Set up counter for loop (and to add values later on)
  count <- 1

  #for each level, take summary statistics
  for(i in levelsOfColumn){

    #get rid of nas
    if(is.na(i)){
      next
    }

    #move counter
    count <- count + 1

    #Filter data
    status_stats <- df[df[[x]] == i, ]


    #Get the counts for each status
    final_stats_status <- status_stats |>
      filter(!is.na(.data[["status"]])) |>
      group_by(.data[["status"]]) |>
      summarise(
        count = n()
      )

    #if there are less than 10 lines of data
    if(sum(final_stats_status$count) < 10){
      warning(paste0(i, " has less than 10 data points"))
    }

    #Create column name based on where in the loop you are
    names(final_stats_status)[names(final_stats_status) == "count"] <- paste("result_for", x, as.character(i), sep = "_")

    #Rename everything to match
    final_stats_status <- final_stats_status |>
      mutate(statistic_names = case_when(
        status == "A" ~ "A_count",
        status == "AU" ~ "AU_count",
        status == "DC" ~ "DC_count",
        status == "DN" ~ "DN_count",
        status == "DS" ~ "DS_count"
      )) |>
      select(-status)

    #Add to the final data set
    final_df <- final_df |>
      left_join(final_stats_status, by = "statistic_names")

    #Adding in the mean and medians
    final_df[6,count] <- mean(status_stats$percentage_of_crown_living, na.rm = TRUE)
    final_df[7,count] <- median(status_stats$percentage_of_crown_living, na.rm = TRUE)
    final_df[8,count] <- mean(status_stats$percentage_of_crown_intact, na.rm = TRUE)
    final_df[9,count] <- median(status_stats$percentage_of_crown_intact, na.rm = TRUE)

  }

  #round the results to make the output look nicer
  final_df <- final_df |>
    mutate_if(is.numeric, round)

  #Return the final dataframe
  return(final_df)

}
