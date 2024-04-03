library(tidyverse)
history_text <- tibble(x = 1, y = 2)

process_chapter <- function(filename) {
  if (!file.exists(filename)) stop("File not found")
 
  # read in the text
  text <- read_lines(filename)
  history_text <- tibble(text = text) |>
    mutate(
      chapter = as.character(readr::parse_number(basename(filename))),
      paragraph = cumsum(text == "") + 1,
    )
  # return the processed text
  return(history_text)
}

chapters <- # list.files("data-raw-dehyphenate", full.names = TRUE)
  paste0("data-raw-dehyphenate/chapter", sprintf("%02d", 0:10), "_dehyphenate.txt")
history_text <-
  chapters |>
  purrr::map_dfr(process_chapter)
                 
usethis::use_data(history_text, overwrite = TRUE)



history_anno <- tibble(x = 1, y = 2) # this is a stub: needs to be replaced with appropriate 
# calls to cleanNLP
usethis::use_data(history_anno, overwrite = TRUE)
