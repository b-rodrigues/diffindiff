## code to prepare `DATASET` dataset goes here
library(tidyverse)

tempfile_path <- tempfile()

download.file("http://davidcard.berkeley.edu/data_sets/njmin.zip", destfile = tempfile_path)

tempdir_path <- tempdir()

unzip(tempfile_path, exdir = tempdir_path)

codebook <- read_lines(file = paste0(tempdir_path, "/codebook"))

variable_names <- codebook %>%
    `[`(8:59) %>%
    `[`(-c(5, 6, 13, 14, 32, 33)) %>%
    str_sub(1, 13) %>%
    str_squish() %>%
    str_to_lower()

dataset <- read_table2(paste0(tempdir_path, "/public.dat"),
                      col_names = FALSE)

dataset <- dataset %>%
    select(-X47) %>%
    `colnames<-`(., variable_names) %>%
    mutate_all(as.numeric) %>%
    mutate(sheet = as.character(sheet))

dataset <- dataset %>%
    mutate(chain = case_when(chain == 1 ~ "bk",
                             chain == 2 ~ "kfc",
                             chain == 3 ~ "roys",
                             chain == 4 ~ "wendys")) %>%
    mutate(state = case_when(state == 1 ~ "New Jersey",
                             state == 0 ~ "Pennsylvania")) %>%
    mutate(region = case_when(southj == 1 ~ "southj",
              centralj == 1 ~ "centralj",
              northj == 1 ~ "northj",
              shore == 1 ~ "shorej",
              pa1 == 1 ~ "pa1",
              pa2 == 1 ~ "pa2")) %>%
    select(sheet, chain, co_owned, state, region, everything()) %>%
    select(-southj, -centralj, -northj, -shore, -pa1, -pa2) %>%
    mutate(date2 = lubridate::mdy(date2)) %>%
    rename(open2 = open2r)



dataset1 <- dataset %>%
    select(-ends_with("2"), -sheet, -chain, -co_owned, -state, -region) %>%
    mutate(type = NA_real_,
           status = NA_real_,
           date = NA)

dataset2 <- dataset %>%
    select(ends_with("2")) %>%
    mutate(bonus = NA_real_) %>%
    rename_all(~str_remove(., "2"))

other_cols <- dataset %>%
    select(sheet, chain, co_owned, state, region)

other_cols_1 <- other_cols %>%
    mutate(observation = "February 1992")

other_cols_2 <- other_cols %>%
    mutate(observation = "November 1992")

dataset1 <- bind_cols(other_cols_1, dataset1)
dataset2 <- bind_cols(other_cols_2, dataset2)

dataset <- bind_rows(dataset1, dataset2) %>%
    select(sheet, chain, state, region, observation, everything())
#
# ggplot(dataset, aes(wage_st)) + geom_density(aes(fill = state), alpha = 0.3) +
#     facet_wrap(vars(observation)) + theme_blog() +
#     theme(legend.title = element_blank(), plot.caption = element_text(colour = "white")) +
#     labs(title = "Distribution of starting wage rates in fast food restaurants",
#          caption = "On April 1st, 1992, New Jersey's minimum wage rose from $4.25 to $5.05. Source: Card and Krueger (1994)")

usethis::use_data("DATASET")