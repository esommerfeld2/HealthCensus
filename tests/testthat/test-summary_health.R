test_that("summary health works", {
  # test a simple case
  expect_equal(square(0), 0)

  # test against known value
  expect_equal(square(-1), 1)
  # test against base R function
  expect_equal(square(-1), 1^2)
  # test against itself
  expect_equal(square(-1), square(1))

  # test a range of values
  expect_equal(square(1:10), (1:10)^2)

  # weird edge cases
  expect_equal(square(-Inf), Inf)
})
