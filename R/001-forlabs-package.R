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

## Imports and re-exports from labelled package
#' @importFrom haven labelled
#' @export
haven::labelled

#' @importFrom vctrs vec_data
vctrs::vec_data

#' @importFrom vctrs vec_c
vctrs::vec_c

#' @importFrom zmisc ll_assert_labelled
zmisc::ll_assert_labelled

#' @importFrom zmisc ll_to_character
zmisc::ll_to_character

#' @importFrom zmisc ll_labelled
zmisc::ll_labelled

#' @importFrom zmisc ll_val_labels
zmisc::ll_val_labels

#' @importFrom zmisc ll_val_labels<-
zmisc::"ll_val_labels<-"

#' @importFrom zmisc ll_var_label
zmisc::ll_var_label

#' @importFrom zmisc ll_var_label<-
zmisc::"ll_var_label<-"
