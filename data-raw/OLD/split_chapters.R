library(tidyverse)
history <- readLines("amherst_history.txt")
total_lines <- length(history)
total_lines
history[total_lines + 1] <- "CHAPTER END"

# first process chapter breaks
chapter_lines <- grep("^CHAPTER ", history)
length(chapter_lines)
line_num <- 1
for (chapter in seq(chapter_lines)) {
  last_line <- chapter_lines[chapter] - 3    # last lines are blank
  cleaned <- history[line_num:last_line]
  sink(file = paste("chapter", sprintf("%02d", chapter - 1), ".txt", sep = ""))
  for (line in 1:length(cleaned)) { # last two lines are blank
    cat(cleaned[line], "\n")  # copy line
  }
  line_num <- chapter_lines[chapter]
  sink()
}
