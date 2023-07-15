
# Define test data.
# Note that the labels are unsorted, as is allowed by the labelled package
set.seed(42)
fruit <- labelled::labelled(sample(c(2L, 3L, 5L, 7L, 11L), 100, TRUE, prob=c(3,3,2,5,1)),
              labels = c(Apple = 2, Orange = 7, Peach = 11, Banana = 3, Lime = 5),
              label = "Some fruits")
lessfruit <- labelled::labelled(sample(c(2L, 3L, 7L, 11L), 20, TRUE, prob=4:1),
              labels = c(Apple = 2, Orange = 7, Peach = 11, Banana = 3, Lime = 5),
              label = "Fewer fruits, not all exising fruits are used")
strangefruit <- labelled::labelled(sample(c(3L, 7L, 13L, NA), 20, TRUE),
              labels = c(Apple = 2, Orange = 7, Peach = 11, Banana = 3, Lime = 5),
              label = "Strange fruits, some without labels and some are missing")


test_that("lbl_count(fruit) works", {

  # Expected result for the fruit count
  d.fruit_count <- tibble::tibble(
    v = c(2L, 3L, 5L, 7L, 11L),
    l = c("Apple", "Banana",  "Lime", "Orange", "Peach"),
    n = c(24L, 21L, 12L, 32L, 11L))
  expect_equal(lbl_count(fruit), d.fruit_count)

  # Expected result for lessfruit count,
  # in the correct order, and the missing fruit has n==0
  d.lessfruit_count <- tibble::tibble(
    v = c(2L, 3L, 5L, 7L, 11L),
    l = c("Apple", "Banana", "Lime", "Orange", "Peach"),
    n = c(6L, 7L, 0L, 5L, 2L))
  expect_equal(lbl_count(lessfruit), d.lessfruit_count)

  # Expected result for strangefruit. There we have 13, which
  # has no labels (NA in l), and some full NA (NA in v and l),
  # and no apples, limes, or peaches
  d.strangefruit_count <- tibble::tibble(
    v = c(2L, 3L, 5L, 7L, 11L, 13L, NA),
    l = c("Apple",  "Banana", "Lime", "Orange", "Peach", NA, NA),
    n = c(0, 7, 0,  4, 0, 3, 6))
  expect_equal(lbl_count(strangefruit), d.strangefruit_count)

})


test_that("lbl_count(include_var_label = TRUE) works", {

  expected <- lbl_count(veggies) |>
    dplyr::bind_rows(tibble::tibble(v = NA, l = "var_label: The regular veggies are indexed by the prime numbers 2-11", n = NA))
  actual <- lbl_count(veggies, include_var_label = TRUE)

  expect_equal(actual, expected)
})
