# motivating data module
  # have people use my email and token...?
# When to teach .Rprofile? Probably do GitHub
# Actually use .Renviron file, talk about this, show
# pulling data
# install.packages("RSocrata")

library("RSocrata")
library(tidyverse)

# don't query API every time but have automated way to record when it was last pulled.
# don't put this on GitHub- read from .credentials file, or something like that (Rprofile, sources automatically)
# https://dev.socrata.com/foundry/data.cdc.gov/g653-rqe2
# data details: https://data.cdc.gov/Public-Health-Surveillance/NWSS-Public-SARS-CoV-2-Concentration-in-Wastewater/g653-rqe2/about_data
covid <- read.socrata(
  "https://data.cdc.gov/resource/g653-rqe2.json"#,
  #app_token = Sys.getenv("TOKEN"),
  #email     = Sys.getenv("EMAIL"),
  #password  = Sys.getenv("PASSWORD")
) %>%
  mutate(date_downloaded = Sys.Date())


# can add specific queries to only download subset of data
# more info here: https://dev.socrata.com/docs/functions/#,
# subset only to Georgia
counties <- read.socrata(
  "https://data.cdc.gov/resource/2ew6-ywp6.json?$where=wwtp_jurisdiction in('Georgia')"#,
  #app_token = Sys.getenv("TOKEN"),
  #email     = Sys.getenv("EMAIL"),
  #password  = Sys.getenv("PASSWORD")
)


## save intermediate data object and data data was accessed
save(covid, counties, file = here::here("Data", "raw.Rdata"))
