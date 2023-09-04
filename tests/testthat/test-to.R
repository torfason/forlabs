
# Test the lbl_to() function
test_that("lbl_to() works", {

  # Create input data
  d <- helper_make_grocery_tibble()

  # Main test case
  d.have <- lbl_to(d,
                   .zapped = fruit_zapped,
                   .numeric = fruit_numeric,
                   .logical = yes_no_logical,
                   .char_values = fruit_char_values,
                   .char_labels = stores_char_labels,
                   .factor = veggies_factor,
                   .ordered = opinion_ordered)
  varlab.have <- sapply(d.have, \(x){attr(x, "label")})
  typeof.have <- sapply(d.have, \(x){typeof(x)})

  # Assertions on the main test case, first d.have itself ...
  expect_equal(nrow(d.have), nrow(d))
  expect_equal(nrow(d.have), nrow(d))
  expect_s3_class(d.have, "tbl_df")
  expect_true(all(nchar(varlab.have) > 0))

  # ... then on each column
  expect_type(d.have$stores_char_labels, "character")
  expect_type(d.have$yes_no_logical, "logical")
  expect_s3_class(d.have$opinion_ordered, "ordered")
  expect_s3_class(d.have$veggies_factor, "factor")
  expect_type(d.have$fruit_zapped, "integer")
  expect_type(d.have$fruit_numeric, "double")
  expect_type(d.have$fruit_char_values, "character")

  # Ensure data.frames are not converted to tibbles
  d.have <- data.frame(veggies) |> lbl_to(.zapped=veggies)
  expect_true(inherits(d.have, "data.frame"))
  expect_true(!inherits(d.have, "tbl_df"))

  # Check on more complex selections
  d.have <- lbl_to(d,
      .zapped = matches("fruit"),
      .logical = starts_with("yes"),
      .char_labels = ends_with("char_labels"),
      .factor = c(opinion_ordered, veggies_factor))
  typeof.have <- sapply(d.have, \(x){typeof(x)}) |> unname()
  typeof.want <- c("character", "logical", "integer", "integer",
                   "integer", "double", "character")
  expect_equal(typeof.have, typeof.want)

  # Use notate for manual review
  #dn <- d.have |> zmisc::notate()
  #View(dn)
})

