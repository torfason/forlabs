
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
the following illustration uses `lbl_count()` to create a frequency
table generated for a `haven_labelled` vector of fruit, in comparison
with how this can be done with a `factor` variable using
`forcats::fct_count()`:

``` r
library(forlabs)
library(forcats)

# Count the different levels of a labelled variable
lbl_count(fruit_lbl) |> gt::gt()
```

<div id="bnobvdwsui" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#bnobvdwsui table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#bnobvdwsui thead, #bnobvdwsui tbody, #bnobvdwsui tfoot, #bnobvdwsui tr, #bnobvdwsui td, #bnobvdwsui th {
  border-style: none;
}
&#10;#bnobvdwsui p {
  margin: 0;
  padding: 0;
}
&#10;#bnobvdwsui .gt_table {
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
&#10;#bnobvdwsui .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#bnobvdwsui .gt_title {
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
&#10;#bnobvdwsui .gt_subtitle {
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
&#10;#bnobvdwsui .gt_heading {
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
&#10;#bnobvdwsui .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#bnobvdwsui .gt_col_headings {
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
&#10;#bnobvdwsui .gt_col_heading {
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
&#10;#bnobvdwsui .gt_column_spanner_outer {
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
&#10;#bnobvdwsui .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#bnobvdwsui .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#bnobvdwsui .gt_column_spanner {
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
&#10;#bnobvdwsui .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#bnobvdwsui .gt_group_heading {
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
&#10;#bnobvdwsui .gt_empty_group_heading {
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
&#10;#bnobvdwsui .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#bnobvdwsui .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#bnobvdwsui .gt_row {
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
&#10;#bnobvdwsui .gt_stub {
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
&#10;#bnobvdwsui .gt_stub_row_group {
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
&#10;#bnobvdwsui .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#bnobvdwsui .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#bnobvdwsui .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#bnobvdwsui .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#bnobvdwsui .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#bnobvdwsui .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#bnobvdwsui .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#bnobvdwsui .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#bnobvdwsui .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#bnobvdwsui .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#bnobvdwsui .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#bnobvdwsui .gt_footnotes {
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
&#10;#bnobvdwsui .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#bnobvdwsui .gt_sourcenotes {
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
&#10;#bnobvdwsui .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#bnobvdwsui .gt_left {
  text-align: left;
}
&#10;#bnobvdwsui .gt_center {
  text-align: center;
}
&#10;#bnobvdwsui .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#bnobvdwsui .gt_font_normal {
  font-weight: normal;
}
&#10;#bnobvdwsui .gt_font_bold {
  font-weight: bold;
}
&#10;#bnobvdwsui .gt_font_italic {
  font-style: italic;
}
&#10;#bnobvdwsui .gt_super {
  font-size: 65%;
}
&#10;#bnobvdwsui .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#bnobvdwsui .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#bnobvdwsui .gt_indent_1 {
  text-indent: 5px;
}
&#10;#bnobvdwsui .gt_indent_2 {
  text-indent: 10px;
}
&#10;#bnobvdwsui .gt_indent_3 {
  text-indent: 15px;
}
&#10;#bnobvdwsui .gt_indent_4 {
  text-indent: 20px;
}
&#10;#bnobvdwsui .gt_indent_5 {
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
<td headers="l" class="gt_row gt_left">Apple</td>
<td headers="n" class="gt_row gt_right">10</td></tr>
    <tr><td headers="v" class="gt_row gt_right">2</td>
<td headers="l" class="gt_row gt_left">Banana</td>
<td headers="n" class="gt_row gt_right">12</td></tr>
    <tr><td headers="v" class="gt_row gt_right">3</td>
<td headers="l" class="gt_row gt_left">Lime</td>
<td headers="n" class="gt_row gt_right">9</td></tr>
    <tr><td headers="v" class="gt_row gt_right">4</td>
<td headers="l" class="gt_row gt_left">Orange</td>
<td headers="n" class="gt_row gt_right">10</td></tr>
    <tr><td headers="v" class="gt_row gt_right">5</td>
<td headers="l" class="gt_row gt_left">Peach</td>
<td headers="n" class="gt_row gt_right">9</td></tr>
  </tbody>
  &#10;  
</table>
</div>

``` r

# Count the different levels a factor variable
fct_count(fruit_fct) |> gt::gt()
```

