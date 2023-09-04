

helper_make_grocery_tibble <- function() {
  set.seed(1)
  yes_no <- ll_labelled(sample(c(0,1), 50, replace = TRUE),
                        c("No" = 0,
                          "Yes" = 1))
  opinion <- ll_labelled(sample(c(1:5,NA), 50, replace = TRUE),
                        c("DISAGREE!" = 1L,
                          "Disagree" = 2L,
                          "Mehh" = 3L,
                          "Agree" = 4L,
                          "AGREE!" = 5L))

  grocery_val_labels <- 1:20
  names(grocery_val_labels) <-
  c("Foodie Fantasia", "Lush Larder", "Quirk & Quinoa", "Gastronome Galaxy",
    "The Veggie Vista", "NomadNosh", "Sunset Supplies", "Radiant Rations",
    "CosmicCabbage", "Tradish Treats", "Market & Mystic", "PurelyProduce",
    "Stellar Stacks", "FeastFrontier", "Groove & Grain", "CulinaCavern",
    "Whimsical Wares", "Terra Traditions", "ZestQuest", "The Pantry Paradox")
  stores <- ll_labelled(sample(c(1:20, NA), 50, replace = TRUE),
                                grocery_val_labels)

  ll_var_label(yes_no) <- "A yesno label"
  ll_var_label(fruit_lbl) <- "A fruity label"
  ll_var_label(fruit_lbl_chr) <- "A char-fruity label"
  ll_var_label(stores) <- "Grocery store name"
  ll_var_label(opinion) <- "Some strong opinions"
  ll_var_label(veggies) <- "Prime indexed veggies"
  ll_var_label(fruit_lbl_int) <- "Integer labelled fruit"

  d <- tibble::tibble(
    stores_char_labels = stores,
    yes_no_logical = yes_no,
    opinion_ordered = opinion,
    veggies_factor = veggies,
    fruit_zapped = fruit_lbl_int,
    fruit_numeric = fruit_lbl,
    fruit_char_values = fruit_lbl_chr)
  d
}
