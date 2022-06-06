library(tidyverse)
library(readxl)

## Example datasets

# from https://ghdx.healthdata.org/record/ihme-data/gbd-2019-smoking-tobacco-use-prevalence-1990-2019
# age-standardized, 15+ years
smoking <- read_csv('data/raw/IHME_GBD_2019_SMOKING_TOB_1990_2019_PREV_Y2021M05D27.CSV') %>%
    filter(sex_name == 'Both') %>%
    select(-c(location_id, sex_id, age_group_id, measure_name, age_group_name, upper, lower, sex_name)) %>%
    rename('smoking_prevalence' = 'val', 'country' = 'location_name', 'year' = 'year_id')

# from https://vizhub.healthdata.org/gbd-results/
# age-standardized; tracheal, bronchus, and lung cancer
cancer <- read_csv('data/raw/IHME-GBD_2019_DATA-10dcfddc-1.csv') %>%
    filter(measure == 'Prevalence', sex == 'Both', age == 'Age-standardized', metric == 'Percent') %>%
    select(-c(measure, sex, age, cause, metric, upper, lower)) %>%
    rename('lung_cancer_prevalence' = 'val', 'country' = 'location')

# from https://data.worldbank.org/indicator/SP.POP.TOTL?end=2020&start=2020&view=map
# population size of each country
pop <- read_csv('data/raw/API_SP.POP.TOTL_DS2_en_csv_v2_4150863.csv', skip = 4) %>%
    select(-c('Country Code', 'Indicator Name', 'Indicator Code','...67')) %>%
    rename('country' = 'Country Name') %>%
    pivot_longer(starts_with(c('1','2')), names_to = 'year', values_to = 'pop') %>%
    mutate(year = as.numeric(year)) %>%
    mutate(country = gsub('Congo, Dem. Rep.', 'Democratic Republic of the Congo', country),
           country = gsub(',.*', '', country),
           country = gsub('Cote', 'Côte', country),
           country = gsub('Lao PDR', 'Lao People\'s Democratic Republic', country),
           country = gsub('^Korea$', 'Republic of Korea', country),
           country = gsub('^Moldova$', 'Republic of Moldova', country),
           country = gsub('St\\.', 'Saint', country),
           country = gsub('^Tanzania$', 'United Republic of Tanzania', country),
           country = gsub('^United States$', 'United States of America', country))

# from https://github.com/dbouquin/IS_608/blob/master/NanosatDB_munging/Countries-Continents.csv
# continent of each country
continent <- read_csv('data/raw/Countries-Continents.csv') %>% rename_all(tolower) %>%
    mutate(country = gsub('^Brunei$', 'Brunei Darussalam', country),
           country = gsub('^Burkina$', 'Burkina Faso', country),
           country = gsub('^Cape', 'Cabo', country),
           country = gsub('Ivory Coast', 'Côte d\'Ivoire', country),
           country = gsub('CZ', 'Czech Republic', country),
           country = gsub('Congo, Democratic Republic of', 'Democratic Republic of the Congo', country),
           country = gsub('Swaziland', 'Eswatini', country),
           country = gsub('Kyrgyzstan', 'Kyrgyz Republic', country),
           country = gsub('Laos', 'Lao People\'s Democratic Republic', country),
           country = gsub('Burma \\(Myanmar\\)', 'Myanmar', country),
           country = gsub('^Macedonia$', 'North Macedonia', country),
           country = gsub('Korea, South', 'Republic of Korea', country),
           country = gsub('^Moldova$', 'Republic of Moldova', country),
           country = gsub('^Slovakia$', 'Slovak Republic', country),
           country = gsub('^Syria$', 'Syrian Arab Republic', country),
           country = gsub('^US$', 'United States of America', country),
           country = gsub('East Timor', 'Timor-Leste', country),
           country = gsub('^Tanzania$', 'United Republic of Tanzania', country))

# create dataset
dat <- left_join(cancer, smoking) %>%
    mutate(country = gsub(' \\(.*', '', country),
           country = gsub('Kyrgyzstan', 'Kyrgyz Republic', country),
           country = gsub('Czechia', 'Czech Republic', country),
           country = gsub('Slovakia', 'Slovak Republic', country),
           country = gsub('Viet Nam', 'Vietnam', country)) %>%
    left_join(pop) %>%
    left_join(continent) %>%
    filter(!is.na(pop) & !is.na(continent)) %>%
    select(country, continent, year, pop, smoking_prevalence, lung_cancer_prevalence)

write_csv(dat, 'data/smoking_cancer.csv')

## Practice datsets

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