<div id="wkiwgytbxl" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#wkiwgytbxl table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#wkiwgytbxl thead, #wkiwgytbxl tbody, #wkiwgytbxl tfoot, #wkiwgytbxl tr, #wkiwgytbxl td, #wkiwgytbxl th {
  border-style: none;
}
&#10;#wkiwgytbxl p {
  margin: 0;
  padding: 0;
}
&#10;#wkiwgytbxl .gt_table {
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
&#10;#wkiwgytbxl .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#wkiwgytbxl .gt_title {
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
&#10;#wkiwgytbxl .gt_subtitle {
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
&#10;#wkiwgytbxl .gt_heading {
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
&#10;#wkiwgytbxl .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#wkiwgytbxl .gt_col_headings {
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
&#10;#wkiwgytbxl .gt_col_heading {
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
&#10;#wkiwgytbxl .gt_column_spanner_outer {
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
&#10;#wkiwgytbxl .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#wkiwgytbxl .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#wkiwgytbxl .gt_column_spanner {
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
&#10;#wkiwgytbxl .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#wkiwgytbxl .gt_group_heading {
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
&#10;#wkiwgytbxl .gt_empty_group_heading {
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
&#10;#wkiwgytbxl .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#wkiwgytbxl .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#wkiwgytbxl .gt_row {
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
&#10;#wkiwgytbxl .gt_stub {
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
&#10;#wkiwgytbxl .gt_stub_row_group {
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
&#10;#wkiwgytbxl .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#wkiwgytbxl .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#wkiwgytbxl .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#wkiwgytbxl .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#wkiwgytbxl .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#wkiwgytbxl .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#wkiwgytbxl .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#wkiwgytbxl .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#wkiwgytbxl .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#wkiwgytbxl .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#wkiwgytbxl .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#wkiwgytbxl .gt_footnotes {
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
&#10;#wkiwgytbxl .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#wkiwgytbxl .gt_sourcenotes {
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
&#10;#wkiwgytbxl .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#wkiwgytbxl .gt_left {
  text-align: left;
}
&#10;#wkiwgytbxl .gt_center {
  text-align: center;
}
&#10;#wkiwgytbxl .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#wkiwgytbxl .gt_font_normal {
  font-weight: normal;
}
&#10;#wkiwgytbxl .gt_font_bold {
  font-weight: bold;
}
&#10;#wkiwgytbxl .gt_font_italic {
  font-style: italic;
}
&#10;#wkiwgytbxl .gt_super {
  font-size: 65%;
}
&#10;#wkiwgytbxl .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#wkiwgytbxl .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#wkiwgytbxl .gt_indent_1 {
  text-indent: 5px;
}
&#10;#wkiwgytbxl .gt_indent_2 {
  text-indent: 10px;
}
&#10;#wkiwgytbxl .gt_indent_3 {
  text-indent: 15px;
}
&#10;#wkiwgytbxl .gt_indent_4 {
  text-indent: 20px;
}
&#10;#wkiwgytbxl .gt_indent_5 {
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
    <tr><td headers="f" class="gt_row gt_center">Apple</td>
<td headers="n" class="gt_row gt_right">10</td></tr>
    <tr><td headers="f" class="gt_row gt_center">Banana</td>
<td headers="n" class="gt_row gt_right">12</td></tr>
    <tr><td headers="f" class="gt_row gt_center">Lime</td>
<td headers="n" class="gt_row gt_right">9</td></tr>
    <tr><td headers="f" class="gt_row gt_center">Orange</td>
<td headers="n" class="gt_row gt_right">10</td></tr>
    <tr><td headers="f" class="gt_row gt_center">Peach</td>
<td headers="n" class="gt_row gt_right">9</td></tr>
  </tbody>
  &#10;  
</table>
</div>

The package also offers functions for shifting and otherwise
manipulating labelled variables.

``` r
# Veggies is indexed by prime number ...
veggies |> lbl_count() |> gt::gt()
```

