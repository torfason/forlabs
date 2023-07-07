
#' Count entries in a labelled variable
#'
#' @param x A labelled variable
#' @param sort If `TRUE`, the result will be sorted so that the most common values
#'   float to the top. If it is false, the result will be sorted in the order of
#'   the *values* of the labelled variable.
#' @param prop If `TRUE`, compute the fraction of marginal table.
#' @return A tibble with columns `v`, `l`, `n` and `p`, if prop is `TRUE`.
#' @examples
#' set.seed(42)
#' fruit <- labelled::labelled(
#'   sample(c(2L, 3L, 5L, 7L, 11L), 100, TRUE, prob=c(3,3,2,5,1)),
#'   labels = c(Apple = 2, Orange = 7, Peach = 11, Banana = 3, Lime = 5),
#'   label = "Some fruits")
#' table(fruit)
#' lbl_count(fruit)
#' lbl_count(fruit, sort = TRUE)
#' lbl_count(fruit, sort = TRUE, prop = TRUE)
#' @export
lbl_count <- function(x, sort = FALSE, prop = FALSE) {
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
    dplyr::count(v, l) |>
    dplyr::full_join(d.m, by = c("v","l"))
  df$n[is.na(df$n)] <- 0  # NA in n signals no entries with that label

  if (sort) {
    df <- df |> dplyr::arrange(dplyr::desc(n), v)
  } else {
    df <- df |> dplyr::arrange(v)
  }

  if (prop) {
    df$p <- prop.table(df$n)
  }

  df
}
