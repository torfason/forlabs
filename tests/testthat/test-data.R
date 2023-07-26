
test_that("Example data are of correct types", {
  expect_equal(typeof(fruit_lbl), "double")
  expect_equal(typeof(fruit_lbl_int), "integer")
  expect_equal(typeof(fruit_lbl_chr), "character")
})

test_that("Example data converts correctly to/from factors", {
  expect_equal(to_factor(fruit_lbl),   fruit_fct)
  expect_equal(to_labelled(fruit_fct), fruit_lbl)
})

test_that("Counts are sane", {
  # Counts should match fct counts for all types of fruit_lbl,
  # apart from v (vals) and the type/name of the f/l column
  d.fct <- forcats::fct_count(fruit_fct) |>
    dplyr::mutate(l = as.character(f)) |>
    dplyr::select(l, n)
  expect_equal(lbl_count(fruit_lbl)[2:3],     d.fct)
  expect_equal(lbl_count(fruit_lbl_int)[2:3], d.fct)
  expect_equal(lbl_count(fruit_lbl_chr)[2:3], d.fct)
})
