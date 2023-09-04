
#' Sort value labels of a labelled variable
#'
#' Sorts the labels of a `labelled` variable so that the inner representation of
#' the vector is ascending.
#'
#' @param x A `labelled` variable.
#' @return A `labelled` variable with values and label levels equal to `x`, but
#'   with inner representation of the value labels in ascending order.
#'
#' @examples
#' lbl_sort_labels(fruit_lbl)
#' lbl_sort_labels(veggies)
#' lbl_sort_labels(exotic_veggies)
#'
#' @export
lbl_sort_labels <- function(x) {
  ll_assert_labelled(x)
  labelled(x, sort(ll_val_labels(x)), ll_var_label(x))
}
