
# Unit tests for lbl_fill
test_that("lbl_fill works as expected", {

  # Create a labeled vector with unlabeled values
  lbl_vector <- labelled::labelled(c(1, 1, 2, 3),
                                   labels = c('One' = 1, 'Two' = 2),
                                   label = 'Numbers')

  # Fill the unlabeled values
  lbl_vector_filled <- lbl_fill(lbl_vector)

  # Check that the values are as expected
  expect_equal(lbl_vector_filled,
               labelled::labelled(c(1, 1, 2, 3),
                                  labels = c('One' = 1, 'Two' = 2, '<3>' = 3),
                                  label = 'Numbers'))

  # Check that the labels are as expected
  expect_equal(labelled::val_labels(lbl_vector_filled),
               c('One' = 1, 'Two' = 2, '<3>' = 3))

  # Check that the variable label is preserved
  expect_equal(labelled::var_label(lbl_vector_filled), 'Numbers')

  # Check that NA values are preserved and unlabeled
  lbl_vector_na <- labelled::labelled(c(1, NA, 2, 3),
                                      labels = c('One' = 1, 'Two' = 2),
                                      label = 'Numbers')
  lbl_vector_filled_na <- lbl_fill(lbl_vector_na)

  expect_equal(as.vector(lbl_vector_filled_na), as.vector(lbl_vector_na))
  expect_equal(labelled::val_labels(lbl_vector_filled_na), c('One' = 1, 'Two' = 2, '<3>' = 3))

  lbl_vector_filled_na_fill <- lbl_fill(lbl_vector_na, fill_na = TRUE)
  expect_equal(as.vector(lbl_vector_filled_na), as.vector(lbl_vector_na))
  expect_equal(labelled::val_labels(lbl_vector_filled_na_fill), c('One' = 1, 'Two' = 2, '<3>' = 3, '<NA>' = NA))
})