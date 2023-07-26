
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
test_that("lbl_(assert|check|test)_labelled work overall", {
  expect_true(  lbl_check_labelled(fruit_lbl) )
  expect_true(  lbl_test_labelled(fruit_lbl) )
  expect_equal( lbl_assert_labelled(fruit_lbl), fruit_lbl )

  expect_match( lbl_check_labelled(fruit_fct), "Must inherit from class 'haven_labelled'" )
  expect_false( lbl_test_labelled(fruit_fct) )
  expect_error( lbl_assert_labelled(fruit_fct) )

  expect_match( lbl_check_labelled(letters), "Must inherit from class 'haven_labelled'" )
  expect_false( lbl_test_labelled(letters) )
  expect_error( lbl_assert_labelled(letters) )
})

# More complex assertions
test_that("lbl_(assert|check|test)_labelled work in complex cases", {
  illegal_labelled <- labelled(letters)
  attr(illegal_labelled, "labels") <- c(a=1)

  # first, lbl_check_labelled
  expect_true(  lbl_check_labelled(labelled(letters)))
  # expect_match( lbl_check_labelled(labelled(letters), val_labels_null = "error"),
  #               "Type of val_labels\\(x\\) must be")
  expect_match( lbl_check_labelled(illegal_labelled),
                "Type of val_labels\\(x\\) must be")
  # expect_match( lbl_check_labelled(illegal_labelled, val_labels_null = "error"),
  #               "Type of val_labels\\(x\\) must be")

  # then, lbl_test_labelled
  expect_true(  lbl_test_labelled(labelled(letters)))
  # expect_false( lbl_test_labelled(labelled(letters), val_labels_null = "error"))
  expect_false( lbl_test_labelled(illegal_labelled))
  # expect_false( lbl_test_labelled(illegal_labelled, val_labels_null = "error"))

  # finally, lbl_assert_labelled
  expect_equal( lbl_assert_labelled(labelled(letters)), labelled(letters))
  # expect_error( lbl_assert_labelled(labelled(letters), val_labels_null = "error"))
  expect_error( lbl_assert_labelled(illegal_labelled))
  # expect_error( lbl_assert_labelled(illegal_labelled, val_labels_null = "error"))

  # # We must check the "add case" explicitly
  # expect_equal( lbl_assert_labelled(labelled(letters), val_labels_null = "add"),
  #               labelled(letters, labels=character() |> setNames(character())))
  # expect_error( lbl_assert_labelled(illegal_labelled, val_labels_null = "add"))
})


test_that("assertion function tests are skipped (not implemented)", {
  # Next up is implementing assertion functions for labelled
  #   - lbl_check_filled + test/assert
  #   - lbl_check_dense + test/assert
  skip("assertion functions")
})

test_that('TODO', {
  skip('assert:: Not testing parameter val_labels_null="c("ok", "error", "add")')
})

test_that('TODO', {
  # Replace these all with lbl_test_filled()
  skip('Replace all instance of "(!all(is.na(labelled::val_labels_to_na(x))))"')
})

test_that('TODO', {
  skip('Implement lbl_collapse()')
})
