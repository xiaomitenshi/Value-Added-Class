library(rvest)
library(dplyr)
library(robotstxt)

path = paths_allowed("https://www.imdb.com/search/title/?groups=top_250&sort=user_rating")

link <- 'https://www.imdb.com/search/title/?groups=top_250&sort=user_rating'

web <- read_html(link)

name <- web %>%
  
  html_nodes(".lister-item-header a")
%>% html_text()

View(name)

year <- web %>% html_nodes(".text-muted.unbold") %>% html_text

View(year)

rating <- web %>%
  html_nodes(".ratings-imdb-rating strong")

View(rating)

duration <- web %>% html_nodes(".runtime")

View(duration)

imdb.ratings <- data.fram(name, year, rating, duration)

View(imdb.ratings)

write.csv(imdb.ratings, "Mymovieda.csv")
