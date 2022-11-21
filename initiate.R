

suppressPackageStartupMessages(library(worldcup))
suppressPackageStartupMessages(library(worldfootballR))
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(janitor))
suppressPackageStartupMessages(library(gt))
suppressPackageStartupMessages(library(gtExtras))





all <- fotmob_get_league_matches(league_id = 77)


matches <- all %>% select(page_url, id) %>% 
  mutate(match = basename(page_url)) %>% 
  mutate(match_name = match) %>% 
  separate(match, into = c("home", "away"), sep = "-vs-") %>% 
  mutate(home = toupper(home)) %>% 
  mutate(match = match_name)






league_table <- fotmob_get_league_tables(league_id = 77)

groups <- league_table %>% 
  mutate(home = toupper(table_name)) %>% 
  select(group_name, home) %>% 
  distinct(home, .keep_all = TRUE)


 


all_matches <- matches  %>% 
  left_join(groups, by = "home")
