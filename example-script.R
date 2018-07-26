library(tidyverse)
library(lubridate)
library(r2stl)

avocado <- read_csv(file.path ("input", "avocado.csv")) %>%
  filter(region %in% c("NewYork")) %>%
  filter(type == "organic") %>%

 mutate(yday = yday(Date))
  
avocado %>%
ggplot() +
  geom_line(mapping = aes(x = yday, y = AveragePrice)) +
facet_wrap(~year)  

x <- avocado$yday

y <- avocado$AveragePrice



# Let's do the classic persp() demo plot
x <- seq(-10, 10, length= 100)
y <- x
f <- function(x,y) { r <- sqrt(x^2+y^2); 10 * sin(r)/r }
z <- outer(x, y, f)
z[is.na(z)] <- 1
r2stl(x, y, z, filename="lovelyfunction.stl", show.persp=TRUE)

z <- volcano
x <- 1:dim(volcano)[1]
y <- 1:dim(volcano)[2]
r2stl(x, y, z, filename="volcano.stl", show.persp=TRUE)

library(tidyverse)
library(lubridate)
library(r2stl)

