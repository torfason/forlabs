
# Unit tests for lbl_densify
test_that("Test for lbl_densify", {

  # Check if the function keeps levels for which there are no observations
  test_vector1 <- labelled(c(1, 2, 3), labels = c('One' = 1, 'Two' = 2, 'Three' = 3, 'Four' = 4), label = 'Numbers')
  densified_vector1 <- lbl_densify(test_vector1, unlabelled = "fill")

  expect_equal(ll_val_labels(densified_vector1), c('One' = 1, 'Two' = 2, 'Three' = 3, 'Four' = 4))

  # Check if the function correctly handles unlabelled observations when unlabelled = "fill"
  test_vector2 <- labelled(c(1, 2, 3, 4), labels = c('One' = 1, 'Two' = 2, 'Three' = 3), label = 'Numbers')
  densified_vector2 <- lbl_densify(test_vector2, unlabelled = "fill")

  expect_equal(ll_val_labels(densified_vector2), c('One' = 1, 'Two' = 2, 'Three' = 3, '<4>' = 4))

  # Check if the function correctly throws an error when unlabelled = "error"
  test_vector3 <- labelled(c(1, 2, 3, 4), labels = c('One' = 1, 'Two' = 2, 'Three' = 3), label = 'Numbers')

  expect_error(lbl_densify(test_vector3, unlabelled = "error"), "There are unlabelled values in x")

  # Check if the function correctly updates the values in the vector
  test_vector4 <- labelled(c(3, 3, 10, 10, 5), labels = c('Three' = 3, 'Five' = 5, 'Ten' = 10), label = 'Numbers')
  densified_vector4 <- lbl_densify(test_vector4, unlabelled = "error")

  expect_equal(as.numeric(densified_vector4), c(1, 1, 3, 3, 2))
})


test_that("densify works with empty labels", {

  # Densify should always error on ltrs_lbl, because <labelled<character>> is not supported
  ltrs_lbl <- ll_labelled(letters)
  expect_error(lbl_densify(ltrs_lbl), "x must not be of character type")
  expect_error(lbl_densify(ltrs_lbl, unlabelled = "fill"), "x must not be of character type")

  # Densify should error, unless unlabelled = "fill" is specified
  nums_lbl <- ll_labelled(c(1,10, 100))
  expect_error(lbl_densify(nums_lbl), "There are unlabelled values in x")
  expect_silent(lbl_densify(nums_lbl, unlabelled = "fill"))

  # These should all work, and unlabelled = "fill" should have no effect
  zero_lbl <- ll_labelled()
  expect_silent(lbl_densify(zero_lbl))
  expect_silent(lbl_densify(zero_lbl, unlabelled = "fill"))
  expect_equal(lbl_densify(zero_lbl), lbl_densify(zero_lbl, unlabelled = "fill"))
})
