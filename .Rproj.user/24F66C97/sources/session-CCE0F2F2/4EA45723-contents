


get_match_team_stats <- function(id) {
  worldfootballR::fotmob_get_match_team_stats(id) %>%
    select(stats_title, title, home_value, away_value) %>%
    filter(home_value != "NA") %>%
    group_by(title) %>%
    gt::gt() %>%
    gtExtras::gt_theme_nytimes()
}

