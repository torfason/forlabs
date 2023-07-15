
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
    lbl_shift(veggies) |> labelled::var_label(),
    veggies |> labelled::var_label()
  )
})
