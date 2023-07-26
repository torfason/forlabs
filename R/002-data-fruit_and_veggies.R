#' @name fruit_and_veggies
#' @title Example Data Sets: Fruits and Vegetables
#' @description A collection of labelled vectors and factors representing
#'   different fruits and vegetables. See the format section below for specifics
#'   about the class and format of each variable.
#' @source These variables were generated as illustrative example data.
#' @seealso \link[haven]{labelled}
#' @keywords datasets

#' @rdname fruit_and_veggies
#' @docType data
#' @format `fruit_lbl` is a labelled vector of double type. It includes
#'   different fruit names as labels.
"fruit_lbl"

#' @rdname fruit_and_veggies
#' @docType data
#' @format `fruit_lbl_int` is similar to `fruit_lbl`, but it's of integer type.
#'   It illustrates how labels behave with integer data.
"fruit_lbl_int"

#' @rdname fruit_and_veggies
#' @docType data
#' @format `fruit_lbl_chr` is another variant of `fruit_lbl` where labels are
#'   assigned to characters instead of numbers, illustrating how string labels
#'   work.
"fruit_lbl_chr"

#' @rdname fruit_and_veggies
#' @docType data
#' @format `fruit_fct` is a factor variant of the fruit dataset. It helps
#'   demonstrate the difference between factors and labelled vectors.
"fruit_fct"

#' @rdname fruit_and_veggies
#' @docType data
#' @format `veggies` is a labelled vector of double type with labels
#'   assigned to different vegetables, serving as a basic vegetable dataset.
#'   Rather than running from `1:n`, the values are prime numbers, illustrating
#'   how labelled variables are more flexible than factors regarding the
#'   underlying values behind the labels. This variable also has a `var_label`.
"veggies"

#' @rdname fruit_and_veggies
#' @docType data
#' @format `exotic_veggies` is an extension of `veggies` with more exotic
#'   vegetable names as labels, and has a `var_label`. More importantly, this
#'   demonstrates how different types of missing values behave with labelled
#'   values. Specifically:
#'
#'   * There are no observations of `[7] Eggplant` or `[41] Zucchini`.
#'   * There are eight instances of unlabelled values (`[4]`, `[8]`, `[16]`, `[and 31]` (no corresponding label for this value).
#'   * There is one instance of `[NA]`, which also does not have a corresponding label.
"exotic_veggies"
