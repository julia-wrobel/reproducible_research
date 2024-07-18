load(here::here("Data", "raw.Rdata"))

# set up a variable to define which state you want to analyze
state = "ga"

# grab only observations from the specified state
covid = covid %>%
  filter(grepl("ga", key_plot_id))


# only include columns from counties dataset we are interested in
# wwtp_id is wastewater treatment plant id
# county_fips is FIPS code for all counties served by this site
counties = counties %>%
  select(key_plot_id, wwtp_id, county = county_names, county_fips, population_served) %>%
  distinct()

# merge covid data with the county label information
covid = left_join(covid, counties, by = "key_plot_id") %>%
  select(-key_plot_id) %>%
  mutate(pcr_conc_lin = as.numeric(pcr_conc_lin),
         population_served = as.numeric(population_served)) %>%
  rename(concentration = pcr_conc_lin)


## save intermediate data object and data data was accessed
save(covid, file = here::here("Data", "clean.Rdata"))
