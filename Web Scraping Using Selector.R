library(rvest)
library(dplyr)
library(robotstxt)

path = paths_allowed("https://books.toscrape.com/")

link <- 'https://books.toscrape.com/'

web <- read_html(link)

name <- web %>%
  
  html_nodes(".lister-item-header a")
%>% html_text()

View(name)

year <- web %>% html_nodes(".text-muted.unbold") %>% html_text

View(year)

rating <- web %>%
  html_nodes(".science-fiction strong")

View(rating)

duration <- web %>% html_nodes(".author")

View(duration)

imdb.ratings <- data.fram(name, year, rating, duration)

View(imdb.ratings)

write.csv(imdb.ratings, "Mybooks.csv")
