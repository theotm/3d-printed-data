library(lubridate)
library(r2stl)
library(tidyverse)

# Read in data
avocado <- read_csv(file.path("input","avocado.csv"))

# Clean up spaces in variable names
names(avocado) <- str_replace_all(names(avocado)," ","")

# plot data
ustotal <- avocado %>%
  filter(region == "TotalUS",
         type == "organic",
         year %in% c("2015","2016","2017")) %>%
  mutate(yearday = yday(Date))


x <- ustotal$year %>% factor() %>% levels() %>% as.numeric()
y <- ustotal$yearday %>% factor () %>% levels () %>% as.numeric ()

z <- matrix(data = ustotal$AveragePrice, nrow = 3, ncol = 157)

r2stl(x, y, z, filename="ustotalaverageprice.stl", show.persp =TRUE)

