
# ---- Special functions ----

## General purpose assertion function
#' @importFrom checkmate qassert
checkmate::qassert


# ---- Scalar assertions ----

## Check if an argument is a flag
#' @importFrom checkmate assert_flag
checkmate::assert_flag

## Check if an argument is a single integerish value
#' @importFrom checkmate assert_int
checkmate::assert_int

## Check if an argument is a single numeric value
#' @importFrom checkmate assert_number
checkmate::assert_number

## Check if an argument is a string
#' @importFrom checkmate assert_string
checkmate::assert_string

## Check if an argument is a single atomic value
#' @importFrom checkmate assert_scalar
checkmate::assert_scalar

## Check if an argument is a count
#' @importFrom checkmate assert_count
checkmate::assert_count

## Check if an argument is TRUE
#' @importFrom checkmate assert_true
checkmate::assert_true

## Check if an argument is FALSE
#' @importFrom checkmate assert_false
checkmate::assert_false

## Check if an argument is NULL
#' @importFrom checkmate assert_null
checkmate::assert_null

## Check if an argument is a single missing value
#' @importFrom checkmate assert_scalar_na
checkmate::assert_scalar_na

## Check that an argument is an atomic vector
#' @importFrom checkmate assert_atomic
checkmate::assert_atomic

## Check that an argument is an atomic vector
#' @importFrom checkmate assert_atomic_vector
checkmate::assert_atomic_vector

## Check if an argument is a vector of type character
#' @importFrom checkmate assert_character
checkmate::assert_character

## Check if an argument is a vector of type complex
#' @importFrom checkmate assert_complex
checkmate::assert_complex

## Check that an argument is a Date
#' @importFrom checkmate assert_date
checkmate::assert_date

## Check that an argument is a vector of type double
#' @importFrom checkmate assert_double
checkmate::assert_double

## Check if an argument is a factor
#' @importFrom checkmate assert_factor
checkmate::assert_factor

## Check if an argument is vector of type integer
#' @importFrom checkmate assert_integer
checkmate::assert_integer

## Check if an object is an integerish vector
#' @importFrom checkmate assert_integerish
checkmate::assert_integerish

## Check if an argument is a vector of type logical
#' @importFrom checkmate assert_logical
checkmate::assert_logical

## Check that an argument is a vector of type numeric
#' @importFrom checkmate assert_numeric
checkmate::assert_numeric

## Check that an argument is a date/time object in POSIXct format
#' @importFrom checkmate assert_posixct
checkmate::assert_posixct

## Check if an argument is a raw vector
#' @importFrom checkmate assert_raw
checkmate::assert_raw

## Check if an argument is a vector
#' @importFrom checkmate assert_vector
checkmate::assert_vector

## Check if an argument is a list
#' @importFrom checkmate assert_list
checkmate::assert_list

## Check if an argument is named
#' @importFrom checkmate assert_named
checkmate::assert_named

## Check names to comply to specific rules
#' @importFrom checkmate assert_names
checkmate::assert_names

## Check if an argument is an array
#' @importFrom checkmate assert_array
checkmate::assert_array

## Check if an argument is a matrix
#' @importFrom checkmate assert_matrix
checkmate::assert_matrix

## Check if an argument is a data frame
#' @importFrom checkmate assert_data_frame
checkmate::assert_data_frame

## Check if an argument is a data table
#' @importFrom checkmate assert_data_table
checkmate::assert_data_table

## Check if an argument is a tibble
#' @importFrom checkmate assert_tibble
checkmate::assert_tibble

## Check the class membership of an argument
#' @importFrom checkmate assert_class
checkmate::assert_class

## Check if an argument is an environment
#' @importFrom checkmate assert_environment
checkmate::assert_environment

## Check if an argument is a formula
#' @importFrom checkmate assert_formula
checkmate::assert_formula

## Check if an argument is a function
#' @importFrom checkmate assert_function
checkmate::assert_function

## Check the class membership of an argument
#' @importFrom checkmate assert_multi_class
checkmate::assert_multi_class

## Check if an argument is an R6 class
#' @importFrom checkmate assert_r6
checkmate::assert_r6

## Check if an object is an element of a given set
#' @importFrom checkmate assert_choice
checkmate::assert_choice

## Check if an argument is disjunct from a given set
#' @importFrom checkmate assert_disjunct
checkmate::assert_disjunct

## Check if the arguments are permutations of each other
#' @importFrom checkmate assert_permutation
checkmate::assert_permutation

## Check if an argument is equal to a given set
#' @importFrom checkmate assert_set_equal
checkmate::assert_set_equal

## Check if an argument is a subset of a given set
#' @importFrom checkmate assert_subset
checkmate::assert_subset

## Check file system access rights
#' @importFrom checkmate assert_access
checkmate::assert_access

## Check for existence and access rights of directories
#' @importFrom checkmate assert_directory
checkmate::assert_directory

## Check existence and access rights of files
#' @importFrom checkmate assert_file
checkmate::assert_file

## Check the operating system
#' @importFrom checkmate assert_os
checkmate::assert_os

## Check if a path is suited for creating an output file
#' @importFrom checkmate assert_path_for_output
checkmate::assert_path_for_output
