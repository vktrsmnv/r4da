install.packages('tidyverse')
library(tidyverse)
qmd_file <- readLines("prepare/01-prepare.qmd")
data_file <- readr::read_csv("data/schedule.csv")
data_file2<-readr::read_csv("data/test_timetable_find.csv")
title_line <- qmd_file %>%
  stringr::str_detect(pattern = "title:")


#start_date <- as.Date("2023-02-01")
#end_date <- as.Date("2023-02-11")
#dates <- seq(from = start_date, to = end_date, by = "day")
#data_object <- data.frame(date = dates)
#View(data_object)
#test_timetable<-data.frame(data_object,title)
#write.csv(test_timetable,"test_timetable_find.csv")


# update the title in YML in prepare folder

qmd_file[title_line] <- paste0(
  "title: \"",
  data_file$title[1],
  "\""
)

writeLines(qmd_file, "prepare/01-prepare.qmd")


#FUNCTIONs

qmd_files <- c("prepare/01-prepare.qmd", "prepare/02-prepare.qmd", "prepare/03-prepare.qmd")

for (file in qmd_files) {
  qmd_files <- readLines(file)
}

for (i in 1:nrow(data_file)) {
  title_line <- paste0("title: \"", data_file$title[i], "\"")
  qmd_files[i] <- title_line
}


# update the title in YML in sessions folder
sessions<-c("session/01-session.qmd","session/02-session.qmd")

for (file in sessions) {
  sessions <- readLines(file)
}

for (i in 1:nrow(data_file2)) {
  title_line <- paste0("title: \"", data_file2$title[i], "\"")
  sessions[i] <- title_line
}


# update the title in YML in deadlines folder


