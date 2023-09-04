
#' Convert labelled variables to desired types
#'
#' Six parameters define the conversion rules, values passed to these parameters
#' are in the form of `tidyselect` column specifications. Any columns passed
#' will be converted according to the conversion rules associated with that
#' parameter.
#'
#' The absence of a `.character` parameter, is intentional, in order to
#' eliminate ambiguity character conversion is handled by two parameters,
#' `.char_values` and `.char_labels`.
#'
#' Matching the same column in two parameters is an error, since the result
#' would be ambiguous.
#'
#' @param d A `data.frame` with some `labelled` variables.
#'
#' @param ... Reserved for future use.
#'
#' @param .zapped Any columns specified in this parameter are converted by
#'   `zapping` the value labels, using `haven::zap_labels()`, converting to the
#'   underlying data type of the underlying value vector, either `integer`,
#'   `double`, or `character`. No type checking is performed, as the underlying
#'   type is returned unchanged.
#' @param .numeric Columns specified here are converted to `numeric`, with an
#'   error if the underlying type is not `numeric` (i.e. `integer` or `double`).
#' @param .logical Specifies conversion to `logical`, with an error if the
#'   conversion is not possible (underlying values must be `numeric` and all
#'   values must be `0`, `1`, or `NA`).
#' @param .char_values Specifies conversion to a `character` vector containing
#'   the *values* of the input variable, with an error if the underlying type
#'   is not `character`.
#' @param .char_labels Specifies conversion to a `character` vector containing
#'   the *labels* of the input variable, with an error if the underlying type
#'   is not `character` (this is done by first converting to a factor using
#'   `haven::as_factor()`, then to character using `as.character()`).
#' @param .ordered Specifies conversion to `factor` (using `haven::as_factor()`
#'   for the conversion).
#' @param .factor Specifies conversion to `factor` (using `haven::as_factor()`
#'   for the conversion).
#'
#' @param .unfilled A switch specifying the behavior if the input is not
#'   "filled" (see `lbl_fill()`). Currently only the "error" setting is
#'   implemented, and thus any unfilled labels must be filled before converting.
#'
#' @examples
#' d <- tibble::tibble(veggies, fruit_lbl, fruit_lbl_int, fruit_lbl_chr)
#' lbl_to(d, .char_labels = veggies, .zapped = starts_with("fruit"))
#'
#' @export
lbl_to <- function(d, ...,
                   .zapped, .numeric, .logical,
                   .char_values, .char_labels,
                   .factor, .ordered,
                   .unfilled = c("error", "fill", "na")) {

  # Check args
  is.data.frame(d) || stop("d must be a data frame")
  (match.arg(.unfilled) == "error") || stop("Only .unfilled == 'error' is implemented")

  # Helper functions for specific conversions
  as_zapped_helper <- function(x) {
    lbl_assert_filled(x)
    haven::zap_labels(x)
  }
  as_numeric_helper <- function(x) {
    lbl_assert_filled(x)
    is.numeric(x) || stop("Underlying type must be numeric")
    haven::zap_labels(x)
  }
  as_logical_helper <- function(x) {
    lbl_assert_filled(x)
    is.numeric(x) || stop("Underlying type must be numeric for conversion to logical")
    all(x %in% c(0,1,NA)) || stop("Only 0, 1, and NA are allowed for conversion to logical")
    result <- haven::zap_labels(x) |> as.logical()
    attr(result, "label") <- attr(x, "label", exact = TRUE)
    result
  }
  as_char_values_helper <- function(x) {
    lbl_assert_filled(x)
    is.character(x) || stop("Underlying type must be character")
    haven::zap_labels(x)
  }
  as_char_labels_helper <- function(x) {
    lbl_assert_filled(x)
    result <- haven::as_factor(x) |> as.character()
    attr(result, "label") <- attr(x, "label", exact = TRUE)
    result
  }
  as_ordered_helper <- function(x) {
    lbl_assert_filled(x)
    haven::as_factor(x, ordered = TRUE)
  }
  as_factor_helper <- function(x) {
    lbl_assert_filled(x)
    haven::as_factor(x, ordered = FALSE)
  }

  # Perform the conversions. All helpers preserve the variable label.
  d |>
    dplyr::mutate(dplyr::across({{.zapped}}, as_zapped_helper)) |>
    dplyr::mutate(dplyr::across({{.numeric}}, as_numeric_helper)) |>
    dplyr::mutate(dplyr::across({{.logical}}, as_logical_helper)) |>
    dplyr::mutate(dplyr::across({{.char_values}}, as_char_values_helper)) |>
    dplyr::mutate(dplyr::across({{.char_labels}}, as_char_labels_helper)) |>
    dplyr::mutate(dplyr::across({{.factor}}, as_factor_helper)) |>
    dplyr::mutate(dplyr::across({{.ordered}}, as_ordered_helper))

}

