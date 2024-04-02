library(stringr)

fix_up_lines <- function(file) {
  # file <- "chapter10_cleaned.txt"
  path <- getwd()
  chapter_lines <- readLines(paste(path, "/data-raw-depaginate/", file, sep = "")) 
  n <- length(chapter_lines)
  for (i in 1 : n) {
    # i <- 1337
    chapter_lines[i] <- str_trim(chapter_lines[i])
    if (str_detect(chapter_lines[i], "-$")) {
      if (str_trim(chapter_lines[i+1]) == "") {
        padding <- str_match(chapter_lines[i+2], "[\\w+\\d]+[:punct:]?")
        chapter_lines[i] <- paste(str_sub(chapter_lines[i], start=1, end=-2), padding, sep="")
        chapter_lines[i] <- str_trim(chapter_lines[i])
        chapter_lines[i+2] <- str_replace(chapter_lines[i+2], padding, "")
      }
      else { 
        padding <- str_match(chapter_lines[i+1], "[\\w+\\d]+[:punct:]?")
        chapter_lines[i] <- paste(str_sub(chapter_lines[i], start=1, end=-2), padding, sep="")
        chapter_lines[i] <- str_trim(chapter_lines[i])
        chapter_lines[i+1] <- str_replace(chapter_lines[i+1], padding, "")
      }
    }
  }
  #print(line)
  return(chapter_lines)
}

path <- getwd()
for(i in 0:28) {
  chapter_num <- sprintf("%02d", i)
  chapter_name <- paste(path, "/data-raw-depaginate/", chapter_num, "_cleaned.txt", sep = "")
  
  # table <- process_chapter_data(chapter_name)
  
  print(chapter_name)
  # print(table, n = 100)
  
}

