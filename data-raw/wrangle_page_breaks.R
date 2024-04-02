library(tidyverse)
library(stringr)


process_chapter_data <- function(chapter_name) {
  chap_data <- readLines(paste0("data-raw/", chapter_name, ".txt"))
  total_lines <- length(chap_data)
  
  page_table <- tibble(
    page_number = integer(),
    page_header = character(),
    first_line = character()
  )
  
  for(i in 1:(total_lines - 5)) {
    if (str_detect(chap_data[i], "^ $") && 
        str_detect(chap_data[i+1], "^ $") && 
        str_detect(chap_data[i+2], "^ $") && 
        str_detect(chap_data[i+3], "^ $") == FALSE &&
        str_detect(chap_data[i+4], "^ $")) {
      
      curr_first_line <- chap_data[i+5]
      curr_page_header <- chap_data[i+3]
      
      if(str_detect(chap_data[i+3], "(?<=\\.\\s)\\d+")) {
        curr_page_number <- as.integer(str_extract(chap_data[i+3], "(?<=\\.\\s)\\d+"))
      } else {
        curr_page_number <- as.integer(str_extract(chap_data[i+3], "\\d+"))
      }
      
      page_table <- bind_rows(page_table, tibble(
        page_number = curr_page_number,
        page_header = curr_page_header,
        first_line = curr_first_line
      ))
    }
  }

  saveRDS(page_table, paste0("page-tables/page_table_", gsub("data-raw/", "", gsub(".txt", "", chapter_name)), ".rds"))
  
  
  con <- file(paste0("data-raw-depaginate", "/", gsub("data-raw/", "", gsub(".txt", "", chapter_name)), "_cleaned.txt"), open = "w")
  i <- 1
  while(i <= (total_lines - 5)) {
    if (str_detect(chap_data[i], "^ $") && 
        str_detect(chap_data[i+1], "^ $") && 
        str_detect(chap_data[i+2], "^ $") && 
        str_detect(chap_data[i+3], "^ $") == FALSE &&
        str_detect(chap_data[i+4], "^ $")) {
      i <- i + 5
    } else {
      writeLines(chap_data[i], con)
      i <- i + 1
    }
  }

  writeLines(chap_data[total_lines-4], con)
  writeLines(chap_data[total_lines-3], con)
  writeLines(chap_data[total_lines-2], con)
  writeLines(chap_data[total_lines-1], con)
  writeLines(chap_data[total_lines], con)
  close(con)
  
  return(page_table)
  
}

