#' Drop unused labels in a labelled vector
#'
#' The `lbl_drop` function takes a labelled vector and removes labels that are
#' not associated with any value in the vector.
#'
#' @param x A labeled vector
#'
#' @return A labeled vector of the same length as x, without unused labels.
#'
#' @examples
#' # Create labeled vector with unused labels
#' lbl_drop(exotic_veggies)
#'
#' @export
lbl_drop <- function(x) {

  # Check input
  check_labelled(x)

  # Get the existing labels
  labs <- labelled::val_labels(x)

  # Find the labels that are not used in the vector
  unused_labs <- setdiff(labs, unique(x))

  # Drop the unused labels
  new_labs <- labs[!(labs %in% unused_labs)]

  # Return fresh var with updated labels, and variable label preserved
  labelled::labelled(x, labels = new_labs, label = labelled::var_label(x))
}
