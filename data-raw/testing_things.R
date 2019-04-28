library(tidyverse)
library(modelr)

data(njmin)

# EMPTOT=EMPPT*.5 + EMPFT + NMGRS;
# EMPTOT2=EMPPT2*.5 + EMPFT2 + NMGRS2;
# DEMP=EMPTOT2-EMPTOT;;

result_diff_state <- njmin %>%
    mutate(emptot = emppt * 0.5 + empft + nmgrs) %>%
    group_by(observation, state) %>%
    summarise(means = mean(emptot, na.rm = T)) %>%
    pivot_wide(names_from = "state", values_from = "means", names_prefix = "state_") %>%
    janitor::clean_names() %>%
    mutate(difference_of_states = state_new_jersey - state_pennsylvania) %>%
    ungroup() %>%
    mutate(lag_diff = lag(difference_of_states)) %>%
    mutate(diff_in_diff = difference_of_states - lag_diff) %>%
    select(-lag_diff) %>%
    pull(diff_in_diff) %>%
    discard(is.na)

result_diff_obs <- njmin %>%
    mutate(emptot = emppt * 0.5 + empft + nmgrs) %>%
    group_by(observation, state) %>%
    summarise(means = mean(emptot, na.rm = T)) %>%
    pivot_wide(names_from = "observation", values_from = "means", names_prefix = "observation_") %>%
    janitor::clean_names() %>%
    mutate(difference_of_observations = observation_november_1992 - observation_february_1992) %>%
    ungroup() %>%
    mutate(lag_diff = lag(difference_of_observations)) %>%
    mutate(diff_in_diff = lag_diff - difference_of_observations) %>%
    select(-lag_diff)


my_func <- function(dataset){
    dataset %>% group_by(observation, state) %>%
    summarise(means = mean(emptot, na.rm = T)) %>%
    pivot_wide(names_from = "state", values_from = "means", names_prefix = "state_") %>%
    janitor::clean_names() %>%
    mutate(difference_of_states = state_new_jersey - state_pennsylvania) %>%
    ungroup() %>%
    mutate(lag_diff = lag(difference_of_states)) %>%
    mutate(diff_in_diff = difference_of_states - lag_diff) %>%
    select(-lag_diff) %>%
    pull(diff_in_diff) %>%
    discard(is.na)}

njmin %>%
    mutate(emptot = emppt * 0.5 + empft + nmgrs) %>%
    bootstrap(100) %>%
    group_by(.id) %>%
    mutate(boot_diff_in_diff = map_dbl(strap, ~my_func(data.frame(.)))) %>%
    pull(boot_diff_in_diff) %>%
    quantile(., c(0.05, 0.95))



njmin %>%
    mutate(emptot = emppt * 0.5 + empft + nmgrs) %>%
    group_by(observation, state) %>%
    summarise(means = mean(emptot, na.rm = T)) %>%
    group_by(observation) %>%
    mutate(lag_means = lag(means)) %>%
    mutate(difference = lag_means - means) %>%
    group_by(state) %>%
    mutate(lag_diff = lag(difference)) %>%
    mutate(diff_in_diff = lag_diff - difference)

njmin %>%
    mutate(emptot = emppt * 0.5 + empft + nmgrs) %>%
    group_by(observation, state) %>%
    summarise(means = mean(emptot, na.rm = T))
