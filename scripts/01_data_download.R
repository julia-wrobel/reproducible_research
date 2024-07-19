# install.packages("RSocrata")
library("RSocrata")
library(tidyverse)

# download longitudinal Covid WW concentration data from API
covid <- read.socrata(
  "https://data.cdc.gov/resource/g653-rqe2.json",
  app_token = Sys.getenv("TOKEN"),
  email     = Sys.getenv("EMAIL"),
  password  = Sys.getenv("PASSWORD")
) %>%
  mutate(date_downloaded = Sys.Date())


# download cross-sectional Covid WW concentration data from API, which will be used to get county names
counties <- read.socrata(
  "https://data.cdc.gov/resource/2ew6-ywp6.json",
  app_token = Sys.getenv("TOKEN"),
  email     = Sys.getenv("EMAIL"),
  password  = Sys.getenv("PASSWORD")
)

# save raw datra
save(covid, counties, file = here::here("data", "raw.Rdata"))
