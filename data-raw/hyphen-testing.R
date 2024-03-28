library(testthat)
library(stringr)

fix_up_lines <- function(file) {
  path <- getwd()
  chapter_lines <- readLines(paste(path, "/data-raw/", file, sep = "")) 
  n <- length(chapter_lines)
  for (i in 1 : n) {
    chapter_lines[i] <- str_trim(chapter_lines[i])
    if (str_detect(chapter_lines[i], "-$")) {
      padding <- str_match(chapter_lines[i+1], "[\\w+\\d]+[:punct:]?")
      chapter_lines[i] <- paste(str_sub(chapter_lines[i], start=1, end=-2), padding, sep="")
      chapter_lines[i] <- str_trim(chapter_lines[i])
      chapter_lines[i+1] <- str_replace(chapter_lines[i+1], padding, "")
    }
  }
  #print(line)
  return(chapter_lines)
}


test_that("Check commutative property", {
  expect_identical(fix_up_lines("case-01-test.txt"), "case-01-check.txt")
})
