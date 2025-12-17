test_that("sum_trees works", {
   tree_sums <- sum_trees(data23, "species")

   # test that column names in tibble output are correct
   expect_true("Categorical Variable" %in% names(tree_sums))
   expect_true("n" %in% names(tree_sums))

   # test that counts match
   counts_match <- data23 |>
     filter(!is.na(species)) |>
     group_by(species) |>
     summarise(n = n()) |>
     rename('Categorical Variable' = species)

   expect_equal(tree_sums |> arrange('Categorical Variable'),
                counts_match |> arrange('Categorical Variable'))

   # test that error is thrown by function if column does not exist in data frame
   expect_error(sum_trees(data23, "location"),
                "cat_var must match the name of a column in the dataset.")
})
