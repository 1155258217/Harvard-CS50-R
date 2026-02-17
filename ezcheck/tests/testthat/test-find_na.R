
test_that("find_na works with empty input", {
  expect_equal(find_na(c()), list())
  expect_equal(find_na(c(), show_count = TRUE), list(index = list(), na_count = 0))
})

test_that("find_na handles vectors", {
  expect_equal(find_na(c(1, NA, 2, NA)), list(2,4))
  expect_equal(find_na(c(1, 2, 3)), list())
  result <- find_na(c(1, NA, 2, NA), show_count = TRUE)
  expect_equal(result, list(index=list(2,4), na_count=2))
})

test_that("find_na handles factors", {
  f <- factor(c("A", NA, "B"))
  expect_equal(find_na(f, show_count = TRUE), list(index=list(2), na_count=1))
})

test_that("find_na handles arrays", {
  array <- array(c(1, NA, 3))
  expect_equal(find_na(array, show_count = TRUE), list(index=list(2), na_count=1))
})

test_that("find_na handles data frames", {
  df <- data.frame(x = c(1, NA, 3), y = c(NA, 2, 3))
  expect_equal(find_na(df), list(c(1,2), c(2,1)))
})

test_that("find_na handles lists", {
  list <- list(1, NA, 3)
  expect_equal(find_na(list), list(2))
})

test_that("find_na warns when the length of the element is > 1", {
  list <- list(1, c(2,3), NA)
  expect_warning(find_na(list))
  expect_equal(suppressWarnings(find_na(list)), list(3))
})

test_that("find_na returns NA and warns unsupported types (e.g. function)", {
  expect_warning(find_na(mean))
  expect_equal(suppressWarnings(find_na(mean)), NA)
})
