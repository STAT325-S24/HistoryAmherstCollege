library(stringr)

fix_up_lines <- function(line) {
  n <- length(line)
  for (i in 1 : n) {
    line[i] <- str_trim(line[i])
    if (str_detect(line[i], "-$")) {
      padding <- str_match(line[i+1], "[\\w\\d]+[:punct: ]?")
      line[i] <- paste(str_sub(line[i], start=1, end=-2), padding, sep="")
      line[i] <- str_trim(line[i])
      line[i+1] <- str_replace(line[i+1], padding, "")
    }
  }
  #print(line)
  return(line)
}

# fix_up_lines <- function(line) {
#   num_lines <- length(line)
#   line2 <- str_squish(line)
#   for (i in 1:(num_lines-1)){
#     if (str_detect(line2[i], "-$")){
#       line2[i] <- str_replace(line2[i], "-$", "")
#       line2[i] <- paste0(line2[i], str_extract(line2[i+1], "\\w+[ :punct:]?"))
#       line2[i+1] <- str_replace(line2[i+1], str_extract(line2[i+1], "\\w+[ :punct:]?"), "")
#     }
#   }
#   return(line2)
# }

path <- getwd()
my_txt <- readLines(paste(path, "/data-raw/chapter10.txt", sep = "")) 
my_txt[167:173]
fix_up_lines(my_txt[167:173])
