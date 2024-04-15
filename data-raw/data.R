# be sure to run 01_processing_pages.qmd, 02_dehyphenate.qmd,
# and 04_processing_subtitles.qmd before running this script
# Nicholas Horton 2024-04-15

library(tidyverse)
library(cleanNLP)

process_chapter <- function(filename) {
  if (!file.exists(filename)) stop("File not found")
 
  # read in the text
  text <- read_lines(filename)
  history_text <- tibble(text = text) |>
    mutate(
      chapter = str_extract(filename, "\\d+"),
      paragraph = cumsum(text == "") + 1,
      page_num = NA
    )
  # return the processed text
  return(history_text)
}

chapters <- # list.files("data-raw-dehyphenate", full.names = TRUE)
  paste0("data-raw-dehyphenate/chapter", sprintf("%02d", 0:29), "_dehyphenate.txt")
history_text <-
  chapters |>
  purrr::map_dfr(process_chapter)

load("data/history_subtitles.rda") 
history_updated <- history_subtitles |>
  mutate(
    first_line = ifelse(
      stringr::str_detect(first_line, "- *$"),
      stringr::str_replace(first_line, "[A-Za-z]*- *$", ""),
      first_line
    ),
    first_line = stringr::str_trim(
      stringr::str_replace_all(first_line, "^[,A-Za-z\\.]*", " ")
    )
  )

for (i in 1:nrow(history_updated)) {
  if (history_updated$first_line[i] == "") {
    print(history_updated$first_line[i])
    print(history_updated$page_number[i])
    print(sum(results))
    print("skipping")
    next()
  } 
  results <- stringr::str_detect(history_text$text, history_updated$first_line[i])
  if (sum(results) < 1) {
    print(history_updated$first_line[i])
    print(history_updated$page_number[i])
    print(sum(results))
    print("proceeding...")
  }
  if (sum(results) > 1) {
    print(history_updated$first_line[i])
    print(history_updated$page_number[i])
    print(sum(results))
    print("proceeding!")
  } else {
    line_page_starts <- which(results)
    history_text$page_num[line_page_starts] <- history_updated$page_number[i]
  }
}
history_text$page_num[1] <- 1
history_text <- history_text |>
  fill(page_num)

usethis::use_data(history_text, overwrite = TRUE)


# calls to cleanNLP

library(reticulate)
use_python_version("3.11.8")
py_config()
# install_python(version = "3.11.8")
reticulate::import("cleannlp") 
cnlp_init_spacy(model_name="en_core_web_sm")
history_anno <- cnlp_annotate(history_text) 

usethis::use_data(history_anno, overwrite = TRUE)
