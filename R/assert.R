
## Needed to initialize the use of assert_typeof .Rd file
#' @name assert_typeof
#' @rdname assert_typeof
NULL

#' Verify Data Type of an Object
#'
#' The `assert_typeof()` function verifies the data type of an object, as
#' indicated by [base::typeof()]. This complements [checkmate::assert_class()],
#' which verifies `class(x)` rather than `typeof(x)` . Both `check_typeof()` and
#' `test_typeof()` serve as analogous functions, adhering to `checkmate`
#' conventions.
#'
#' @param x The object to be checked.
#' @param types A character vector specifying the acceptable data types.
#' @param null.ok A logical indicating whether NULL is an acceptable value,
#'   default is `FALSE`
#'
#' @return A logical value. If the type of the object matches any of the
#'   specified types, it returns `TRUE`; otherwise, it returns an error message
#'   indicating the expected types.
#'
#' @examples
#' # Check for numeric or integer
#' check_typeof(5, "double")
#' check_typeof(5L, "integer")
#' check_typeof(5L, c("integer", "double"))
#'
#' # Returns an error message
#' check_typeof(5L, c("numeric"))
#'
#' # Check for character or logical
#' check_typeof("hello", c("character", "logical"))
#' check_typeof(FALSE, c("character", "logical"))
#'
#' @rdname assert_typeof
#' @export
check_typeof <- function (x, types, null.ok = FALSE)
{
  qassert(types, "S+")
  qassert(null.ok, "B1")

  # Handle the null case
  if (is.null(x)) {
    if (null.ok)
      return(TRUE)
    if (!null.ok)
      return("Must not be NULL")
  }

  # The general case
  if (typeof(x) %in% types)
    return(TRUE)

  # Fell through, wrong type
  paste0("Must of one of these types: '", paste0(types, collapse = ", "), "'")
}

#' @rdname assert_typeof
#' @export
test_typeof <- checkmate::makeTestFunction(check_typeof)

#' @rdname assert_typeof
#' @param .var.name	Name of the checked object to print in assertions.
#'   Defaults to the heuristic implemented in [checkmate::vname()].
#' @param add	Collection to store assertion messages.
#'   See [checkmate::AssertCollection].
#' @export
assert_typeof <- checkmate::makeAssertionFunction(check_typeof)

## Needed to initialize the use of lbl_assert_labelled .Rd file
#' @name lbl_assert_labelled
#' @rdname lbl_assert_labelled
NULL

#' @title Verify a `labelled` Object
#'
#' @description
#' The `lbl_assert_labelled()` function verifies that the input object is a
#' well-formed labelled vector. `lbl_check_labelled()` and `lbl_test_labelled()`
#' serve as analogous functions, adhering to `checkmate` conventions.
#'
#' The functions verify the correct class, that `var_label(x)` is `NULL` or
#' `character`, and that the `val_labels(x)` are either NULL or match the type
#' of `x`, in line with the (minimal) specification in [haven::labelled()].
#'
#' @param x The object to be checked.
#'
#' @return A logical value. If the input object is a 'haven_labelled' vector, it returns `TRUE`;
#' otherwise, it returns an error message indicating the issue with the input.
#'
#' @examples
#' # Check if 'fruit_lbl' is a 'haven_labelled' vector
#' lbl_check_labelled(fruit_lbl)
#'
#' @seealso [haven::labelled()]
#'
#' @rdname lbl_assert_labelled
#' @export
lbl_check_labelled <- function(x) {

  # Check for the correct class of x
  class_check <- checkmate::check_class(x, "haven_labelled")
  if (!isTRUE(class_check))
    return(class_check)

  # Ensure val_labels(x) are either NULL or match type of X
  labs <- val_labels(x) %||% vector(typeof(x))
  if (typeof(labs) != typeof(x))
    return(paste0("Type of val_labels(x) must be '",
                  typeof(x), "' but is '", typeof(labs), "'"))

  # All is well
  TRUE
}

#' @rdname lbl_assert_labelled
#' @export
lbl_test_labelled   <- checkmate::makeTestFunction(lbl_check_labelled)


#' @rdname lbl_assert_labelled
#' @param .var.name	Name of the checked object to print in assertions.
#'   Defaults to the heuristic implemented in [checkmate::vname()].
#' @param add	Collection to store assertion messages.
#'   See [checkmate::AssertCollection].
#' @export
lbl_assert_labelled   <- checkmate::makeAssertionFunction(lbl_check_labelled)




# ---- Dead ends below ----

# check version for ok/error cases - not used
lbl_check_labelled_complex <- function(x, val_labels_null = c("ok", "error")) {

  # Arg processing
  val_labels_null <- match.arg(val_labels_null)

  # Check for the correct class of x
  class_check <- checkmate::check_class(x, "haven_labelled")
  if (!isTRUE(class_check))
    return(class_check)

  # Check if a correct and non-null val_labels attribute is present
  if (typeof(x) == typeof(val_labels(x))) {
    # Correct class, val labels populated and correct
    return(TRUE)
  }

  # x of correct class, x/varlab types do NOT match (may be null)
  if (val_labels_null == "ok" && is.null(val_labels(x))) {
    return(TRUE)
  } else {
    # non-null mismatched varlabs, or param is "error"
    return(paste0("Type of val_labels(x) must be '",
                  typeof(x), "' but is '", typeof(val_labels(x)), "'"))
  }
}

# assert version is specially adapted to handle the "add" case
# lbl_assert_labelled <- checkmate::makeAssertionFunction(lbl_check_labelled)
lbl_assert_labelled_complex <- function (x, val_labels_null = c("ok", "error", "add"),
                                .var.name = checkmate::vname(x), add = NULL)
{
  # Arg processing
  if (missing(x))
    stop(sprintf("argument \"%s\" is missing, with no default", .var.name))
  val_labels_null <- match.arg(val_labels_null)

  if ( val_labels_null %in% c("ok", "error")) {
    res = lbl_check_labelled_complex(x, val_labels_null = val_labels_null)
    return(checkmate::makeAssertion(x, res, .var.name, add))
  } else {
    # The "add" case. Do an "ok"-case assertion, then add labels if null
    res = lbl_check_labelled_complex(x, val_labels_null = "ok")
    checkmate::makeAssertion(x, res, .var.name, add)

    # If we got here, everything is cool, except that labels may still be null
    if (is.null(val_labels(x)))
      attr(x, "labels") <- vector(typeof(x)) |> stats::setNames(character())
    return(x)
  }
}


