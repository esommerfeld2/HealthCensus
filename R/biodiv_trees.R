#' Calculating Tree Biodiversity Index at the Quadrat Level as Measure of Tree Mortality
#'
#' @description Calculates tree biodiversity by quadrat as a function of tree mortality rate in a given quadrat using data on the species composition per quadrat, and merges the calculated biodiversity index values and mortality rate values back into the full dataset.
#' Specifically takes abundance of species at the quadrat level to compute biodiversity index values (Shannon index, effective number of species, species richness, maximum possible diversity, Pielou's evenness J) and appends these index values to each tree in the given quadrat.
#' @details Computes the abundance of tree species per quadrat based on the number of trees per species in each quadrat.
#' Then, it calculates the biodiversity indices mentioned in the description for each quadrat using functions from the 'vegan' package and merges these values back into the original dataset.
#' It also computes tree mortality rate per quadrat given the proportion of dead trees (as indicated by a value of either 'DN', 'DS', or 'DC' for the 'status' variable) compared to the total number of trees in that quadrat.
#' @param data A data set containing tree-level census data from a given year from 2021-2024.
#'
#' @return A data set that appends various biodiversity indices and the tree mortality rate for a given quadrat to the original data frame.
#' @export
#' @import vegan
#' @import dplyr
#' @import tidyr
#' @import tidyverse
#' @examples
#' biodiv_trees(data24)
#'
biodiv_trees <- function(data) {
# remove missing species values from data, make sure each row/tree (n()) per species is summarized by quad_sub_quad (quadrat)
mortality_trees <- data |>
filter(!is.na(species)) |>
mutate(dead = status %in% c("DS", "DN", "DC"))

bio.long <- mortality_trees |>
filter(!dead) |>
group_by(quad_sub_quad, species) |>
summarize(abundance = n())

# convert to wide format
bio.wide <- bio.long |>
  pivot_wider(names_from = species,
              values_from = abundance,
              values_fill = list(abundance = 0)) |>
  column_to_rownames("quad_sub_quad")

# calculate diversity index values

# shannon index (H)
shannon <- diversity(bio.wide)

# effective number of species
effective.sp <- exp(shannon)

# species richness
richness <- specnumber(bio.wide)

# maximum possible diversity
max.H <- log(richness)

# Pielou's evenness J
evenness.J <- shannon / max.H

# create data set with all diversity index values
bio.index <- data.frame(shannon, effective.sp, richness, max.H, evenness.J) |>
  rownames_to_column("quad_sub_quad")

# create a data set for mortality per quadrat
mortality <- mortality_trees |>
  group_by(quad_sub_quad) |>
  summarize(total_trees = n(),
            dead_trees = sum(dead),
            mortality_rate = dead_trees / total_trees)
# select quad_sub_quad to preserve quadrat/location metadata in final dataset
quadrat <- data |>
  select(quad_sub_quad) |>
  distinct()

# join bio.index to original data set
# quad_sub_quad is the "key" used to match up the two datasets
merged.df <- left_join(bio.index, mortality, by = "quadrat")
# return merged data frame with biodiversity indices and mortality per quadrat merged to original dataset
return(merged.df)
}
