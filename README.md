
<!-- README.md is generated from README.Rmd. Please edit that file -->

# forlabs

<!-- badges: start -->

[![GitHub
version](https://img.shields.io/badge/Git-0.0.2-success)](https://github.com/torfason/zmisc)
[![R-CMD-check](https://github.com/torfason/forlabs/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/torfason/forlabs/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Tools for Working with Labelled Variables

Provides functions for labelled variables (`haven_labelled`) that
correspond to those that the `forcats` package provides for categorical
variables (`factor`).

## Installation

Use `pak` to install the development version of `forlabs` from
[GitHub](https://github.com/torfason/forlabs):

``` r
pak::pak("torfason/forlabs")
```

## Usage

The forcats package offers an extensive suite of functions tailored for
handling factor variables effectively. This package presents a
complementary set of functions, designed specifically to operate
seamlessly on haven_labelled vectors.

The functions included in forlabs are designed to emulate the
functionality of those in forcats as closely as possible. For instance,
the following illustration uses `lbl_count()` to create a frequency
table generated for a `haven_labelled` vector of fruit, in comparison
with how this can be done with a `factor` variable using
`forcats::fct_count()`:

``` r
library(forlabs)
library(forcats)

# Count the different levels of a labelled variable
lbl_count(fruit_lbl) #|> gt::gt()
#> # A tibble: 5 × 3
#>       v l          n
#>   <dbl> <chr>  <dbl>
#> 1     1 Apple     10
#> 2     2 Banana    12
#> 3     3 Lime       9
#> 4     4 Orange    10
#> 5     5 Peach      9

# Count the different levels a factor variable
fct_count(fruit_fct) #|> gt::gt()
#> # A tibble: 5 × 2
#>   f          n
#>   <fct>  <int>
#> 1 Apple     10
#> 2 Banana    12
#> 3 Lime       9
#> 4 Orange    10
#> 5 Peach      9
```

The package also offers functions for shifting and otherwise
manipulating labelled variables.

``` r
# Veggies is indexed by prime number ...
veggies |> lbl_count() #|> gt::gt()
#> # A tibble: 5 × 3
#>       v l            n
#>   <dbl> <chr>    <dbl>
#> 1     2 Carrot      17
#> 2     3 Potato      10
#> 3     5 Tomato       7
#> 4     7 Cucumber     8
#> 5    11 Broccoli     8
```

``` r
# But can be 'densified' to be indexed by 1:n instead ...
dense_veggies <- veggies |> lbl_densify()
dense_veggies |> lbl_count() #|> gt::gt()
#> # A tibble: 5 × 3
#>       v l            n
#>   <dbl> <chr>    <dbl>
#> 1     1 Carrot      17
#> 2     2 Potato      10
#> 3     3 Tomato       7
#> 4     4 Cucumber     8
#> 5     5 Broccoli     8
```

``` r
# And shifted to run from zero instead of 1
shifted_veggies <- veggies |> lbl_shift()
shifted_veggies |> lbl_count() #|> gt::gt()  
#> # A tibble: 5 × 3
#>       v l            n
#>   <dbl> <chr>    <dbl>
#> 1     1 Carrot      17
#> 2     2 Potato      10
#> 3     4 Tomato       7
#> 4     6 Cucumber     8
#> 5    10 Broccoli     8
```

``` r
# If a variable contains unlabelled values, as is the
# case with exotic_veggies, the labels can be filled
filled_exotic_veggies <- exotic_veggies |> lbl_fill()
filled_exotic_veggies |> lbl_count() #|> gt::gt_preview(top_n=6, bottom_n=2)
#> # A tibble: 18 × 3
#>        v l             n
#>    <dbl> <chr>     <dbl>
#>  1     2 Bokchoy       8
#>  2     3 Celeriac      4
#>  3     4 <4>           4
#>  4     5 Chayote       6
#>  5     7 Eggplant      0
#>  6     8 <8>           2
#>  7    11 Endive        3
#>  8    13 Fennel        7
#>  9    16 <16>          3
#> 10    17 Jicama        3
#> 11    19 Kohlrabi      1
#> 12    23 Okra          4
#> 13    29 Radicchio     1
#> 14    31 Rutabaga      1
#> 15    32 <32>          1
#> 16    37 Taro          1
#> 17    41 Zucchini      0
#> 18    NA <NA>          1
```

## Dependencies

The `forlabs` package, almost by definition, depends on `labelled` and
`haven`, as these packages together define and implement the core class
of labelled variables (the `haven_labelled`) class.

As these packages depend on a number of other useful packages, including
`dplyr`, `stringr`, and `reader`, it is possible for `forlabs` to take a
dependency on those useful packages without incurring any extra
installation cost, in addition to other more lightweight packages such
as `rlang`, `glue`, `vctrs` and `tibble`.
