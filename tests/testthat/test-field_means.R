test_that("multiplication works", {
  #Function using dpylr
  data21_na <- data21 |>
    filter(!is.na(status))
  man_output<- data21_na |> group_by(status) |>
    summarise(dbh_mean = mean(dbh, na.rm = TRUE))

  #using the actual function
  function_output <- field_means(data21, "dbh", "status")

  #test that means match
  expect_equal(man_output[[1,2]], function_output[1,2])
  expect_equal(man_output[[2,2]], function_output[2,2])
  expect_equal(man_output[[3,2]], function_output[3,2])
  expect_equal(man_output[[4,2]], function_output[4,2])
  expect_equal(man_output[[5,2]], function_output[5,2])

  #test that correct errors are thrown
  expect_error(field_means(data21, "db", "status"))
  expect_error(field_means(data21, y= "dbh", x= "status"))
  expect_error(field_means(data21, "dbh", "stat"))


})
