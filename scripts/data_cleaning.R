load(here::here("Data", "raw.Rdata"))

# grab only observations from Georgia
# per CDC website first column is actually 4 columns, split back into 4 columns
covid = covid %>%
  filter(grepl("ga", key_plot_id)) #%>%
  #separate(key_plot_id, into = c("wwtp_jurisdiction", "wwtp_id", "wwtp_id", "sample_location", "sample_matrix"), sep = "_")


# only include columns from counties dataset we are interested in
# wwtp_id is wastewater treatment plant id
# https://data.cdc.gov/Public-Health-Surveillance/NWSS-Public-SARS-CoV-2-Wastewater-Metric-Data/2ew6-ywp6/about_data
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
