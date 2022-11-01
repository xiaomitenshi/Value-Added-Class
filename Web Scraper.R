library(robotstxt)
library(rvest)

Path = paths_allowed("https://www.imdb.com/chart/top/")

url <- "https://www.imdb.com/chart/top/"

my_html <- read_html(url)

my_tables <- html_nodes(my_htSml,"table")

movie_table <- html_table(my_tables)[[1]]

View(movie_table)

movie <- movie_table[,2:3]

View(movie)

str(movie)

write.csv(movie, "My_movies.csv")
