
test_that("count_unique handles empty input", {
  expect_equal(count_unique(c()), NA)
  expect_equal(count_unique(c(), val_for_empty = 0), 0)
  expect_equal(count_unique(data.frame()), NA)
})

test_that("count_unique counts unique vals in vectors", {
  expect_equal(count_unique(c(1, 2, 1, 3)), 3)
  expect_equal(count_unique(c("a", "b", "a")), 2)
  expect_equal(count_unique(c(1, 1, 1)), 1)
})

test_that("count_unique handles NA", {
  expect_equal(count_unique(c(1, NA, 2), na.rm = TRUE), 2)
  expect_equal(count_unique(c(1, NA, 2), na.rm = FALSE), 3)
  expect_equal(count_unique(c(NA, NA), na.rm = TRUE), NA)
})

test_that("count_unique handles factors", {
  f <- factor(c("A", "B", "A"))
  expect_equal(count_unique(f), 2)
})

test_that("count_unique handles data frames", {
  df <- data.frame(x = c(1, 1, 2), y = c(3, 3, 3))
  expect_equal(count_unique(df), 3)
})

test_that("count_unique returns the unique_vals when show_vals = TRUE", {
  result <- count_unique(c(1, 2, 1), show_vals = TRUE)
  expect_equal(result, list(unique_count = 2, unique_vals = c(1, 2)))
})