<div id="syebtlfrhg" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#syebtlfrhg table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#syebtlfrhg thead, #syebtlfrhg tbody, #syebtlfrhg tfoot, #syebtlfrhg tr, #syebtlfrhg td, #syebtlfrhg th {
  border-style: none;
}
&#10;#syebtlfrhg p {
  margin: 0;
  padding: 0;
}
&#10;#syebtlfrhg .gt_table {
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
&#10;#syebtlfrhg .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#syebtlfrhg .gt_title {
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
&#10;#syebtlfrhg .gt_subtitle {
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
&#10;#syebtlfrhg .gt_heading {
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
&#10;#syebtlfrhg .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#syebtlfrhg .gt_col_headings {
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
&#10;#syebtlfrhg .gt_col_heading {
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
&#10;#syebtlfrhg .gt_column_spanner_outer {
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
&#10;#syebtlfrhg .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#syebtlfrhg .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#syebtlfrhg .gt_column_spanner {
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
&#10;#syebtlfrhg .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#syebtlfrhg .gt_group_heading {
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
&#10;#syebtlfrhg .gt_empty_group_heading {
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
&#10;#syebtlfrhg .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#syebtlfrhg .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#syebtlfrhg .gt_row {
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
&#10;#syebtlfrhg .gt_stub {
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
&#10;#syebtlfrhg .gt_stub_row_group {
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
&#10;#syebtlfrhg .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#syebtlfrhg .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#syebtlfrhg .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#syebtlfrhg .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#syebtlfrhg .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#syebtlfrhg .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#syebtlfrhg .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#syebtlfrhg .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#syebtlfrhg .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#syebtlfrhg .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#syebtlfrhg .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#syebtlfrhg .gt_footnotes {
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
&#10;#syebtlfrhg .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#syebtlfrhg .gt_sourcenotes {
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
&#10;#syebtlfrhg .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#syebtlfrhg .gt_left {
  text-align: left;
}
&#10;#syebtlfrhg .gt_center {
  text-align: center;
}
&#10;#syebtlfrhg .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#syebtlfrhg .gt_font_normal {
  font-weight: normal;
}
&#10;#syebtlfrhg .gt_font_bold {
  font-weight: bold;
}
&#10;#syebtlfrhg .gt_font_italic {
  font-style: italic;
}
&#10;#syebtlfrhg .gt_super {
  font-size: 65%;
}
&#10;#syebtlfrhg .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#syebtlfrhg .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#syebtlfrhg .gt_indent_1 {
  text-indent: 5px;
}
&#10;#syebtlfrhg .gt_indent_2 {
  text-indent: 10px;
}
&#10;#syebtlfrhg .gt_indent_3 {
  text-indent: 15px;
}
&#10;#syebtlfrhg .gt_indent_4 {
  text-indent: 20px;
}
&#10;#syebtlfrhg .gt_indent_5 {
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
    <tr><td headers="v" class="gt_row gt_right">2</td>
<td headers="l" class="gt_row gt_left">Carrot</td>
<td headers="n" class="gt_row gt_right">17</td></tr>
    <tr><td headers="v" class="gt_row gt_right">3</td>
<td headers="l" class="gt_row gt_left">Potato</td>
<td headers="n" class="gt_row gt_right">10</td></tr>
    <tr><td headers="v" class="gt_row gt_right">5</td>
<td headers="l" class="gt_row gt_left">Tomato</td>
<td headers="n" class="gt_row gt_right">7</td></tr>
    <tr><td headers="v" class="gt_row gt_right">7</td>
<td headers="l" class="gt_row gt_left">Cucumber</td>
<td headers="n" class="gt_row gt_right">8</td></tr>
    <tr><td headers="v" class="gt_row gt_right">11</td>
<td headers="l" class="gt_row gt_left">Broccoli</td>
<td headers="n" class="gt_row gt_right">8</td></tr>
  </tbody>
  &#10;  
</table>
</div>

``` r
# But can be 'densified' to be indexed by 1:n instead ...
dense_veggies <- veggies |> lbl_densify()
dense_veggies |> lbl_count() |> gt::gt()
```

