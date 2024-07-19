load(here::here("Data", "clean.Rdata"))

library(tidyverse)
library(forcats)


covid %>%
  mutate(county = factor(county),
         county = fct_reorder(county, concentration)) %>%
  ggplot(aes(county, concentration, group = county, fill = county)) +
  geom_boxplot() +
  theme(legend.position = "none",
        axis.text.x = element_text(angle = 45, hjust = 1))


## gonna do something here with the dates to make this prettier.
## weird that the scales are so different across sites
covid %>%
  ggplot(aes(date, concentration, group = interaction(county, wwtp_id))) +
  geom_line() +
  facet_wrap(~county, scales = "free")



