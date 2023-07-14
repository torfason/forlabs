
<!-- README.md is generated from README.Rmd. Please edit that file -->

# forlabs

<!-- badges: start -->

[![R-CMD-check](https://github.com/torfason/forlabs/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/torfason/forlabs/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Tools for Working with Labelled Variables

This package aims to be for labelled variables (`haven_labelled`) what
the `forcats` package is for categorical variables (`factor`).

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
the following illustration presents a frequency table generated for a
`haven_labelled` vector of vegetables:

``` r
library(labelled)
library(forlabs)

## Generate the veggies variable, a list of 20 veggies, of five types
set.seed(42)
veggie_types <- c("Broccoli" = 1, "Carrot" = 2, "Cucumber" = 3, "Potato" = 4, "Tomato" = 5)
veggies <- labelled(rbinom(20, 5, 0.7), labels = veggie_types)

# Count the different levels
lbl_count(veggies) |> gt::gt()
```

<div id="ociydemetb" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#ociydemetb table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#ociydemetb thead, #ociydemetb tbody, #ociydemetb tfoot, #ociydemetb tr, #ociydemetb td, #ociydemetb th {
  border-style: none;
}
&#10;#ociydemetb p {
  margin: 0;
  padding: 0;
}
&#10;#ociydemetb .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#ociydemetb .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#ociydemetb .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#ociydemetb .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#ociydemetb .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#ociydemetb .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ociydemetb .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#ociydemetb .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#ociydemetb .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#ociydemetb .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#ociydemetb .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#ociydemetb .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#ociydemetb .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#ociydemetb .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#ociydemetb .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#ociydemetb .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#ociydemetb .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#ociydemetb .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#ociydemetb .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ociydemetb .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#ociydemetb .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#ociydemetb .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#ociydemetb .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ociydemetb .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#ociydemetb .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#ociydemetb .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ociydemetb .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ociydemetb .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#ociydemetb .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#ociydemetb .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#ociydemetb .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ociydemetb .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#ociydemetb .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ociydemetb .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#ociydemetb .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ociydemetb .gt_left {
  text-align: left;
}
&#10;#ociydemetb .gt_center {
  text-align: center;
}
&#10;#ociydemetb .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#ociydemetb .gt_font_normal {
  font-weight: normal;
}
&#10;#ociydemetb .gt_font_bold {
  font-weight: bold;
}
&#10;#ociydemetb .gt_font_italic {
  font-style: italic;
}
&#10;#ociydemetb .gt_super {
  font-size: 65%;
}
&#10;#ociydemetb .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#ociydemetb .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#ociydemetb .gt_indent_1 {
  text-indent: 5px;
}
&#10;#ociydemetb .gt_indent_2 {
  text-indent: 10px;
}
&#10;#ociydemetb .gt_indent_3 {
  text-indent: 15px;
}
&#10;#ociydemetb .gt_indent_4 {
  text-indent: 20px;
}
&#10;#ociydemetb .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="v">v</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="l">l</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="n">n</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="v" class="gt_row gt_right">1</td>
<td headers="l" class="gt_row gt_left">Broccoli</td>
<td headers="n" class="gt_row gt_right">1</td></tr>
    <tr><td headers="v" class="gt_row gt_right">2</td>
<td headers="l" class="gt_row gt_left">Carrot</td>
<td headers="n" class="gt_row gt_right">4</td></tr>
    <tr><td headers="v" class="gt_row gt_right">3</td>
<td headers="l" class="gt_row gt_left">Cucumber</td>
<td headers="n" class="gt_row gt_right">7</td></tr>
    <tr><td headers="v" class="gt_row gt_right">4</td>
<td headers="l" class="gt_row gt_left">Potato</td>
<td headers="n" class="gt_row gt_right">6</td></tr>
    <tr><td headers="v" class="gt_row gt_right">5</td>
<td headers="l" class="gt_row gt_left">Tomato</td>
<td headers="n" class="gt_row gt_right">2</td></tr>
  </tbody>
  &#10;  
</table>
</div>

If we had a `factor` variable we would have used the equivalent
`forcats` function instead:

``` r
library(forcats)

# Convert veggies to factor
veggies_fct <- as_factor(veggies)

# Count the different levels
fct_count(veggies_fct) |> gt::gt()
```

<div id="hczajxkovz" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#hczajxkovz table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#hczajxkovz thead, #hczajxkovz tbody, #hczajxkovz tfoot, #hczajxkovz tr, #hczajxkovz td, #hczajxkovz th {
  border-style: none;
}
&#10;#hczajxkovz p {
  margin: 0;
  padding: 0;
}
&#10;#hczajxkovz .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#hczajxkovz .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#hczajxkovz .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#hczajxkovz .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#hczajxkovz .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#hczajxkovz .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#hczajxkovz .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#hczajxkovz .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#hczajxkovz .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#hczajxkovz .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#hczajxkovz .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#hczajxkovz .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#hczajxkovz .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#hczajxkovz .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#hczajxkovz .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#hczajxkovz .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#hczajxkovz .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#hczajxkovz .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#hczajxkovz .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hczajxkovz .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#hczajxkovz .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#hczajxkovz .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#hczajxkovz .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hczajxkovz .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#hczajxkovz .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#hczajxkovz .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#hczajxkovz .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hczajxkovz .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#hczajxkovz .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#hczajxkovz .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#hczajxkovz .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#hczajxkovz .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#hczajxkovz .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hczajxkovz .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#hczajxkovz .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hczajxkovz .gt_left {
  text-align: left;
}
&#10;#hczajxkovz .gt_center {
  text-align: center;
}
&#10;#hczajxkovz .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#hczajxkovz .gt_font_normal {
  font-weight: normal;
}
&#10;#hczajxkovz .gt_font_bold {
  font-weight: bold;
}
&#10;#hczajxkovz .gt_font_italic {
  font-style: italic;
}
&#10;#hczajxkovz .gt_super {
  font-size: 65%;
}
&#10;#hczajxkovz .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#hczajxkovz .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#hczajxkovz .gt_indent_1 {
  text-indent: 5px;
}
&#10;#hczajxkovz .gt_indent_2 {
  text-indent: 10px;
}
&#10;#hczajxkovz .gt_indent_3 {
  text-indent: 15px;
}
&#10;#hczajxkovz .gt_indent_4 {
  text-indent: 20px;
}
&#10;#hczajxkovz .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="f">f</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="n">n</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="f" class="gt_row gt_center">Broccoli</td>
<td headers="n" class="gt_row gt_right">1</td></tr>
    <tr><td headers="f" class="gt_row gt_center">Carrot</td>
<td headers="n" class="gt_row gt_right">4</td></tr>
    <tr><td headers="f" class="gt_row gt_center">Cucumber</td>
<td headers="n" class="gt_row gt_right">7</td></tr>
    <tr><td headers="f" class="gt_row gt_center">Potato</td>
<td headers="n" class="gt_row gt_right">6</td></tr>
    <tr><td headers="f" class="gt_row gt_center">Tomato</td>
<td headers="n" class="gt_row gt_right">2</td></tr>
  </tbody>
  &#10;  
</table>
</div>
