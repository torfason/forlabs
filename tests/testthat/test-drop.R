
# Unit tests for lbl_drop
test_that("lbl_drop works as expected", {

  # Drop unused levels from a fruity vector
  x <- fruit_lbl |> purrr::discard(~.x %in% c(2,4))
  actual <- x |> lbl_drop() |> ll_val_labels()
  expected <- x |> ll_val_labels()  |> purrr::discard(~.x %in% c(2,4))
  expect_equal(actual, expected)

})

test_that("drop works with empty labels", {
  ltrs_lbl <- ll_labelled(letters)
  expect_silent(lbl_drop(ltrs_lbl))

  zero_lbl <- ll_labelled()
  expect_silent(lbl_densify(zero_lbl))
})
