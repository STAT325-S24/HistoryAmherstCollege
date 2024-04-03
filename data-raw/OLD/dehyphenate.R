library(stringr)

fix_up_lines <- function(file) {
  chapter_lines <- readLines(file) 
  n <- length(chapter_lines)
  for (i in 1 : n) {
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
  return(chapter_lines)
}

path <- getwd()
for(i in 0:28) {
  chapter_num <- sprintf("%02d", i)
  chapter_name <- paste(path, "/data-raw-depaginate/chapter", chapter_num, "_cleaned.txt", sep = "")
  
  table <- fix_up_lines(chapter_name)
  write.table(table, paste0(path, "/data-raw-dehyphenate/chapter", chapter_num, "_dehyphenate.txt", sep = ""), quote = FALSE, row.names = FALSE, col.names = FALSE)
}

