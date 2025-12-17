#' Generating Visualizations for Measures of Tree Health, Mortality, and Biodiversity
#'
#' @description Generates visualizations from the dataset for a given year between 2021-2024.
#' Can include the appended quadrat-level biodiversity indices and mortality rates by quadrat if the user chooses.
#' Automatically produces various user-friendly graphs based on the data that can be used to analyze measures of tree health, mortality rate, and biodiversity.
#' Users can select which type of plot from the five options built into the function they would like to use to analyze the data.
#'
#' @details Designed to help users more efficiently explore relationships between significant variables like biodiversity, mortality rate, crown condition (percentage intact and percentage living), status/mortality, and factors associated with death (fad).
#' The ggplot2 package is required to run this function.
#'
#' @param data A data set containing tree health metrics, either at the individual tree level or at the quadrat level depending on whether or not the output of the biodiv_trees() function is used.
#'
#' @param plot_type A character string indicating which type of plot to generate.
#'
#' @param health_tree A character string specifying which variable that is a measure of tree health to plot, with the default variable in this function being percentage_crown_living.
#' Valid variable inputs include 'percentage_of_crown_intact' and 'percentage_of_crown_living'.
#'
#' @param biodiv_metric A character string specifying which quadrat-level biodiversity index the user wishes to use to plot biodiversity vs. mortality ('biodiv_mortality' plot).
#' Must be one of "shannon", "effective.sp", "richness", "max.H", or "evenness.J".
#' Can only be used when plot_type = "biodiv_mortality".
#'
#' @return A ggplot2 graphics object that prints the plot in the user's viewer window.
#' @export
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#' @examples
#' graph_trees(data21, plot_type = "biodiv_mortality", biodiv_metric = "shannon")
#' graph_trees(data23, plot_type = "health_dist", health_tree = "percentage_of_crown_living")
graph_trees <- function(data,
                        plot_type = c("crown_position", "biodiv_mortality", "health_dist", "status_bar"),
                        health_tree = "percentage_of_crown_living",
                        biodiv_metric = c("shannon", "effective.sp", "richness", "max.H", "evenness.J")) {
# five plot types
 if (plot_type == "crown_position") {
  crown <- ggplot(data, aes(x = .data[["crown_position"]], y = .data[["percentage_of_crown_living"]])) +
    geom_boxplot() +
    labs(x = "Crown Position in Canopy",
         y = "Percentage of Crown Living",
       title = "Proportion of Crown Living as Measure of Crown Position in Canopy") +
    theme_minimal()

  return(crown)
 } else if (plot_type == "biodiv_mortality") {
   # allow users to select any one of the biodiversity indices calculated in the biodiv_trees() function
   valid_inputs <- c("shannon", "effective.sp", "richness", "max.H", "evenness.J")
   if(!biodiv_metric %in% valid_inputs) {
     # print error message if no valid biodiversity index type is chosen
     stop("The chosen biodiversity metric must be one of: ",
          paste(valid_inputs, collapse = ", "))
   }
   if(!"mortality_rate" %in% names(data)) {
     # include mortality rate variable computed from  at quadrat level
     data <- biodiv_trees(data)
   }

    bio_mort <- ggplot(data, aes(x = .data[[biodiv_metric]], y = .data[["mortality_rate"]])) +
     geom_point() +
     geom_smooth(method = "lm", se = TRUE) +
     labs(
       x = biodiv_metric,
       y = "Mortality Rate",
        title = paste("Relationship Between Biodiversity and Mortality using", biodiv_metric)) +
      theme_minimal()
    return(bio_mort)
  # throws error if user selects column other than the variables specified in health_tree vector
  } else if (plot_type == "health_dist") {
    valid_health_inputs <- c("percentage_of_crown_living", "percentage_of_crown_intact")
    if(!all(health_tree %in% valid_health_inputs)) {
      stop("health_tree must be one of: ", paste(valid_health_inputs, collapse = ", "))
    }
    # throws error if user attempts to select more than one health_tree variable
    if(length(health_tree) > 1) {
      stop("Please select only one health_tree variable.")
    }
    # throws error if health_tree variable input made by user does not exist in the data set
    if(!all(health_tree %in% names(data))) {
      stop("health_tree variable input not found in the dataset.")
    }

  hdist <- ggplot(data, aes(x = .data[[health_tree]])) +
    geom_histogram(bins = 20, fill = "green") +
    labs(x = health_tree,
         y = "Number of Trees",
         title = paste("Distribution of", health_tree)) +
    theme_minimal()

  return(hdist)

  } else if (plot_type == "status_bar") {

   mortality <- ggplot(data, aes(x = .data[["status"]])) +
     geom_bar(fill = "blue") +
     labs(
       x = "Mortality Status",
       y = "Count",
       title = "Tree Mortality Status Distribution") +
     theme_minimal()

   return(mortality)
  } else if (plot_type == "fad_dist") {
    # separates observations with multiple levels of the fad variable into distinct rows
    fad_dist <- data |>
      filter(!is.na(.data[["fad"]])) |>
      separate_rows("fad", sep = ", \\s*")

    fad <- fad_dist |>
      ggplot(aes(x = .data[["fad"]])) +
      geom_bar() +
      labs(
        x = "Factors Associated with Death",
        y = "Count",
        title = "Frequency of Factors Associated with Tree Death") +
      theme_minimal()

    return(fad)
  }
    else {
   stop("Invalid plot type. Choose from: 'crown_position', 'biodiv_mortality',
       'health_dist', 'status_bar', 'fad_dist'.")
 }
}
