
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
#'   # Drop unused labels in exotic_veggies
#'   lbl_drop(exotic_veggies)
#'
#'   # Fewer observations, fewer used labels
#'   lbl_drop(exotic_veggies[1:10])
#'
#' @seealso [forcats::fct_drop()]
#'
#' @export
lbl_drop <- function(x) {

  # Check args
  ll_assert_labelled(x)

  # Get the existing labels
  labs <- ll_val_labels(x, always = TRUE)

  # Find the labels that are not used in the vector
  unused_labs <- setdiff(labs, unique(x))

  # Drop the unused labels
  new_labs <- labs[!(labs %in% unused_labs)]

  # Return fresh var with updated labels, and variable label preserved
  labelled(x, labels = new_labs, label = ll_var_label(x))
}
