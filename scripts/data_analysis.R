load(here::here("Data", "clean.Rdata"))


library(tidyverse)
library(gtsummary)

# make table of the median/IQR covid concentration by county
# I will make this prettier
cov %>%
  group_by(county) %>%
  summarize(median = median(concentration),
            q25 = quantile(concentration, probs = .25),
            q75 = quantile(concentration, probs = .75),
            population_served = mean(population_served)) %>%
  ungroup() %>%
  arrange(median)
