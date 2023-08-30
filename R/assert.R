
# Internal and undocumented
lbl_check_filled <- function(x, na_unfilled_ok = TRUE) {

  # Check args
  ll_assert_labelled(x)
  qassert(na_unfilled_ok, "B1")

  # Get the existing labels, add NA if na_unfilled_ok specified
  labs <- ll_val_labels(x, always = TRUE)
  if (na_unfilled_ok) {
    labs <- c(labs, NA)
  }

  # Find the values that are not labeled.
  unlabelled_values <- setdiff(unique(x), labs)

  if (length(unlabelled_values) > 0) {
    return(paste0("x must not have any unlabelled values, but has ",
                  length(unlabelled_values), " such values."))
  }

  # All is well
  TRUE
}

# Internal and undocumented
lbl_test_filled   <-  checkmate::makeTestFunction(lbl_check_filled)

#' Assert that a labelled vector is filled/dense
#'
#' `lbl_assert_filled()` asserts that a given labelled vector is `filled`, i.e.,
#' that for every value that is present in the vector data, the corresponding
#' value is present in the value labels. Not having labels for the `NA` value
#' is OK unless explicitly disallowed.
#'
#' @param x The value to assert.
#' @param na_unfilled_ok Should unlabelled `NA` values throw an error?
#' @return x unless there is an error
#'
#' @keywords internal
#' @export
lbl_assert_filled <-  checkmate::makeAssertionFunction(lbl_check_filled)


# Internal and undocumented
lbl_check_dense <- function(x) {

  # Check args (fail immediately if not labelled)
  ll_assert_labelled(x)

  # A character labelled cannot be dense
  if (typeof(x) == "character") {
    return("x must not be of character type (<labelled<character>>)")
  }

  # A dense labelled is a filled labelled
  if (!isTRUE(lbl_check_filled(x))) {
    return(lbl_check_filled(x))
  }

  # And the difference between two elements of the val_labels is strictly 1
  labs <- ll_val_labels(x, always = TRUE)
  if (!all(diff(sort(labs)) == 1)) {
    maxgap <- max(diff(sort(labs)))
    return(paste0("The value labels of x must be dense, ",
                  "but the largest gap is ", maxgap))
  }

  # All is well
  TRUE
}

# Internal and undocumented
lbl_test_dense   <-  checkmate::makeTestFunction(lbl_check_dense)

#' Assert that a labelled vector is
#'
#' @description
#' `lbl_assert_dense()` asserts that a given labelled vector is `dense`, i.e.,
#' that for every value that is present in the vector data, the corresponding
#' value is present in the value labels. `NA` values are ignored, as density is not applicable for them.
#'
#' @rdname lbl_assert_filled
#' @keywords internal
#' @export
lbl_assert_dense <-  checkmate::makeAssertionFunction(lbl_check_dense)