<div id="efizidjfzw" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#efizidjfzw table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#efizidjfzw thead, #efizidjfzw tbody, #efizidjfzw tfoot, #efizidjfzw tr, #efizidjfzw td, #efizidjfzw th {
  border-style: none;
}
&#10;#efizidjfzw p {
  margin: 0;
  padding: 0;
}
&#10;#efizidjfzw .gt_table {
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
&#10;#efizidjfzw .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#efizidjfzw .gt_title {
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
&#10;#efizidjfzw .gt_subtitle {
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
&#10;#efizidjfzw .gt_heading {
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
&#10;#efizidjfzw .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#efizidjfzw .gt_col_headings {
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
&#10;#efizidjfzw .gt_col_heading {
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
&#10;#efizidjfzw .gt_column_spanner_outer {
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
&#10;#efizidjfzw .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#efizidjfzw .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#efizidjfzw .gt_column_spanner {
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
&#10;#efizidjfzw .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#efizidjfzw .gt_group_heading {
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
&#10;#efizidjfzw .gt_empty_group_heading {
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
&#10;#efizidjfzw .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#efizidjfzw .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#efizidjfzw .gt_row {
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
&#10;#efizidjfzw .gt_stub {
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
&#10;#efizidjfzw .gt_stub_row_group {
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
&#10;#efizidjfzw .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#efizidjfzw .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#efizidjfzw .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#efizidjfzw .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#efizidjfzw .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#efizidjfzw .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#efizidjfzw .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#efizidjfzw .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#efizidjfzw .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#efizidjfzw .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#efizidjfzw .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#efizidjfzw .gt_footnotes {
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
&#10;#efizidjfzw .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#efizidjfzw .gt_sourcenotes {
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
&#10;#efizidjfzw .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#efizidjfzw .gt_left {
  text-align: left;
}
&#10;#efizidjfzw .gt_center {
  text-align: center;
}
&#10;#efizidjfzw .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#efizidjfzw .gt_font_normal {
  font-weight: normal;
}
&#10;#efizidjfzw .gt_font_bold {
  font-weight: bold;
}
&#10;#efizidjfzw .gt_font_italic {
  font-style: italic;
}
&#10;#efizidjfzw .gt_super {
  font-size: 65%;
}
&#10;#efizidjfzw .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#efizidjfzw .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#efizidjfzw .gt_indent_1 {
  text-indent: 5px;
}
&#10;#efizidjfzw .gt_indent_2 {
  text-indent: 10px;
}
&#10;#efizidjfzw .gt_indent_3 {
  text-indent: 15px;
}
&#10;#efizidjfzw .gt_indent_4 {
  text-indent: 20px;
}
&#10;#efizidjfzw .gt_indent_5 {
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
<td headers="l" class="gt_row gt_left">Carrot</td>
<td headers="n" class="gt_row gt_right">17</td></tr>
    <tr><td headers="v" class="gt_row gt_right">2</td>
<td headers="l" class="gt_row gt_left">Potato</td>
<td headers="n" class="gt_row gt_right">10</td></tr>
    <tr><td headers="v" class="gt_row gt_right">3</td>
<td headers="l" class="gt_row gt_left">Tomato</td>
<td headers="n" class="gt_row gt_right">7</td></tr>
    <tr><td headers="v" class="gt_row gt_right">4</td>
<td headers="l" class="gt_row gt_left">Cucumber</td>
<td headers="n" class="gt_row gt_right">8</td></tr>
    <tr><td headers="v" class="gt_row gt_right">5</td>
<td headers="l" class="gt_row gt_left">Broccoli</td>
<td headers="n" class="gt_row gt_right">8</td></tr>
  </tbody>
  &#10;  
</table>
</div>

``` r
# And shifted to run from zero instead of 1
shifted_veggies <- veggies |> lbl_shift()
shifted_veggies |> lbl_count() |> gt::gt()  
```

