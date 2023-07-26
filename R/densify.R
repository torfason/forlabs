
#' Densify a labeled vector
#'
#' The `lbl_densify` function takes a labeled vector and assigns new,
#' densely-ranked integer values to each unique value in the vector. The order
#' of the unique values is preserved. This function keeps the labels correctly
#' associated with their respective values throughout the densifying process.
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
  check_labelled(x)
  unlabelled <- match.arg(unlabelled)

  # Handle unlabelled values in the vector
  if (!all(is.na(labelled::val_labels_to_na(x)))) {
    if (unlabelled == "error") {
      stop('There are unlabelled values in x, and the parameter unlabelled == "error"')
    } else if (unlabelled == "fill") {
      # Fill unlabelled values with lbl_fill before densifying
      x <- lbl_fill(x)
    }
  }

  # By now we should have a fully labelled vector,
  # (this check is a sanity assertion only, it should not be needed)
  check_labelled(x, strict = TRUE)

  # Densify the labels
  # (NULL val_labels() would be allowed for an empty labelled object,
  # as they are already both filled and densified))
  labs              <- val_labels(x) %||% vector(typeof(x))
  dense_labs        <- vctrs::vec_rank(labs, ties="dense")
  names(dense_labs) <- names(labs)

  # Densify the values
  dense_vals  <- vctrs::vec_rank(as.vector(x), ties="dense")

  # Create and return a fresh labelled variable, which has densified vals and labs
  labelled(dense_vals, labels = dense_labs, label = var_label(x))
}

