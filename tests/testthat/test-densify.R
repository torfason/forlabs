
# Unit tests for lbl_densify
test_that("Test for lbl_densify", {

  # Check if the function keeps levels for which there are no observations
  test_vector1 <- labelled::labelled(c(1, 2, 3), labels = c('One' = 1, 'Two' = 2, 'Three' = 3, 'Four' = 4), label = 'Numbers')
  densified_vector1 <- lbl_densify(test_vector1, unlabelled = "fill")

  expect_equal(labelled::val_labels(densified_vector1), c('One' = 1, 'Two' = 2, 'Three' = 3, 'Four' = 4))

  # Check if the function correctly handles unlabelled observations when unlabelled = "fill"
  test_vector2 <- labelled::labelled(c(1, 2, 3, 4), labels = c('One' = 1, 'Two' = 2, 'Three' = 3), label = 'Numbers')
  densified_vector2 <- lbl_densify(test_vector2, unlabelled = "fill")

  expect_equal(labelled::val_labels(densified_vector2), c('One' = 1, 'Two' = 2, 'Three' = 3, '<4>' = 4))

  # Check if the function correctly throws an error when unlabelled = "error"
  test_vector3 <- labelled::labelled(c(1, 2, 3, 4), labels = c('One' = 1, 'Two' = 2, 'Three' = 3), label = 'Numbers')

  expect_error(lbl_densify(test_vector3, unlabelled = "error"), "There are unlabelled values in x")

  # Check if the function correctly updates the values in the vector
  test_vector4 <- labelled::labelled(c(3, 3, 10, 10, 5), labels = c('Three' = 3, 'Five' = 5, 'Ten' = 10), label = 'Numbers')
  densified_vector4 <- lbl_densify(test_vector4, unlabelled = "error")

  expect_equal(as.numeric(densified_vector4), c(1, 1, 3, 3, 2))
})
