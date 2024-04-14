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

    [1] '0.7'

``` r
glimpse(history_text)
```

    Rows: 30,049
    Columns: 3
    $ text      <chr> "Amherst College DUrING ITS FIRST HALF CENTURY.  1821-1871."…
    $ chapter   <chr> "00", "00", "00", "00", "00", "00", "00", "00", "00", "00", …
    $ paragraph <dbl> 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, …

``` r
mosaic::tally(~ chapter, data = history_text)
```

    chapter
      00   01   02   03   04   05   06   07   08   09   10   11   12   13   14   15 
     158  426  399  210  402  407  409  697  540  903 1349 1294  963 1110 1205  305 
      16   17   18   19   20   21   22   23   24   25   26   27   28   29 
    1328 1254  446 1303 2093 1251 1088  684  927 1494  667  313 3610 2814 

``` r
glimpse(history_anno)
```

    List of 3
     $ token   : tibble [287,011 × 10] (S3: tbl_df/tbl/data.frame)
      ..$ doc_id       : int [1:287011] 1 1 1 1 1 1 1 1 1 1 ...
      ..$ sid          : int [1:287011] 1 1 1 1 1 1 1 1 1 2 ...
      ..$ tid          : int [1:287011] 1 2 3 4 5 6 7 8 9 1 ...
      ..$ token        : chr [1:287011] "Amherst" "College" "DUrING" "ITS" ...
      ..$ token_with_ws: chr [1:287011] "Amherst " "College " "DUrING " "ITS " ...
      ..$ lemma        : chr [1:287011] "Amherst" "College" "during" "its" ...
      ..$ upos         : chr [1:287011] "PROPN" "PROPN" "ADP" "PRON" ...
      ..$ xpos         : chr [1:287011] "NNP" "NNP" "IN" "PRP$" ...
      ..$ tid_source   : int [1:287011] 2 0 2 7 7 7 3 2 8 3 ...
      ..$ relation     : chr [1:287011] "compound" "root" "prep" "poss" ...
     $ entity  : tibble [20,982 × 6] (S3: tbl_df/tbl/data.frame)
      ..$ doc_id     : int [1:20982] 1 1 1 2 3 4 6 6 7 8 ...
      ..$ sid        : int [1:20982] 1 1 2 1 1 1 1 1 1 1 ...
      ..$ tid        : int [1:20982] 1 4 1 2 5 4 1 3 1 1 ...
      ..$ tid_end    : int [1:20982] 2 7 3 4 5 8 1 3 3 1 ...
      ..$ entity_type: chr [1:20982] "ORG" "DATE" "DATE" "PERSON" ...
      ..$ entity     : chr [1:20982] "Amherst College" "ITS FIRST HALF CENTURY" "1821-1871" "W. S. TYLER" ...
     $ document: tibble [30,049 × 3] (S3: tbl_df/tbl/data.frame)
      ..$ chapter  : chr [1:30049] "00" "00" "00" "00" ...
      ..$ paragraph: num [1:30049] 1 1 1 1 2 2 2 2 3 3 ...
      ..$ doc_id   : int [1:30049] 1 2 3 4 5 6 7 8 9 10 ...
     - attr(*, "class")= chr [1:2] "cnlp_annotation" "list"

``` r
mosaic::tally(~ entity$entity_type, data = history_anno)
```

    entity$entity_type
       CARDINAL        DATE       EVENT         FAC         GPE    LANGUAGE 
           2764        4327          24         170        2318          56 
            LAW         LOC       MONEY        NORP     ORDINAL         ORG 
             38         342         388         847         624        3934 
        PERCENT      PERSON     PRODUCT    QUANTITY        TIME WORK_OF_ART 
              8        4581          92          44         269         156 

``` r
glimpse(history_subtitles)
```

    Rows: 611
    Columns: 3
    $ chapter     <chr> "00", "00", "00", "00", "01", "01", "01", "01", "01", "01"…
    $ page_number <int> NA, NA, NA, NA, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 25…
    $ page_header <chr> "PREFACE. v", "vi PREFACE.  ", "PREFACE. vii  ", "viii PRE…

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
    6 Library      51

The above table shows us the 6 most common names in the book. Some
familiar ones immediately pop out, such as Hitchcock, the eponym of the
“Hitchcock Residence Hall.”

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
    3 students   518
    4 year       392
    5 dollars    380
    6 class      329

The above table displays the 6 most common nouns in the text.
Unsurprisingly, we see “students” as the most common noun.

## Notes

-   The index was not included in the text in the package
-   Footnotes were moved into the text where referenced (e.g.,
    `[This is a footnote.]`)
-   Erratum on page 671 states:
    `On page 290, line 20, for Humphrey read Hitchcock`. This change has
    been noted in the text.
