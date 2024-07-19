load(here::here("data", "clean.Rdata"))


library(tidyverse)

# make table of the median/IQR covid concentration by county
# I will make this prettier
covid_table =  covid %>%
  group_by(county) %>%
  summarize(median = median(concentration),
            q25 = quantile(concentration, probs = .25),
            q75 = quantile(concentration, probs = .75),
            population_served = median(population_served)) %>%
  ungroup() %>%
  arrange(median)
