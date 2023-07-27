
#' Fill unlabeled values in a labeled vector
#'
#' The `lbl_fill` function takes a labeled vector and creates new labels for any
#' values that are present in the vector but do not have an existing label.
#'
#' @param x A labeled vector
#'
#' @param fill_na Should NA values be filled
#'
#' @param pattern A glue pattern determining the text for the new labels
#'
#' @return A labeled vector of the same length as x, with labels for all values.
#'
#' @examples
#'   # Fill the unlabelled values in the exotic_veggies example variable
#'   lbl_fill(exotic_veggies)
#'
#' @export
lbl_fill <- function(x, fill_na = FALSE, pattern = "<{v}>") {

  # Check args
  check_labelled(x)
  assert_flag(fill_na)
  assert_string(pattern)

  # Get the existing labels
  labs <- val_labels(x) %||% empty_val_labels(x)

  # Find the values that are not labeled
  new_labs <- setdiff(unique(x), labs)

  # If fill_na = FALSE, exclude NA from new labels
  #if (!fill_na && any(is.na(new_labs))) new_labs <- new_labs[!is.na(new_labs)]

  # Generate new labels for these values
  glue_env <- new.env(parent = emptyenv())
  glue_env$v <- new_labs
  names(new_labs) <- glue::glue_safe(pattern, .envir = glue_env)

  # Merge the old and new labels, use na.last to control if NA are included
  labs <- sort(c(labs, new_labs), na.last = ifelse(fill_na, TRUE, NA))

  # Assign the updated labels to the vector and preserve variable label
  x_filled <- labelled(x, labels = labs, label = var_label(x))

  x_filled
}
