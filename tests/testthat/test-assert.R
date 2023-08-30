
# Sanity assertions
test_that("(assert|check|test)_character works", {
  expect_equal( checkmate::assert_character(letters), letters )
  expect_true(  checkmate::check_character(letters) )
  expect_true(  checkmate::test_character(letters) )

  expect_error( checkmate::assert_character(1) )
  expect_match( checkmate::check_character(1), "Must be of type '.*', not '.*'" )
  expect_false( checkmate::test_character(1) )
})

# Assertions on the type
test_that("zmisc::ll_assert_labelled works", {

  # This should pass
  expect_equal( ll_assert_labelled(fruit_lbl), fruit_lbl )

  # These should fail
  expect_error( ll_assert_labelled(fruit_fct), "x must be of class .haven_labelled." )
  expect_error( ll_assert_labelled(letters), "x must be of class .haven_labelled." )
})

# More complex assertions
test_that("zmisc::ll_assert_labelled works in complex cases", {

  # Construct an invalid labelled variable
  invalid_labelled <- labelled(letters)
  attr(invalid_labelled, "labels") <- c(a=1)

  # Test a strange (but legal) labelled, and an illegal one
  expect_equal( ll_assert_labelled(labelled(letters)), labelled(letters))
  expect_error( ll_assert_labelled(invalid_labelled), "labels must be of same type as x")
})

# All functions must be checked with empty and zero-length labels
test_that("assertions works with empty labels", {
  ltrs <- ll_labelled(letters)
  expect_silent(ll_assert_labelled(ltrs))
})

# All functions must be checked with empty and zero-length labelled variables
test_that("count works with empty labels", {
  ltrs_lbl <- ll_labelled(letters)
  expect_equal(ll_assert_labelled(ltrs_lbl), ltrs_lbl)

  zero_lbl <- ll_labelled()
  expect_equal(ll_assert_labelled(zero_lbl), zero_lbl)
})

test_that("lbl_assert_filled() works", {

  # Assertions that should work
  expect_equal(lbl_assert_filled(fruit_lbl), fruit_lbl)
  expect_equal(lbl_assert_filled(fruit_lbl_int), fruit_lbl_int)
  expect_equal(lbl_assert_filled(fruit_lbl_chr), fruit_lbl_chr)
  expect_equal(lbl_assert_filled(veggies), veggies)
  expect_equal(lbl_assert_filled(c(veggies, NA)), c(veggies, NA)) # NA is OK in unfilled

  # Assertions that should not work
  expect_error(lbl_assert_filled(fruit_fct), "x must be of class .haven_labelled.")
  expect_error(lbl_assert_filled(exotic_veggies), "x must not have any unlabelled values")

})

test_that("lbl_assert_dense() works", {

  # Assertions that should work
  expect_equal(lbl_assert_dense(fruit_lbl), fruit_lbl)
  expect_equal(lbl_assert_dense(fruit_lbl_int), fruit_lbl_int)
  expect_equal(lbl_assert_dense(c(fruit_lbl, NA)), c(fruit_lbl, NA)) # NA is OK

  # A densified version of veggies should pass the test, and the character
  # version should match the original
  expect_equal(
    lbl_assert_dense(lbl_densify(veggies)) |> ll_to_character(),
    veggies |> ll_to_character()
  )

  # These should error
  expect_error(lbl_assert_dense(fruit_lbl_chr), "x must not be of character type")
  expect_error(lbl_assert_dense(veggies), "The value labels of x must be dense")

  # Assertions that should not work
  expect_error(lbl_assert_dense(fruit_fct), "x must be of class .haven_labelled.")
  expect_error(lbl_assert_dense(exotic_veggies), "x must not have any unlabelled values")

})
