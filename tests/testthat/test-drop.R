
# Unit tests for lbl_drop
test_that("lbl_drop works as expected", {

  # Drop unused levels from a fruity vector
  x <- fruit_lbl |> purrr::discard(~.x %in% c(2,4))
  actual <- x |> lbl_drop() |> val_labels()
  expected <- x |> val_labels()  |> purrr::discard(~.x %in% c(2,4))
  expect_equal(actual, expected)

})
