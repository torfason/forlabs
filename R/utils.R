
# Check that a variable is a labelled vector
check_labelled <- function(x, strict = FALSE,
                           check_all_labelled = strict,
                           check_sorted = strict) {

  if (!labelled::is.labelled(x)) {
    stop("Argument must be of type haven_labelled")
  }
  if (typeof(x) != typeof(attr(x, "labels"))) {
    stop("Type of labels does not match type of data")
  }
  if (check_all_labelled && !all(is.na(labelled::val_labels_to_na(x)))) {
    stop("Unlabelled values not allowed (check_all_labelled)")
  }
  if (check_sorted && is.unsorted(val_labels(x), strictly=TRUE) ) {
      stop("Label levels must be sorted (check_sorted)")
    }

  x
}

# Check that a variable is a list of labelled vectors
check_labelled_list <- function(x, arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  if (!is.list(x)) {
    stop("Argument must be a list")
  }

  is_labelled <- vapply(x, labelled::is.labelled, logical(1))
  if (any(!is_labelled)) {
    stop("Argument must be a list of haven_labelled objects")
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
