History of Amherst College data package
================
STAT325 class at Amherst College (Nicholas Horton)
2024-04-14

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

The following is a glimpse of the packages dataframes along with a
sample analysis using Named Entity Recognition.

``` r
packageVersion("HistoryAmherstCollege")
```

    [1] '0.9.1'

``` r
glimpse(history_text)
```

    Rows: 25,537
    Columns: 4
    $ text      <chr> "Amherst College DURING ITS FIRST HALF CENTURY.  1821-1871."…
    $ chapter   <chr> "00", "00", "00", "00", "00", "00", "00", "00", "00", "00", …
    $ paragraph <dbl> 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, …
    $ page_num  <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …

``` r
mosaic::tally(~ chapter, data = history_text)
```

    chapter
      00   01   02   03   04   05   06   07   08   09   10   11   12   13   14   15 
     157  422  394  207  398  402  402  693  536  900 1336 1284  958 1109 1192  288 
      16   17   18   19   20   21   22   23   24   25   26   27   28   29 
    1313 1231  439 1298 2081 1238 1077  674  907 1486  666  308 1638  503 

``` r
glimpse(history_anno)
```

    List of 3
     $ token   : tibble [281,268 × 10] (S3: tbl_df/tbl/data.frame)
      ..$ doc_id       : int [1:281268] 1 1 1 1 1 1 1 1 1 1 ...
      ..$ sid          : int [1:281268] 1 1 1 1 1 1 1 1 1 2 ...
      ..$ tid          : int [1:281268] 1 2 3 4 5 6 7 8 9 1 ...
      ..$ token        : chr [1:281268] "Amherst" "College" "DURING" "ITS" ...
      ..$ token_with_ws: chr [1:281268] "Amherst " "College " "DURING " "ITS " ...
      ..$ lemma        : chr [1:281268] "Amherst" "College" "during" "its" ...
      ..$ upos         : chr [1:281268] "PROPN" "PROPN" "ADP" "PRON" ...
      ..$ xpos         : chr [1:281268] "NNP" "NNP" "IN" "PRP$" ...
      ..$ tid_source   : int [1:281268] 2 0 2 7 7 7 3 2 8 3 ...
      ..$ relation     : chr [1:281268] "compound" "root" "prep" "poss" ...
     $ entity  : tibble [19,049 × 6] (S3: tbl_df/tbl/data.frame)
      ..$ doc_id     : int [1:19049] 1 1 1 2 3 4 6 6 7 8 ...
      ..$ sid        : int [1:19049] 1 1 2 1 1 1 1 1 1 1 ...
      ..$ tid        : int [1:19049] 1 4 1 2 5 4 1 3 1 1 ...
      ..$ tid_end    : int [1:19049] 2 7 3 4 5 8 1 3 3 1 ...
      ..$ entity_type: chr [1:19049] "ORG" "DATE" "DATE" "PERSON" ...
      ..$ entity     : chr [1:19049] "Amherst College" "ITS FIRST HALF CENTURY" "1821-1871" "W. S. TYLER" ...
     $ document: tibble [25,541 × 3] (S3: tbl_df/tbl/data.frame)
      ..$ chapter  : chr [1:25541] "00" "00" "00" "00" ...
      ..$ paragraph: num [1:25541] 1 1 1 1 2 2 2 2 3 3 ...
      ..$ doc_id   : int [1:25541] 1 2 3 4 5 6 7 8 9 10 ...
     - attr(*, "class")= chr [1:2] "cnlp_annotation" "list"

``` r
mosaic::tally(~ entity$entity_type, data = history_anno)
```

    entity$entity_type
       CARDINAL        DATE       EVENT         FAC         GPE    LANGUAGE 
           1924        4020          24         169        2165          56 
            LAW         LOC       MONEY        NORP     ORDINAL         ORG 
             38         342         342         844         618        3826 
        PERCENT      PERSON     PRODUCT    QUANTITY        TIME WORK_OF_ART 
              5        4121          88          44         269         154 

``` r
glimpse(history_subtitles)
```

    Rows: 656
    Columns: 4
    $ page_number <int> 5, 6, 7, 8, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24…
    $ page_header <chr> "PREFACE. 5 (v)", "6 (vi) PREFACE.  ", "PREFACE. 7 (vii)",…
    $ first_line  <chr> "THIS History was a part of the plan for the Semi-Centenni…
    $ chapter     <chr> "00", "00", "00", "00", "01", "01", "01", "01", "01", "01"…

``` r
glimpse(history_tables)
```

    Rows: 15
    Columns: 3
    $ pdf_pg  <dbl> 15, 335, 412, 493, 506, 649, 655, 657, 668, 676, 680, 688, 693…
    $ book_pg <dbl> 9, 321, 392, 465, 478, 607, 613, 615, 626, 632, 636, 644, 649,…
    $ title   <chr> "Contents", "Misc_Donations", "Principal_Donations", "Religiou…

``` r
glimpse(history_figures)
```

    Rows: 20
    Columns: 2
    $ pdf_pg  <dbl> 6, 40, 71, 84, 293, 341, 372, 409, 421, 425, 429, 453, 590, 59…
    $ caption <chr> "view_from_ne", "view_from_mt_pleasant", "ac_in_1821", "zeph_s…

``` r
history_anno$entity |>
  filter(entity_type == "PERSON") |>
  group_by(entity) |>
  count() |>
  arrange(desc(n)) |>
  head(6)
```

    # A tibble: 6 × 2
    # Groups:   entity [6]
      entity        n
      <chr>     <int>
    1 Humphrey    165
    2 Hitchcock   160
    3 Moore        67
    4 Fiske        60
    5 Stearns      58
    6 Sabbath      49

The above table shows us the 6 most common names in the book. Some
familiar ones immediately pop out, such as Hitchcock, the eponym of the
“Hitchcock Residence Hall” and a founding member of the American
Statistical Association.

``` r
history_anno$token |>
  filter(upos == "NOUN") |>
  group_by(token) |>
  count() |>
  arrange(desc(n)) |>
  head(6)
```

    # A tibble: 6 × 2
    # Groups:   token [6]
      token        n
      <chr>    <int>
    1 years      703
    2 time       614
    3 students   517
    4 year       390
    5 dollars    379
    6 class      329

The above table displays the 6 most common nouns in the text.

## Notes

-   The index was not included in the text in the package
-   Footnotes were moved into the text where referenced (e.g.,
    `[This is a footnote.]`)
-   Erratum on page 671 states:
    `On page 290, line 20, for Humphrey read Hitchcock`. This change has
    been noted in the text.
