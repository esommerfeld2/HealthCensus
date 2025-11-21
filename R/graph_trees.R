#' Generating Visualizations for Measures of Tree Health, Mortality, and Biodiversity
#'
#' @description Generates visualizations from the dataset for a given year between 2021-2024. Can include the apended quadrat-level biodiversity (output of biodiv_trees() function) if the user chooses. Automatically produces various user-friendly/easily-interpretable graphs based on the data that can be used to analyze tree health, mortality/status, and biodiversity. Users can select which type of graph which variables they would like to use to analyze the data.
#'
#' @details This function is designed to help users more efficiently explore relationships between key variables like biodiversity, crown condition (percentage intact and percentage living, for example), and categorical variables such as mortality status and factors associated with death (fad). ggplot2 is required to run this function.
#'
#' @param data A data frame containing tree health metrics, either at the individual tree level or at the quadrat level depending on whether or not the output of the biodiv_trees() function is used.
#'
#' @param graph_type A character string indicating which type of plot to generate.
#'
#' @param health_tree Character string specifying which variable that constitutes an indice of tree health to plot, with the default variable in this function being percentage_crown_living.
#'
#' @return A ggplot2 graphics object that prints the graph/plot to the user screen.
#' @export
#' @import ggplot2
#' @examples
#' graph_trees(data21, graph_type = "biodiv_mortality")
#' graph_trees(data23, graph_type = "status_bar")
graph_trees <- function(data,
                        graph_type = c("crown_position", "biodiv_mortality", "health_dist", "status_bar"),
                        health_tree = "percentage_crown_living") {
  data2 <- data
  graph_type2 <- graph_type
  health_tree2 <- health_tree

  # if (!requireNamespace("ggplot2"))
  #   stop("Package 'ggplot2' is required.")
  #
  #
  # # graph types
  # if (graph_type == "crown_position") {
  #   graph <- ggplot(data, aes(x = crown_position, y = percentage_crown_living)) +
  #     geom_point(alpha = 0.6) +
  #     geom_smooth(method = "lm", linewidth = 0.9) +
  #     labs(
  #       x = "Crown Position in Canopy",
  #       y = "Percentage of Crown Living",
  #       title = "Crown Position vs. Proportion of Crown Living"
  #     )
  #
  # # } else if (graph_type == "biodiv_mortality") {
  # #   graph <- ggplot(data, aes(x = biodiversity, y = .data[[health_tree]])) +
  # #     geom_point(alpha = 0.6) +
  # #     geom_smooth(method = "lm", linewidth = 0.9) +
  # #     labs(
  # #       x = "Biodiversity (Shannon Index)",
  # #       y = paste("Tree Health:", health_var),
  # #       title = paste("Tree Health vs. Biodiversity:", health_tree)
  # #     )
  # #
  #  } else if (graph_type == "health_dist") {
  #   graph <- ggplot(data, aes(x = .data[[health_tree]])) +
  #     geom_density(fill = "green", alpha = 0.5) +
  #     labs(
  #       x = paste("Tree Health:", health_tree),
  #       y = "Percentage of Crown Intact",
  #       title = paste("Distribution of", health_tree)
  #     )
  #
  # } else if (graph_type == "status_bar") {
  #   status_df <- data |>
  #     select(status, percentage_of_crown_intact)
  #
  #   mortality <- ggplot(status_df, aes(x = factor(status), y = percentage_of_crown_intact)) +
  #     geom_col(fill = "green") +
  #     labs(
  #       x = "Status (Alive/Dead)",
  #       y = "Percentage of Crown Intact",
  #       title = "Proportion of Crown Intact Based on Mortality Status"
  #     )
  #
  # } else {
  #   stop("Invalid plot type. Choose: 'crown_position', 'biodiv_mortality',
  #        'health_dist', 'status_bar'.")
  # }
  #
  # print(graph)
}
## could come up with idea to make plot for FAD? either way these are very rudimentary ideas
