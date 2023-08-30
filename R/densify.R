
#' Densify a labeled vector
#'
#' @description
#' The `lbl_densify` function takes a labelled vector and assigns new,
#' densely-ranked integer values to each unique value in the vector. The order
#' of the unique values is preserved. This function keeps the labels correctly
#' associated with their respective values throughout the densifying process.
#'
#' The subtype (`typeof(x)`) of the labelled is preserved for `double` and
#' `integer`, but `character` variables (`<labelled<character>>`) are not
#' supported as densification is not applicable for character strings.
#'
#' @param x A labelled vector to be densified.
#' @param unlabelled This parameter determines the handling of unlabelled values
#'   in the input vector. It can take two values:
#'    - "error": Thow an error if there are unlabelled values in the vector.
#'    - "fill": Fill in labels for any unlabelled values using [`lbl_fill()`]
#'   before densifying.
#'
#' @return A labeled vector of the same length as the original vector, `x`, but
#'   with values replaced with their dense ranks. The labels are correctly
#'   associated with their respective values and the variable label (if present)
#'   is preserved.
#'
#' @examples
#'   # Densify the veggies vector
#'   lbl_densify(veggies)
#'
#'   # Densify exotic_veggies, filling in for unlabelled values
#'   lbl_densify(exotic_veggies, unlabelled = "fill")
#'
#' @export
lbl_densify <- function(x, unlabelled = c("error", "fill")) {

  # Check args
  ll_assert_labelled(x)
  (typeof(x) != "character") || stop("x must not be of character type (<labelled<character>>)")
  unlabelled <- match.arg(unlabelled)

  # Check if x is filled, and deal with it if it isn't
  if (!lbl_test_filled(x)) {
    if (unlabelled == "error") {
      stop('There are unlabelled values in x, and the parameter unlabelled == "error"')
    } else if (unlabelled == "fill") {
      # Fill unlabelled values with lbl_fill before densifying
      x <- lbl_fill(x)
    }
  }

  # By now we should have a fully labelled vector,
  # (this check is a sanity assertion only, it should not be needed)
  lbl_assert_filled(x)

  # Densify the labels
  # (NULL val_labels() would be allowed for an empty labelled object,
  # as they are already both filled and densified))
  labs              <- ll_val_labels(x, always = TRUE)
  dense_labs        <- vctrs::vec_rank(labs, ties="dense")

  # Densify the values
  dense_vals  <- vctrs::vec_rank(vec_data(x), ties="dense")

  # Ensure correct type, and assign names
  if (typeof(x) == "double") {
    dense_vals <- as.double(dense_vals)
    dense_labs <- as.double(dense_labs)
  }
  names(dense_labs) <- names(labs)

  # Create and return a fresh labelled variable, which has densified vals and labs
  result <- labelled(dense_vals, labels = dense_labs, label = ll_var_label(x))

  # Sanity assertion, this should always be true
  lbl_assert_dense(result)
  result
}

