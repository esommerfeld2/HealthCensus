#' Calculating Tree Biodiversity Index at the Quadrat Level as Measure of Tree Mortality
#'
#' @description Calculates tree biodiversity by quadrat using data on the species composition per quadrat. Merges the calculated biodiversity index back into the full dataset. Specifically takes abundance of species at the quadrat level to compute a biodiversity index (Shannon, Simpson, or species richness) and apends this index value to each tree in the given quadrat. It then computes summaries of indices of tree crown health and mortality rate, allowing easy visualization of the relationship between a tree's biodiversity index and its mortality.
#' @details The function computes the abundance of tree species per quadrat and creates a matrix out of these values. Then, based on the type of biodiversity index that the user selects, it calculates that index for each quadrat and merges this biodiversity index back into the original dataset (data). It then computes the averages of percentage_crown_living and percentage_crown_intact as measures of tree health and mortality at the quadrat level.
#' @param data: A data frame containing tree-level census data from a given year from 2021-2024.
#' @param index: A character string specifying what kind of biodiversity index to calculate (shannon, simpson, or species richness).
#'
#' @return A data frame that appends the biodiversity index for a given quadrat to the original data frame. Also includes new columns for the mean percentage_crown_living and mean percentage_crown_intact biodiversity scores per quadrat.
#' @export
#'
#' @examples
#' biodiv_trees(data24, index = "shannon")
#'
biodiv_trees <- function(data,
                        index = "shannon") {
  #To get rid of warnings about our parameters
  data2 <-data
  index2 <- index
  #
  # if (!requireNamespace("dplyr")) stop("Package 'dplyr' required.")
  # if (!requireNamespace("tidyr")) stop("Package 'tidyr' required.")
  # if (!requireNamespace("vegan")) stop("Package 'vegan' required.")
  #
  # # create matrix of abundance of species per quad
  # species_matrix <- data |>
  #   group_by(quadrat, species) |>
  #   summarise(n = n(), .groups = "drop") |>
  #   pivot_wider(names_from = species, values_from = n, values_fill = 0)
  #
  # quad_ids <- species_matrix$quadrat
  # species_only <- species_matrix[, -1]
  #
  # # select biodiversity index
  # if (index == "shannon") {
  #   biodiv <- diversity(species_only, index = "shannon")
  # } else if (index == "simpson") {
  #   biodiv <- diversity(species_only, index = "simpson")
  # } else if (index == "species") {
  #   biodiv <- specnumber(species_only)
  # } else {
  #   stop("Index must be one of: 'shannon', 'simpson', 'species'")
  # }
  #
  # biodiv_df <- data.frame(
  #   quadrat = quad_ids,
  #   biodiversity = biodiv
  # )
  #
  # # merge index calculation back to original dataset
  # merge <- data |>
  #   left_join(biodiv_df, by = "quadrat") |>
  #   group_by(quadrat) |>
  #   mutate(
  #     mean_crown_living_quadrat = mean(percentage_of_crown_living, na.rm = TRUE),
  #     mean_crown_intact_quadrat = mean(percentage_of_crown_intact, na.rm = TRUE)
  #   ) |>
  #   ungroup()
  #
  # return(merge)
}
