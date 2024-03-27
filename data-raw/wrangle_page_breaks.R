library(tidyverse)
chap01 <- readLines("data-raw/chapter01.txt")
total_lines <- length(chap01)
total_lines

page_table <- tibble(
  page_number = integer(),
  page_header = character(),
  first_line = character()
)

curr_chap <- chap01
for(i in 1:(total_lines - 2)) {
  if (str_detect(curr_chap[i], "^ $") && 
      str_detect(curr_chap[i+1], "^ $") && 
      str_detect(curr_chap[i+2], "^ $") && 
      str_detect(curr_chap[i+3], "^ $") == FALSE &&
      str_detect(curr_chap[i+4], "^ $"))
    {
   print(i)
    
    curr_first_line <- curr_chap[i+5]
    curr_page_header <- curr_chap[i+3]
    curr_page_number <- str_extract(curr_chap[i+3], "[:digit:]+")
    
    page_table <- rbind(page_table, tibble(
      page_number = curr_page_number,
      page_header = curr_page_header,
      first_line = curr_first_line
    ))
    
  }
}

page_table


chap01