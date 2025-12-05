#' Getting a List of Quadrats with the Most or Least of a Tree Species
#'
#' @description
#' This function takes a data frame, species of tree and finds the quadrats with the most or least of this species.
#'
#' @details
#' Used to find quadrats with either the most or least of one species using counts. The data frame that is returned will contain the top 5 quadrats that meet this critera.
#'
#' @param df the data frame you want to search through
#' @param species the species you want to find
#' @param most default true, meaning you are getting quadrats with the most of that spieces, false means get the quadrats with the least of that species
#'
#' @returns data frame of top 5 quadrats and counts of trees per quadrat
#' @export
#' @import dplyr
#' @import tidyr
#'
#' @examples quad_species(data21, "querru", most = TRUE)
#' quad_species(data22, "tsugca", most= FALSE)
#'
quad_species <- function(df, species, most = TRUE){

  #fitler for one speices
  df_sp <- df[df[["species"]] == species, ]

  #extract the quadrat
  df_sp$quad <- substr(df_sp$quad_sub_quad, 1, 4)

  #find counts per quad + get top 5
  if(most){
    df_sp_count <- df_sp |>
      group_by(.data[["quad"]]) |>
      summarise(
        counts=  n()
      ) |> arrange(desc(.data[["counts"]])) |>
      slice(1:5)
  }else{
    df_sp_count <- df_sp |>
      group_by(.data[["quad"]]) |>
      summarise(
        counts=  n()
      ) |> arrange(.data[["counts"]]) |>
      slice(1:5)
  }

  return(df_sp_count)

}
