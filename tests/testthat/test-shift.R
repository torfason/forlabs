
test_that("simple shifting works", {
  fruit_count_shift <-  fruit_lbl |>
    lbl_count() |>
    dplyr::mutate(v = v-1)

  fruit_shift_count <- fruit_lbl |>
    lbl_shift(-1) |>
    lbl_count()

  expect_equal(fruit_shift_count, fruit_count_shift)
})

test_that("exotic shifting throws errors", {
  expect_error(lbl_shift(exotic_veggies))
  expect_error(lbl_shift(fruit_lbl_chr))
  expect_error(lbl_shift(fruit_lbl_chr, rotate=TRUE))

})


test_that("variable labels are preserved", {
  expect_equal(
    lbl_shift(veggies) |> ll_var_label(),
    veggies |> ll_var_label()
  )
})


test_that("shift works with empty labels", {

  # Here, shift *should* error, because ltrs is not filled
  ltrs_lbl <- ll_labelled(letters)
  expect_error(lbl_shift(ltrs_lbl), "x must not have any unlabelled values")

  # However, an empty haven_labelled, with no labels attribute, is
  # filled according to the definition, and so this should pass
  zero_lbl <- ll_labelled()
  expect_silent(lbl_shift(zero_lbl))

  # Shifting a variable without any value labels is idempotent
  expect_equal(lbl_shift(zero_lbl), zero_lbl)
})
