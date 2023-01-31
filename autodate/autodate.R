install.packages('tidyverse')
library(tidyverse)
qmd_file <- readLines("prepare/01-prepare.qmd")
data_file <- readr::read_csv("data/schedule.csv")
title_line <- qmd_file %>%
  stringr::str_detect(pattern = "title:")


# update the title in YML in prepare folder

qmd_file[title_line] <- paste0(
  "title: \"",
  data_file$title[1],
  "\""
)

writeLines(qmd_file, "prepare/01-prepare.qmd")
# update the title in YML in sessions folder


# update the title in YML in deadlines folder
