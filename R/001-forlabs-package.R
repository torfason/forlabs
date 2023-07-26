#' @keywords internal
"_PACKAGE"

# ---- Global variable definitions ----

# Define .data to suppress NSE check warnings
globalVariables(".data")

# ---- Imports and re-exports from other packages ----

## usethis namespace: start
#' @importFrom rlang %||%
## usethis namespace: end
NULL

## Imports and re-expors from labelled package
#' @importFrom labelled labelled
#' @export
labelled::labelled

#' @importFrom labelled to_labelled
#' @export
labelled::to_labelled

#' @importFrom labelled to_factor
#' @export
labelled::to_factor

#' @importFrom labelled var_label
#' @export
labelled::var_label

#' @importFrom labelled val_labels
#' @export
labelled::val_labels
