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
    )
  # return the processed text
  return(history_text)
}

chapters <- # list.files("data-raw-dehyphenate", full.names = TRUE)
  paste0("data-raw-dehyphenate/chapter", sprintf("%02d", 0:29), "_dehyphenate.txt")
history_text <-
  chapters |>
  purrr::map_dfr(process_chapter)

# add page numbers here? AR + TK
                 
usethis::use_data(history_text, overwrite = TRUE)


# calls to cleanNLP

library(reticulate)
use_python_version("3.11.8")
py_config()
# install_python(version = "3.11.8")
reticulate::import("cleannlp") 
cnlp_init_spacy(model_name="en_core_web_sm")
history_anno <- cnlp_annotate(history_text) # may need to rename things

usethis::use_data(history_anno, overwrite = TRUE)
