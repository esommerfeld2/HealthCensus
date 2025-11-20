test_that("summary health works", {

  #Setting up needed data frames to test
  cp1<- data21 |>
    filter(crown_position == "3")
  created_data <- summary_health(data21, "crown_position")

  #test that means match
  expect_equal(created_data[7,2], mean(cp1$percentage_of_crown_living, na.rm = TRUE))
  expect_equal(created_data[9,2], mean(cp1$percentage_of_crown_intact, na.rm = TRUE))

  #test that medians match
  expect_equal(created_data[8,2], median(cp1$percentage_of_crown_living, na.rm = TRUE))
  expect_equal(created_data[10,2], median(cp1$percentage_of_crown_intact, na.rm = TRUE))

  #test that counts add up
  sums_from_function <- apply(created_data[c(1:5), c(2:6)], 1, function(x) sum(x, na.rm = TRUE))
  sums_from_function <- unname(sums_from_function)
  sums_manually <- data21 |>
    filter(!is.na(crown_position), !is.na(status)) |>
    group_by(status) |>
    summarise(count = n()) |>
    pull()
  expect_equal(sums_manually, sums_from_function)


  #make sure that NAs are handled correctly I DON'T THINK IT IS NA COLUMN WACK
  #going to remove all NAs for simplcity check later
  data_na <- cp1 |>
    filter(status == "A")

  #make sure that if objects aren't correct error is thrown
  #expect_error(1 / "a")


})
