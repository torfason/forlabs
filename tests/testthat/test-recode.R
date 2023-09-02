
test_that("recode works", {

  for (rcd in list(lbl_recode)) {

    # Test data
    # Works and fails refer to an old buggy version. In correct
    # implementation they should both work
    labs <- c("Yes" = 1, "No" = 2, "Don't know" = 3, "Won't answer" = 4)
    works <- ll_labelled(c(1, 2, 3, 4, NA), labels = labs)
    fails <- ll_labelled(c(NA, 1, 2, 3, 4), labels = labs)

    # Recode no "No" level to zero
    have_works_no <- rcd(works, 2 ~ 0)
    have_fails_no <- rcd(fails, 2 ~ 0)
    want <- c(No = 0, Yes = 1, `Don't know` = 3, `Won't answer` = 4)
    expect_equal(have_works_no |> ll_val_labels() |> sort(), want)
    expect_equal(have_fails_no |> ll_val_labels() |> sort(), want)

    # Recode "Don't know" and "Won't answer" to a maybe
    have_works_maybe <- rcd(works, 4 ~ 3)
    have_fails_maybe <- rcd(fails, 4 ~ 3)
    want <- c(Yes = 1, No = 2, `Don't know / Won't answer` = 3)
    expect_equal(have_works_maybe |> ll_val_labels() |> sort(), want)
    expect_equal(have_fails_maybe |> ll_val_labels() |> sort(), want)

  }
})


test_that("more simple-case tests", {

  # wrong order
  set.seed(1)
  fruit_smpl <- ll_labelled(fruit_lbl, sample(ll_val_labels(fruit_lbl)))

  # Some other default stuff
  for (rcd in list(lbl_recode)) {

    # A no-op version,
    expect_equal(veggies |> rcd(NA ~ NA), veggies)
    expect_equal(fruit_smpl |> rcd(NA ~ NA), fruit_smpl)

    # All to NA
    fruit_na <- fruit_lbl |> rcd(1:5 ~ NA)
    expect_equal(as.vector(fruit_na), rep(NA_real_,50))
    expect_equal(length(ll_val_labels(fruit_na)), 0)

    # Combine to 1:3
    veggies_rcd <- veggies |> rcd(1:3 ~ 1, 5 ~ 2, 5:11 ~ 3)
    expect_in(as.vector(veggies_rcd), 1:3)
    expect_in(as.vector(ll_val_labels(veggies_rcd)), 1:3)
    expect_in(names(ll_val_labels(veggies_rcd)), c("Carrot / Potato", "Tomato", "Cucumber / Broccoli"))
  }

})

test_that("recode works with to/from NA", {

  for (rcd in list(lbl_recode)) {

    # Flip NA and non-na,
    xv <- exotic_veggies |> rcd(1:100 ~ NA, NA ~ 1)
    expect_equal(sum(is.na(xv)), sum(!is.na(exotic_veggies)))
    expect_equal(sum(!is.na(xv)), sum(is.na(exotic_veggies)))
    expect_equal(ll_val_labels(xv, always = TRUE),
                 ll_val_labels(exotic_veggies)[integer(0)])

    # Recode certain values to NA
    veggies |> lbl_count()
    vg <- veggies |> rcd(2 ~ NA)
    expect_equal(sum(is.na(vg)), sum(veggies == 2))
    expect_equal(ll_val_labels(vg), ll_val_labels(veggies)[2:5])

  }

})


test_that("recode works with empty labels", {

  # Old version tends to strip class from empty labels
  rcd <- lbl_recode

  # should work without arguments, and recode(labelled) should equal labelled(recode)
  ltrs_lbl <- ll_labelled(letters)
  expect_equal(rcd(ltrs_lbl, NA ~ NA), ltrs_lbl)
  expect_equal(rcd(ltrs_lbl, "a" ~ "b"), ll_labelled(c("b", letters[2:26])))

  # However, an empty haven_labelled, with no labels attribute, is
  # filled according to the definition, and so this should pass
  zero_lbl <- ll_labelled()
  expect_silent(rcd(zero_lbl, 1 ~ 0))

  # This does not hold, because an empty labels attribute is added
  expect_equal(lbl_shift(zero_lbl), zero_lbl)
})
