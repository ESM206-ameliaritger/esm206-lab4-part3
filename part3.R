# ---------------
# Amelia 
# ---------------
library(tidyverse)
library(janitor)
library(here)

#read in data
db <- read_csv(here::here("data", "disease_burden.csv")) %>%
  clean_names() %>%
  rename(deaths_per_100k = death_rate_per_100_000)

#subset data
db_sub <- db %>%
  filter(country_name %in% c("United States", "Japan", "Afghanistan", "Somalia")) %>% #subset for these specific countrys
  filter(age_group=="0-6 days", sex=="Both") #subset only 0-6 days age group AND both sexes

#create a basic line graph
ggplot(data=db_sub, aes(x=year, y=deaths_per_100k)) +
  geom_line(aes(color=country_name))

#save graph into graphs folder
ggsave(here("final_graphs","disease_graph.png"))
