
# ---- Fruit ----

# Define fruit, very basic test data, with both a lbl and fct version

# Sample fruit, all fruit vectors represent the same fruits
set.seed(42)
fruit_lbl <- labelled::labelled(sample(as.double(1:5), 50, TRUE, prob=c(3,3,2,5,1)),
              labels = c(Apple = 1, Banana = 2, Lime = 3, Orange = 4, Peach = 5))

fruit_lbl_int <- labelled::labelled(as.integer(fruit_lbl),
                   labels = c(Apple = 1, Banana = 2, Lime = 3, Orange = 4, Peach = 5))

fruit_lbl_chr <- labelled::labelled(letters[fruit_lbl],
                   labels = c(Apple = "a", Banana = "b", Lime = "c", Orange = "d", Peach = "e"))

fruit_fct <- forcats::as_factor(fruit_lbl)

# Use this data in the package
usethis::use_data(fruit_lbl, overwrite = TRUE)
usethis::use_data(fruit_lbl_int, overwrite = TRUE)
usethis::use_data(fruit_lbl_chr, overwrite = TRUE)
usethis::use_data(fruit_fct, overwrite = TRUE)


# ---- Veggies ----

# Veggies are a bit more complex

#primes::primes[1:15] |> dput()
primes <- c(2L, 3L, 5L, 7L, 11L, 13L, 17L, 19L, 23L, 29L, 31L, 37L, 41L, 43L, 47L) |> as.double()
plains <- c("Carrot", "Potato", "Tomato", "Cucumber", "Broccoli")
exotics <- c("Bokchoy", "Celeriac", "Chayote", "Eggplant", "Endive", "Fennel", "Jicama", "Kohlrabi", "Okra", "Radicchio", "Rutabaga", "Taro", "Zucchini")

# Sample indexes for plain and exotic veggies
set.seed(43)
ix_plain <- sample(1:5, 50,  TRUE, prob=17:13)
ix_exotic <- sample(c(1:14, NA), 50, TRUE, prob=c(17:15, 0, 14:7, 0, 11, 11))

# Generate plain veggies
veggies <- labelled::labelled(primes[ix_plain])
labs <- primes[1:5]
names(labs) = plains
labelled::val_labels(veggies) <- labs
veggies |> lbl_count()

# Generate exotic veggies
exotic_veggies <- labelled::labelled(primes[ix_exotic])
labs <- primes[1:13]
names(labs) = exotics
labelled::val_labels(exotic_veggies) <- labs
exotic_veggies |> lbl_count()

# Use this data in the package
usethis::use_data(veggies, overwrite = TRUE)
usethis::use_data(exotic_veggies, overwrite = TRUE)