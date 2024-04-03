History of Amherst College data package
================
STAT325 class at Amherst College (Nicholas Horton)
2024-04-03

## Text and analysis related to Williams S. Tyler’s “History of Amherst College” (1873)

This repo provides the curated text from the book entitled *History of
Amherst College during the First Half Century*.

See https://archive.org/details/historyofamherst00tyleiala for the book
in a variety of formats.

Our mission was to take the text file for this historic text and make it
accessible more broadly.

This file describes the `HistoryAmherstCollege` package.

## Website

A website can be found at
https://stat325-s24.github.io/HistoryAmherstCollege/

## Installation instructions

    devtools::install_github("STAT325-S24/HistoryAmherstCollege")
    library(HistoryAmherstCollege)

## Example analyses

XX will go here…

``` r
glimpse(history_text)
```

    Rows: 5,913
    Columns: 3
    $ text      <chr> "Amherst College DUrING ITS FIRST HALF CENTURY.  1821-1871."…
    $ chapter   <chr> "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", …
    $ paragraph <dbl> 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, …

``` r
glimpse(history_anno)
```

    Rows: 1
    Columns: 2
    $ x <dbl> 1
    $ y <dbl> 2

## Notes

-   The index was not included in the text in the package
-   Footnotes were moved into the text where referenced (e.g.,
    `[This is a footnote.]`)
-   Erratum on page 671 states:
    `On page 290, line 20, for Humphrey read Hitchcock`. This change has
    been noted in the text.
