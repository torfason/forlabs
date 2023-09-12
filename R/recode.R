
#' Recode labelled variables using either formula notation or lookup tables
#'
#' @description
#' These functions recode labelled variables while taking special care to keep
#' the *values* and the *labels* (a.k.a. value labels) of the variable in sync.
#' They assume that the value labels are meaningfully related to the values, so
#' when recoding values, the functions take care to recode the levels of the
#' value labels  so that the labels continue to track the underlying values.
#'
#' For recoding using `formula` or `tilde` notation, the underlying recoding
#' takes place using `dplyr::case_match()`, and for recoding using a lookup
#' table (provided either as a named `vector`/`list` or as a `data.frame`) is
#' done using `zmisc::lookup()`. Both methods can be used in the same call, in
#' that case the `formula` notation is applied first, followed by the
#' application of the lookup table.
#'
#' `lbl_recode()` does the recode operation on the *values* but updates the
#' levels of the value labels accordingly. This is appropriate before using the
#' variable for plots or statistical analyses. Recoding multiple values to the
#' same value results in corresponding variable labels being combined. Recoding
#' to `NA` results in corresponding labels to be dropped since `NA` should not
#' be labelled in standard `haven_labelled` variables.
#'
#' @param .x The `labelled` vector to recode.
#' @param ... A recode specification in `tilde` (`formula`) syntax. See
#'   `dplyr::case_match()` for specifics about the format of the parameter.
#' @param .lookup_table A recode specification in the form of a lookup table.
#'   See `zmisc::lookup()` for specifics about the format of the parameter.
#' @param .sep A string for how to separate labels that need to be combined.
#' @return The re-coded vector.
#'
#' @examples
#' lbl_recode(fruit_lbl, 1:2 ~ 1, 3 ~ 2, 4:5 ~ 3)
#' lbl_recode(fruit_lbl_chr, "d" ~ "z", "e" ~ NA)
#' lbl_recode(fruit_lbl_chr, .lookup_table = c(a = "b", e = "d"))
#'
#' exotic_recoded <- lbl_recode(exotic_veggies,
#'                              3:10 ~ 1, 11:20 ~ 2, 21:41 ~ 3,
#'                              2 ~ NA, NA ~ 99)
#' lbl_count(exotic_recoded)
#'
#' @export
lbl_recode <- function (.x, ..., .lookup_table = NULL, .sep = " / ") {

  # Check args (.lookup_table is checked by zmisc::lookup())
  ll_assert_labelled(.x)
  qassert(.sep, "S1")

  # The vectors to use
  vals <- vals_org <- as.vector(.x)
  labs <- ll_val_labels(.x, always = TRUE)
  lab_names <- names(labs)

  # Recode the values, then the value labels vector
  # Use formula args, then .lookup_table, if each is provided
  if (length(list(...)) > 0) {
    vals <- dplyr::case_match(vals, ..., .default = vals)
    labs <- dplyr::case_match(labs, ..., .default = labs)
  }
  if (!is.null(.lookup_table)) {
    vals <- zmisc::lookup(vals, .lookup_table)
    labs <- zmisc::lookup(labs, .lookup_table)
  }
  stopifnot(typeof(vals) == typeof(vals_org))

  # The value labels may contain duplicates and must be collapsed
  pastenames <- function(ix) paste0(lab_names[ix], collapse = .sep)
  grps <- vctrs::vec_group_loc(labs)
  labs_collapsed <- grps$key
  names(labs_collapsed) <- vapply(grps$loc, pastenames, character(1))

  # labs_out may contain labels for NA, which must be omitted,
  # and let's return a clean NULL if the length is 0
  labs_collapsed <- labs_collapsed[!is.na(labs_collapsed)]
  if (length(labs_collapsed) == 0) labs_collapsed <- NULL

  # Construct and return the result
  ll_labelled(vals, labs_collapsed, ll_var_label(.x))
}


#' @description
#' `lbl_recode_values()` is an alias for `lbl_recode()`, but makes it explicit
#' that focal target of the recoding is the underlying values in the `labelled`
#' variable.
#'
#' @rdname lbl_recode
#' @export
lbl_recode_values <- lbl_recode


#' @description
#' `lbl_recode_labels()` recodes the *text description* of the labels attached to the
#' `labelled` variable, leaving the underlying values unchanged. This is appropriate to do before
#' using the variable in functions that display the labels, in particular if the output is intended
#' for a final product or publication.
#'
#' @examples
#' lbl_recode_labels(veggies,
#'     "Carrot" ~ "A straight underground veggie",
#'     "Potato" ~ "A round underground veggie",
#'     "Tomato" ~ "A round overground veggie",
#'     "Cucumber" ~ "A (mostly) straight overground veggie")
#'
#' lbl_recode_labels(veggies,
#'     .lookup_table = c("Tomato" = "Tomaaato"))
#'
#' @rdname lbl_recode
#' @export
lbl_recode_labels <- function(.x, ..., .lookup_table = NULL) {

  # Check args (.lookup_table is checked by zmisc::lookup())
  ll_assert_labelled(.x)

  # The vectors to use
  labs <- ll_val_labels(.x)
  if (is.null(labs)) {
    return(.x)
  }
  lab_names <- names(labs)

  # Recode the names of the labels
  if (length(list(...)) > 0) {
    lab_names <- dplyr::case_match(lab_names, ..., .default = lab_names)
  }
  if (!is.null(.lookup_table)) {
    lab_names <- zmisc::lookup(lab_names, .lookup_table)
  }

  # Ensure the output is character, and then update labs
  stopifnot(typeof(lab_names) == "character")
  names(labs) <- lab_names

  # Construct and return the result
  ll_labelled(.x, labs, ll_var_label(.x))

}
