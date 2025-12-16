test_that("sum_trees works", {
   data <- data23 |>
     filter(species == "pinure")

   tree_sums <- sum_trees(data23, "species")
   # test that counts match manually computed values
   manual_counts <- data23 |>
     filter(!is.na(species)) |>
     group_by(species) |>
     summarize(n=n())

   # order 'data' the same way
   result_ordered <- result |>
     arrange('Categorical Variable')

   # test that each row's n matches manual calculation
   expect_equal(result_ordered$n,
     manual_counts$n)

   # test that column renaming is correct
   expect_true("Categorical Variable" %in% names(result))
   expect_false("species" %in% names(result))

   # test that error is thrown if column is not in data frame
   expect_error(sum_trees(data23, "height"))

   # test that function does not break if dataset has only one category
   data_one <- data23 |>
     filter(species == "tsugca")   # only one level

   single_result <- sum_trees(data_one, "species")

   expect_equal(single_result$n, nrow(data_one))
   expect_equal(nrow(single_result), 1)

})
