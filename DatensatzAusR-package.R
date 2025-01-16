library(gapminder)
library(forcats)
library(dplyr)

gp <- gapminder
fct_count(gp$continent)
gp$continent <- fct_expand(gp$continent, "Antarctica")
fct_count(gp$continent)

gp$continent <- fct_drop(gp$continent, "Antarctica")
fct_count(gp$continent)

skim(gp)