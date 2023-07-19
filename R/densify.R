
#' Densify a labeled vector
#'
#' The `lbl_densify` function takes a labeled vector and assigns new,
#' densely-ranked integer values to each unique value in the vector. This is
#' particularly useful when working with sparse or unevenly distributed data, as
#' it transforms the data into a format where each unique value is represented
#' by a unique integer, starting from 1 and increasing by 1 for each new unique
#' value. The order of the unique values is preserved. This function keeps the
#' labels correctly associated with their respective values throughout the
#' densifying process.
#'
#' @param x A labelled vector to be densified.
#' @param unlabelled This parameter determines the handling of unlabelled values
#' in the input vector. It can take two values:
#'    - "error": The function will stop and an error message will be returned if
#'    there are unlabelled values in the vector.
#'    - "fill": The function will fill any unlabelled values using the [`lbl_fill()`]
#'    function before densifying.
#'
#' @return A labeled vector of the same length as the original vector, `x`, but with
#' values replaced with their dense ranks. The labels are correctly associated with
#' their respective values and the variable label (if present) is preserved.
#'
#' @examples
#' # Densify the veggies vector, then examine the result with lbl_count()
#' lbl_densify(veggies)
#' lbl_densify(veggies) |> lbl_count()
#'
#' @export
lbl_densify <- function(x, unlabelled = c("error", "fill")) {

  # Arg processing
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

  # By now we should have a fully labelled vector
  check_labelled(x, strict = TRUE)

  # Densify the labels
  labs              <- labelled::val_labels(x)
  dense_labs        <- dplyr::dense_rank(labs)
  names(dense_labs) <- names(labs)

  # Densify the values
  dense_vals  <- dplyr::dense_rank(as.vector(x))

  # Create and return a fresh labelled variable, which has densified vals and labs
  labelled::labelled(dense_vals, labels = dense_labs, label = labelled::var_label(x))
}
