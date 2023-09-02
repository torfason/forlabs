
#' Recode labelled variables using tilde notation
#'
#' @description
#' Recodes labelled variables and takes care to recode the levels of the value
#' labels so that the labels continue to track the underlying values. Recoding
#' multiple values to the same value results in corresponding variable labels
#' being combined. Recoding to `NA` results in corresponding labels to be
#' dropped since `NA` should not be labelled in standard `haven_labelled`
#' variables.
#'
#' The underlying recoding takes place using `dplyr::case_match()`, which takes
#' `tilde` or `formula` notation.
#'
#' @param .x The `labelled` vector to recode.
#' @param ... A recode specification in `tilde` (`formula`) syntax.
#' @param .sep A string for how to separate labels that need to be combined.
#' @return The re-coded vector.
#'
#' @examples
#' lbl_recode(fruit_lbl, 1:2 ~ 1, 3 ~ 2, 4:5 ~ 3)
#' lbl_recode(fruit_lbl_chr, "d" ~ "z", "e" ~ NA)
#' lbl_recode(exotic_veggies, 3:10 ~ 1, 11:20 ~ 2, 21:41 ~ 3,
#'                            2 ~ NA, NA ~ 99)
#'
#' @export
lbl_recode <- function (.x, ..., .sep = " / ") {

  # Check args
  ll_assert_labelled(.x)
  qassert(.sep, "S1")

  # The vectors to use
  vals <- as.vector(.x)
  labs <- ll_val_labels(.x, always = TRUE)
  lab_names <- names(labs)

  # Recode the values, then the value labels vector
  vals_rcd <- dplyr::case_match(vals, ..., .default = vals)
  labs_rcd <- dplyr::case_match(labs, ..., .default = labs)
  stopifnot(typeof(vals) == typeof(vals_rcd))

  # The value labels may contain duplicates and must be collapsed
  pastenames <- function(ix) paste0(lab_names[ix], collapse = .sep)
  grps <- vctrs::vec_group_loc(labs_rcd)
  labs_out <- grps$key
  names(labs_out) <- vapply(grps$loc, pastenames, character(1))

  # labs_out may contain labels for NA, which must be omitted,
  # and let's return a clean NULL if the length is 0
  labs_out <- labs_out[!is.na(labs_out)]
  if (length(labs_out) == 0) labs_out <- NULL

  # Construct and return the result
  ll_labelled(vals_rcd, labs_out, ll_var_label(.x))
}




# # Recoding without any label handling
# x <- c(letters[1:5], NA)
# x
# x |> recode_tilde("a" ~ "b")
# x |> recode_tilde("a" ~ NA)
#
#
#
# if (FALSE) {
#
#   fruit_lbl |> lbl_count()
#   fruit_lbl |> lbl_recode(5 ~ 6, 2 ~ 0) |> lbl_count()
#   fruit_lbl |> lbl_recode(5 ~ 4, 1 ~ 2, .collision = "ok") |> lbl_count()
#
#   labs <- c("Yes" = 1, "No" = 2, "Don't know" = 3, "Won't answer" = 4)
#
#   works <- labelled(c(1, 2, 3, 4, NA), labels = labs)
#   fails <- labelled(c(NA, 1, 2, 3, 4), labels = labs)
#
#   works |> lbl_recode(2~0)
#   fails |> lbl_recode(2~0)
#
#   # Nice way to map to NA BUT DOES NOT WORK DUE TO NA HANDLING
#   fruit_lbl |> lbl_recode(5 ~ NA) |> lbl_count()
#
#   1:3 |> recode_tilde(3~NA)
#   fruit_lbl |> recode_tilde(3~NA)
#   fruit_lbl |> lbl_recode(3~NA)
#
#   # Order does not matter, the mappings are matched as in parallel
#   veggies |>lbl_count()
#   veggies |> lbl_recode(2~1, 3~2) |> lbl_count()
#   veggies |> lbl_recode(3~2, 2~1) |> lbl_count()
#
#   # Works even for multiple iterations
#   fruit_lbl |> lbl_recode(1~2, 2~3, 3~4, 4~5, 5~6) |> lbl_count()
#   fruit_lbl |> lbl_recode(5~6, 4~5, 3~4, 2~3, 1~2) |> lbl_count()
#
#   # mapping to unlabelled conflict
#   exotic_veggies |> lbl_count()
#   exotic_veggies |> lbl_recode(0~0) |> lbl_count()
#   exotic_veggies |> lbl_recode(7~4) |> lbl_count()
#
# }
#
# # REIMPLEMENTATION SCRATCHES BELOW
#
# if (FALSE) {
#
#   .x <- fruit_lbl
#   ret <- dplyr::case_match(.x, 5~4, .default = .default)
#
#   vals <- vec_data(.x)
#   labs <- ll_val_labels(.x)
#
#   vals_new <- dplyr::case_match(vals, c(5,4)~2, c(3,2)~1, .default = vals)
#   labs_new <- dplyr::case_match(labs, c(5,4)~2, c(3,2)~1, .default = labs)
#
#   vals
#   vals_new
#   labs
#   labs_new
# }