<div id="coiamzijtu" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#coiamzijtu table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#coiamzijtu thead, #coiamzijtu tbody, #coiamzijtu tfoot, #coiamzijtu tr, #coiamzijtu td, #coiamzijtu th {
  border-style: none;
}
&#10;#coiamzijtu p {
  margin: 0;
  padding: 0;
}
&#10;#coiamzijtu .gt_table {
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
&#10;#coiamzijtu .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#coiamzijtu .gt_title {
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
&#10;#coiamzijtu .gt_subtitle {
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
&#10;#coiamzijtu .gt_heading {
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
&#10;#coiamzijtu .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#coiamzijtu .gt_col_headings {
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
&#10;#coiamzijtu .gt_col_heading {
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
&#10;#coiamzijtu .gt_column_spanner_outer {
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
&#10;#coiamzijtu .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#coiamzijtu .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#coiamzijtu .gt_column_spanner {
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
&#10;#coiamzijtu .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#coiamzijtu .gt_group_heading {
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
&#10;#coiamzijtu .gt_empty_group_heading {
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
&#10;#coiamzijtu .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#coiamzijtu .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#coiamzijtu .gt_row {
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
&#10;#coiamzijtu .gt_stub {
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
&#10;#coiamzijtu .gt_stub_row_group {
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
&#10;#coiamzijtu .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#coiamzijtu .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#coiamzijtu .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#coiamzijtu .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#coiamzijtu .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#coiamzijtu .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#coiamzijtu .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#coiamzijtu .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#coiamzijtu .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#coiamzijtu .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#coiamzijtu .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#coiamzijtu .gt_footnotes {
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
&#10;#coiamzijtu .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#coiamzijtu .gt_sourcenotes {
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
&#10;#coiamzijtu .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#coiamzijtu .gt_left {
  text-align: left;
}
&#10;#coiamzijtu .gt_center {
  text-align: center;
}
&#10;#coiamzijtu .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#coiamzijtu .gt_font_normal {
  font-weight: normal;
}
&#10;#coiamzijtu .gt_font_bold {
  font-weight: bold;
}
&#10;#coiamzijtu .gt_font_italic {
  font-style: italic;
}
&#10;#coiamzijtu .gt_super {
  font-size: 65%;
}
&#10;#coiamzijtu .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#coiamzijtu .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#coiamzijtu .gt_indent_1 {
  text-indent: 5px;
}
&#10;#coiamzijtu .gt_indent_2 {
  text-indent: 10px;
}
&#10;#coiamzijtu .gt_indent_3 {
  text-indent: 15px;
}
&#10;#coiamzijtu .gt_indent_4 {
  text-indent: 20px;
}
&#10;#coiamzijtu .gt_indent_5 {
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
<td headers="l" class="gt_row gt_left">Carrot</td>
<td headers="n" class="gt_row gt_right">17</td></tr>
    <tr><td headers="v" class="gt_row gt_right">2</td>
<td headers="l" class="gt_row gt_left">Potato</td>
<td headers="n" class="gt_row gt_right">10</td></tr>
    <tr><td headers="v" class="gt_row gt_right">4</td>
<td headers="l" class="gt_row gt_left">Tomato</td>
<td headers="n" class="gt_row gt_right">7</td></tr>
    <tr><td headers="v" class="gt_row gt_right">6</td>
<td headers="l" class="gt_row gt_left">Cucumber</td>
<td headers="n" class="gt_row gt_right">8</td></tr>
    <tr><td headers="v" class="gt_row gt_right">10</td>
<td headers="l" class="gt_row gt_left">Broccoli</td>
<td headers="n" class="gt_row gt_right">8</td></tr>
  </tbody>
  &#10;  
</table>
</div>

``` r
# If a variable contains unlabelled values, as is the
# case with exotic_veggies, the labels can be filled
filled_exotic_veggies <- exotic_veggies |> lbl_fill()
filled_exotic_veggies |> lbl_count() |> gt::gt_preview(top_n=6, bottom_n=2)
```

