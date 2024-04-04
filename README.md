# History of Amherst College data package
STAT325 class at Amherst College (Nicholas Horton)
2024-04-04

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
packageVersion("HistoryAmherstCollege")
```

    [1] '0.5'

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
     $ token   : tibble [116,596 × 10] (S3: tbl_df/tbl/data.frame)
      ..$ doc_id       : int [1:116596] 1 1 1 1 1 1 1 1 1 1 ...
      ..$ sid          : int [1:116596] 1 1 1 1 1 1 1 1 1 2 ...
      ..$ tid          : int [1:116596] 1 2 3 4 5 6 7 8 9 1 ...
      ..$ token        : chr [1:116596] "Amherst" "College" "DUrING" "ITS" ...
      ..$ token_with_ws: chr [1:116596] "Amherst " "College " "DUrING " "ITS " ...
      ..$ lemma        : chr [1:116596] "Amherst" "College" "during" "its" ...
      ..$ upos         : chr [1:116596] "PROPN" "PROPN" "ADP" "PRON" ...
      ..$ xpos         : chr [1:116596] "NNP" "NNP" "IN" "PRP$" ...
      ..$ tid_source   : int [1:116596] 2 0 2 7 7 7 3 2 8 3 ...
      ..$ relation     : chr [1:116596] "compound" "root" "prep" "poss" ...
     $ entity  : tibble [7,690 × 6] (S3: tbl_df/tbl/data.frame)
      ..$ doc_id     : int [1:7690] 1 1 1 2 3 4 6 6 7 8 ...
      ..$ sid        : int [1:7690] 1 1 2 1 1 1 1 1 1 1 ...
      ..$ tid        : int [1:7690] 1 4 1 2 5 4 1 3 1 1 ...
      ..$ tid_end    : int [1:7690] 2 7 3 4 5 8 1 3 3 1 ...
      ..$ entity_type: chr [1:7690] "ORG" "DATE" "DATE" "PERSON" ...
      ..$ entity     : chr [1:7690] "Amherst College" "ITS FIRST HALF CENTURY" "1821-1871" "W. S. TYLER" ...
     $ document: tibble [10,792 × 3] (S3: tbl_df/tbl/data.frame)
      ..$ chapter  : chr [1:10792] "00" "00" "00" "00" ...
      ..$ paragraph: num [1:10792] 1 1 1 1 2 2 2 2 3 3 ...
      ..$ doc_id   : int [1:10792] 1 2 3 4 5 6 7 8 9 10 ...
     - attr(*, "class")= chr [1:2] "cnlp_annotation" "list"

``` r
mosaic::tally(~ entity$entity_type, data = history_anno)
```

    entity$entity_type
       CARDINAL        DATE       EVENT         FAC         GPE    LANGUAGE 
            766        1430          10          46         933          26 
            LAW         LOC       MONEY        NORP     ORDINAL         ORG 
             19         150         158         313         284        1633 
        PERCENT      PERSON     PRODUCT    QUANTITY        TIME WORK_OF_ART 
              3        1714          20          17         107          61 

``` r
glimpse(history_subtitles)
```

    Rows: 636
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

## Notes

- The index was not included in the text in the package
- Footnotes were moved into the text where referenced (e.g.,
  `[This is a footnote.]`)
- Erratum on page 671 states:
  `On page 290, line 20, for Humphrey read Hitchcock`. This change has
  been noted in the text.
