
#' @title Shift Levels of a Labelled Vector
#'
#' @description
#' This function shifts the levels of a labelled vector to the left or right.
#' Unlike `forcats::fct_shift()` from the `forcats` package, which works with
#' factors, this function is designed to work with haven's labelled vectors.
#' Given that labelled vectors can have any values, shifting simply increases or
#' decreases the values of the vector, updating the labels to match. Shifting by
#' a positive number thus shifts the value *up* rather than down, as opposed to
#' how `fct_shift()` works. However, maintaining some compatibility, the default
#' value of n is `-1L`, meaning that one-based vector gets shifted to a
#' zero-based vector, which is often useful.
#'
#' Implementing a rotating shift (as `fct_shift()` does) would be possible, but
#' has not been done yet. For `labelled<character>`, only rotating shifts make
#' sense, and so shifting such vectors is not currently supported.
#'
#' @param x A labelled vector.
#' @param n An integer. Positive values shift up (increasing the values);
#'   negative values shift to town (decreasing the value). Default is -1L, which
#'   would shift one-based label set to a zero-based label set.
#' @param rotate A logical. If TRUE, it would perform a rotating shift on the
#'   labels. However, this feature is currently not implemented. Default is
#'   FALSE.
#'
#' @return A `labelled` object with shifted labels.
#'
#' @examples
#'   lbl_shift(fruit_lbl)
#'   lbl_shift(fruit_lbl_int, 1)
#'   lbl_shift(veggies, 20)
#'
#' @seealso [forcats::fct_shift()]
#'
#' @export
lbl_shift <- function(x, n = -1L, rotate = FALSE) {

  # Check args
  lbl_assert_filled(x)
  assert_number(n)
  assert_flag(rotate)

  if (rotate) {
    stop("Rotating labelled is not implemented")
  }
  if (typeof(x) == "character") {
    stop("Shifting labelled<character> is not implemented")
  }
  if (rlang::is_integerish(n) && abs(n) <= 2^30) {
    n <- as.integer(n)
  }

  # Treat
  labelled(x + n, labels = ll_val_labels(x, always = TRUE) + n, label = ll_var_label(x))
}



