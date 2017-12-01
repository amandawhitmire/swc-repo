# libraries ----
library(tidyverse)

# data ----
url <- 'https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/gapminder.csv'
gapminder <- read_csv(url) # View(gapminder)

# ggplot: after filter by country ----
cntry <- "Afganistan"
png <- paste0("gdp_", cntry, ".png")

g <- gapminder %>%
  filter(country == "Afghanistan") %>%
  ggplot(aes(x = year, y = gdpPercap)) +
  geom_point() +
  geom_smooth() +
  labs(title = cntry)

ggsave(png, g)


# function: for plotting any country ----
plot_country <- function(cntry){
  
  png <- paste0("gdp_", cntry, ".png")
  
  g <- gapminder %>%
    filter(country == cntry) %>%
    ggplot(aes(x = year, y = gdpPercap)) +
    geom_point() +
    geom_smooth() +
    labs(title = cntry)
  
  ggsave(filename = png, plot = g)
}

plot_country("Mexico")

# for: loop to iterate over some countries ----
countries <- c("United States", "France")

for (k in countries){
  
  plot_country(k)
  
}
