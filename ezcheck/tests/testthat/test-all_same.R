
test_that("all_same handles empty input", {
  expect_equal(all_same(c()), FALSE)
  expect_equal(all_same(data.frame()), FALSE)
})

test_that("all_same handles vectors", {
  expect_equal(all_same(c(1, 1, 1)), TRUE)
  expect_equal(all_same(c(1, 2, 1)), FALSE)
  expect_equal(all_same(c("a", "a", "a")), TRUE)
  expect_equal(all_same(c("a", "b", "a")), FALSE)
})

test_that("all_same handles NAs", {
  expect_equal(all_same(c(NA, NA, NA)), TRUE)
  expect_equal(all_same(c(NA, 1, 1), na.rm = TRUE), TRUE)
  expect_equal(all_same(c(NA, 1, 1), na.rm = FALSE), FALSE)
})

test_that("all_same handles factors", {
  expect_equal(all_same(factor(c("A", "A", "A"))), TRUE)
  expect_equal(all_same(factor(c("A", "B", "A"))), FALSE)
})

test_that("all_same handles lists", {
  expect_equal(all_same(list(1, 1, 1)), TRUE)
  expect_equal(all_same(list(1, 2, 1)), FALSE)
  expect_equal(all_same(list(TRUE, TRUE)), TRUE)
})

test_that("all_same handles data frames (by.col = TRUE)", {
  df <- data.frame(a = c(1, 1, 1), b = c(2, 2, 2))
  expect_equal(all_same(df, by.col = TRUE, return_list = TRUE), c(TRUE, TRUE))
  expect_equal(all_same(df, by.col = TRUE), TRUE)

  df2 <- data.frame(a = c(1, 1, 1), b = c(2, 3, 2))
  expect_equal(all_same(df2, by.col = TRUE, return_list = TRUE), c(TRUE, FALSE))
  expect_equal(all_same(df2, by.col = TRUE), FALSE)
})

test_that("all_same handles data frames (by.col = FALSE)", {
  df <- data.frame(a = rep(5, 3), b = rep(5, 3))
  expect_equal(all_same(df, by.col = FALSE), TRUE)

  df <- data.frame(a = 1:3, b = 1:3)
  expect_equal(all_same(df, by.col = FALSE), FALSE)
})

test_that("all_same handles data frames containing NAs", {
  df <- data.frame(a = c(NA, 1, 1), b = c(1, 1, 1))
  expect_equal(all_same(df, by.col = FALSE, na.rm = TRUE), TRUE)
  expect_equal(all_same(df, by.col = FALSE, na.rm = FALSE), FALSE)
})