<div id="bamaynkjot" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#bamaynkjot table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#bamaynkjot thead, #bamaynkjot tbody, #bamaynkjot tfoot, #bamaynkjot tr, #bamaynkjot td, #bamaynkjot th {
  border-style: none;
}
&#10;#bamaynkjot p {
  margin: 0;
  padding: 0;
}
&#10;#bamaynkjot .gt_table {
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
&#10;#bamaynkjot .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#bamaynkjot .gt_title {
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
&#10;#bamaynkjot .gt_subtitle {
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
&#10;#bamaynkjot .gt_heading {
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
&#10;#bamaynkjot .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#bamaynkjot .gt_col_headings {
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
&#10;#bamaynkjot .gt_col_heading {
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
&#10;#bamaynkjot .gt_column_spanner_outer {
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
&#10;#bamaynkjot .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#bamaynkjot .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#bamaynkjot .gt_column_spanner {
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
&#10;#bamaynkjot .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#bamaynkjot .gt_group_heading {
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
&#10;#bamaynkjot .gt_empty_group_heading {
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
&#10;#bamaynkjot .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#bamaynkjot .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#bamaynkjot .gt_row {
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
&#10;#bamaynkjot .gt_stub {
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
&#10;#bamaynkjot .gt_stub_row_group {
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
&#10;#bamaynkjot .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#bamaynkjot .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#bamaynkjot .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#bamaynkjot .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#bamaynkjot .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#bamaynkjot .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#bamaynkjot .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#bamaynkjot .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#bamaynkjot .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#bamaynkjot .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#bamaynkjot .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#bamaynkjot .gt_footnotes {
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
&#10;#bamaynkjot .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#bamaynkjot .gt_sourcenotes {
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
&#10;#bamaynkjot .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#bamaynkjot .gt_left {
  text-align: left;
}
&#10;#bamaynkjot .gt_center {
  text-align: center;
}
&#10;#bamaynkjot .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#bamaynkjot .gt_font_normal {
  font-weight: normal;
}
&#10;#bamaynkjot .gt_font_bold {
  font-weight: bold;
}
&#10;#bamaynkjot .gt_font_italic {
  font-style: italic;
}
&#10;#bamaynkjot .gt_super {
  font-size: 65%;
}
&#10;#bamaynkjot .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#bamaynkjot .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#bamaynkjot .gt_indent_1 {
  text-indent: 5px;
}
&#10;#bamaynkjot .gt_indent_2 {
  text-indent: 10px;
}
&#10;#bamaynkjot .gt_indent_3 {
  text-indent: 15px;
}
&#10;#bamaynkjot .gt_indent_4 {
  text-indent: 20px;
}
&#10;#bamaynkjot .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="v">v</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="l">l</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="n">n</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub" style="font-family: Courier;">1</th>
<td headers="stub_1_1 v" class="gt_row gt_right">2</td>
<td headers="stub_1_1 l" class="gt_row gt_left">Bokchoy</td>
<td headers="stub_1_1 n" class="gt_row gt_right">8</td></tr>
    <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub" style="font-family: Courier;">2</th>
<td headers="stub_1_2 v" class="gt_row gt_right">3</td>
<td headers="stub_1_2 l" class="gt_row gt_left">Celeriac</td>
<td headers="stub_1_2 n" class="gt_row gt_right">4</td></tr>
    <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub" style="font-family: Courier;">3</th>
<td headers="stub_1_3 v" class="gt_row gt_right">4</td>
<td headers="stub_1_3 l" class="gt_row gt_left">&lt;4&gt;</td>
<td headers="stub_1_3 n" class="gt_row gt_right">4</td></tr>
    <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub" style="font-family: Courier;">4</th>
<td headers="stub_1_4 v" class="gt_row gt_right">5</td>
<td headers="stub_1_4 l" class="gt_row gt_left">Chayote</td>
<td headers="stub_1_4 n" class="gt_row gt_right">6</td></tr>
    <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub" style="font-family: Courier;">5</th>
<td headers="stub_1_5 v" class="gt_row gt_right">7</td>
<td headers="stub_1_5 l" class="gt_row gt_left">Eggplant</td>
<td headers="stub_1_5 n" class="gt_row gt_right">0</td></tr>
    <tr><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub" style="font-family: Courier;">6</th>
<td headers="stub_1_6 v" class="gt_row gt_right">8</td>
<td headers="stub_1_6 l" class="gt_row gt_left">&lt;8&gt;</td>
<td headers="stub_1_6 n" class="gt_row gt_right">2</td></tr>
    <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub" style="font-family: Courier; font-size: x-small; background-color: #E4E4E4;">7..16</th>
<td headers="stub_1_7 v" class="gt_row gt_right" style="background-color: #E4E4E4;"></td>
<td headers="stub_1_7 l" class="gt_row gt_left" style="background-color: #E4E4E4;"></td>
<td headers="stub_1_7 n" class="gt_row gt_right" style="background-color: #E4E4E4;"></td></tr>
    <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub" style="font-family: Courier;">17</th>
<td headers="stub_1_8 v" class="gt_row gt_right">41</td>
<td headers="stub_1_8 l" class="gt_row gt_left">Zucchini</td>
<td headers="stub_1_8 n" class="gt_row gt_right">0</td></tr>
    <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub" style="font-family: Courier;">18</th>
<td headers="stub_1_9 v" class="gt_row gt_right">NA</td>
<td headers="stub_1_9 l" class="gt_row gt_left">NA</td>
<td headers="stub_1_9 n" class="gt_row gt_right">1</td></tr>
  </tbody>
  &#10;  
</table>
</div>
