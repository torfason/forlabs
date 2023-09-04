
test_that("lbl_sort_labels works", {

  # Test fruit
  have.fruit <- lbl_sort_labels(fruit_lbl)
  expect_equal(have.fruit, fruit_lbl)
  expect_true(!is.unsorted(ll_val_labels(fruit_lbl)))

  # Test veggies
  have.veggies <- lbl_sort_labels(veggies)
  expect_equal(have.veggies, veggies)
  expect_true(!is.unsorted(ll_val_labels(veggies)))

  # Test exotic_veggies
  have.exotic_veggies <- lbl_sort_labels(exotic_veggies)
  expect_equal(have.exotic_veggies, exotic_veggies)
  expect_true(!is.unsorted(ll_val_labels(exotic_veggies)))

  # Test a variable with unsorted labels
  veggies_recoded <- lbl_recode(veggies, 11 ~ 1, 2 ~ 3, 5 ~ NA)
  have.veggies_recoded <- lbl_sort_labels(veggies_recoded)
  expect_true(is.unsorted(ll_val_labels(veggies_recoded)))
  expect_true(!is.unsorted(ll_val_labels(have.veggies_recoded)))

})
