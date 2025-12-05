test_that("quad_species works", {

  #Setting up needed data frames to test
  ts_top <- data21 |>
    filter(species == "tsugca")
  ts_top$quad <- substr(ts_top$quad_sub_quad, 1, 4)
  created_data_top <- quad_species(data21, "tsugca")
  ts_top <- ts_top |>
    group_by(quad) |>
    summarise(
      counts=  n()
    ) |> arrange(desc(counts)) |>
    slice(1:5)

  #Lower Portion
  ts_bottom <- data21 |>
    filter(species == "tsugca")
  created_data_bottom <- quad_species(data21, "tsugca", FALSE)
  ts_bottom$quad <- substr(ts_bottom$quad_sub_quad, 1, 4)
  ts_bottom <- ts_bottom |>
    group_by(quad) |>
    summarise(
      counts=  n()
    ) |> arrange(counts) |>
    slice(1:5)

  #test that data frames match
  expect_equal(created_data_top, ts_top)
  expect_equal(created_data_bottom, ts_bottom)

  #make sure that if species aren't in data frame error is thrown
  expect_error(quad_species(data21, "tsugc"))

})
