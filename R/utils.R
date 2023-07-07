
# Check that a variable is a labelled vector
check_labelled <- function(x, arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  if (labelled::is.labelled(x)) {
    if ( is.unsorted(attr(x, "labels"), strictly=TRUE) ) {
      #warning("Note that the label levels are unsorted")
    }
    x
  } else {
    cli::cli_abort(
      "{.arg {arg}} must be a labelled vector, not {.obj_type_friendly {x}}.",
      call = call
    )
  }
}

# Check that a variable is a list of labelled vectors
check_labelled_list <- function(x, arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  if (!is.list(x)) {
    cli::cli_abort(
      "{.arg {arg}} must be a list, not {.obj_type_friendly {x}}.",
      call = call
    )
  }

  is_labelled <- vapply(x, labelled::is.labelled, logical(1))
  if (any(!is_labelled)) {
    cli::cli_abort(
      "All elements of {.arg {arg}} must be labelled vectors",
      call = call
    )
  }

  x
}

# Helper to get only the values from a labelled variable
# n signals that the results includes all n observations
get_labelled_values_n <- function(x)
{
  x <- check_labelled(x)
  x |> haven::zap_label() |> haven::zap_labels()
}

# Helper to get only the labels from a labelled variable
# n signals that the results includes all n observations
# Any value in x that is does not have a corresponding
# label will result in an NA
get_labelled_labels_n <- function(x)
{
  x <- check_labelled(x)
  x |> haven::as_factor(levels="labels") |> as.character()
}

# Helper to get only the values of the levels of a labelled variable
# ! m signals that the result is as long as the number of levels !
# This always returns the values in the order of the *values* they denote.
get_labelled_values_m <- function(x, sorted = TRUE)
{
  stopifnot(sorted) # Not implemented to return the values unsorted
  x <- check_labelled(x)
  result <- attr(x, "labels") |> sort()
  unname(result)
}

# Helper to get only the labels of the levels of a labelled variable
# ! m signals that the result is as long as the number of levels !
# This always returns the lables in the order of the *values* they denote.
get_labelled_labels_m <- function(x, sorted = TRUE)
{
  stopifnot(sorted) # Not implemented to return the values unsorted
  x <- check_labelled(x)
  result <- attr(x, "labels") |> sort()
  names(result)
}
