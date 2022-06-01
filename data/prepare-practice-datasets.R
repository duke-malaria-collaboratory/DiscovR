library(tidyverse)
library(readxl)

# from https://data.humdata.org/dataset/kenya-health-facilities-in-kenya
read_excel('data/raw/kenya-health-facilities-2017_08_02.xlsx') %>%
    select('Name', 'Keph level', 'Facility type', 'Owner', 'Regulatory body', 'Beds', 'Cots', 'County', 'Constituency', 'Sub county', 'Ward', 'Open_whole_day', 'Open_public_holidays', 'Open_weekends', 'Open_late_night') %>%
    rename('Regulatory_body' = 'Regulatory body', 'Sub_county' = 'Sub county') %>%
    write_csv('data/practice-datasets/kenya-health-facilities-2017.csv')

# from https://data.humdata.org/dataset/kenya-road-accidents-database
read_excel('data/raw/kenya-accidents-database.xlsx') %>%
    rename(Date = 'Date DD/MM/YYYY') %>%
    select(-c('...13', 'CAUSE CODE')) %>%
    rename_all(str_to_sentence) %>%
    rename('Time_24_hours' = 'Time 24 hours', 'Base' = 'Base/sub base', 'Details' = 'Brief accident details', 'Number_of_victims' = 'No.') %>%
    write_csv('data/practice-datasets/kenya-road-accidents.csv')

# from https://data.humdata.org/dataset/covid19_africa_continental_infections-recoveries-deaths
read_excel("data/raw/africa-covid19-infections-recoveries-and-deaths.xlsx",sheet = 2) %>%
    setNames(., c('ISO', 'country_name', 'african_region', format(as.Date(as.numeric(names(.)[-c(1,2,3)]),
                                                                          origin = '1899-12-30'), '%Y-%m-%d'))) %>%
    pivot_longer(names(.)[-c(1,2,3)], names_to = 'date', values_to = 'n_infected') %>%
    full_join(read_excel("data/raw/africa-covid19-infections-recoveries-and-deaths.xlsx",sheet = 4) %>%
                  setNames(., c('ISO', 'country_name', 'african_region', format(as.Date(as.numeric(names(.)[-c(1,2,3)]),
                                                                                        origin = '1899-12-30'), '%Y-%m-%d'))) %>%
                  pivot_longer(names(.)[-c(1,2,3)], names_to = 'date', values_to = 'n_deaths')) %>%
    write_csv('data/practice-datasets/africa-covid19-cases.csv')

# from https://data.humdata.org/dataset/who-data-for-kenya
read_csv('data/raw/infectious_diseases_indicators_ken.csv', comment = '#') %>%
    select(c('GHO (DISPLAY)', 'YEAR (DISPLAY)', 'Display Value')) %>%
    rename(c('Metric' = 'GHO (DISPLAY)', 'Year' = 'YEAR (DISPLAY)', 'Value' = 'Display Value')) %>%
    write_csv('data/practice-datasets/kenya-infectious-disease-indicators.csv')

# from https://figshare.com/articles/dataset/SAFI_Survey_Results/6262019/4?file=11492171
read_csv('data/raw/SAFI_clean.csv') %>%
    select(-c(key_ID, instanceID)) %>%
    write_csv('data/practice-datasets/africa-agriculture-survey.csv')
