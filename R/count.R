
#' Count entries in a labelled variable
#'
#' @param x A labelled variable
#' @param sort If `TRUE`, the result will be sorted so that the most common
#'   values float to the top. If it is false, the result will be sorted in the
#'   order of the *values* of the labelled variable.
#' @param prop If `TRUE`, compute the fraction of marginal table.
#' @param ... Currently unused
#' @param include_var_label Should an extra line be included with the variable
#'   label (if any).
#'
#' @return A tibble with columns `v`, `l`, `n` and `p`, if prop is `TRUE`.
#'
#' @examples
#'   table(fruit_lbl)
#'   lbl_count(fruit_lbl)
#'   lbl_count(fruit_lbl, sort = TRUE)
#'   lbl_count(fruit_lbl, sort = TRUE, prop = TRUE)
#'
#' @seealso [forcats::fct_count()]
#'
#' @export
lbl_count <- function(x, sort = FALSE, prop = FALSE, ..., include_var_label = FALSE) {
  x <- check_labelled(x)
  check_bool(sort)
  check_bool(prop)

  d.n <- tibble::tibble(
            v = get_labelled_values_n(x),
            l = get_labelled_labels_n(x) )

  d.m <- tibble::tibble(
            v = get_labelled_values_m(x),
            l = get_labelled_labels_m(x))

  df <- d.n |>
    dplyr::count(.data$v, .data$l) |>
    dplyr::full_join(d.m, by = c("v","l"))
  df$n[is.na(df$n)] <- 0  # NA in n signals no entries with that label

  if (sort) {
    df <- df |> dplyr::arrange(dplyr::desc(.data$n), .data$v)
  } else {
    df <- df |> dplyr::arrange(.data$v)
  }

  if (prop) {
    df$p <- prop.table(df$n)
  }

  if (include_var_label) {
    df <- dplyr::bind_rows(df,
      tibble::tibble(v = NA, l=paste("var_label:", labelled::var_label(x)), n = NA))
  }

  df
}
