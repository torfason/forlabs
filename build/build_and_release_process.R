
# This script manages the build and release process for forlabs.

## Build package and basic documentation (before commits)
{
  devtools::document()
  devtools::build_readme()
  devtools::build()
  devtools::test()
  devtools::spell_check()
  devtools::check()
}

## Build vignettes and manual (as needed)
{
  devtools::build_vignettes()
  devtools::build_manual()
}

## Final checks (before release)
{
  system("R CMD INSTALL --preclean --no-multiarch --with-keep.source .")
  devtools::release_checks()
  devtools:::git_checks()
}


## Remote checks (commented out, copy to terminal and run manually)
# devtools::check_rhub()
# devtools::check_win_devel()

## Finally submit to cran (commented out, copy to terminal and run manually)
# devtools::release()
