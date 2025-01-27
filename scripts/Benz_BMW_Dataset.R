#0 Get the data ----
data <- read.csv("./data/benzfinal.csv")

library(dplyr)
library(DataExplorer)
library(ggplot2)
library(skimr)
library(tidyverse)
library(stringr)


#1 Overview of dataquality ----
skim(data)
summary(data)
plot_missing(data)


#2 Create new variable ----
data$sport_wagen <- ifelse(data$Ps > 300, 1, 0)
data$luxus_wagen <- ifelse(data$Price > 200000 & data$Ps > 400, 1, 0)
head(data)


#3 Filter and choose data ----
luxury_sport <- filter(data, sport_wagen == 1 & luxus_wagen == 1)
head(luxury_sport)

last_df <- filter(luxury_sport, Price > 300000 & Ps > 400 & grepl("Mercedes-Benz", Manufacturer))
last_df <- select(last_df, Model, Km, Ps, Price)
head(last_df)


#4 Data analysis and aggregation ----
data$manufacturer_new <- str_extract(data$Manufacturer, "^[A-Za-z-]+")
aggregate(Ps ~ manufacturer_new, data = data, FUN = mean)


count_cars_per_year <- data %>% group_by(Year, manufacturer_new) %>% summarise(count = n())
print(count_cars_per_year)


#5 String operations ----
data_GL <- filter(data, grepl("GL", Model))
data_GL <- data %>% filter(str_detect(Model, "GL"))
head(data_GL)

data <- data %>%
  mutate(suv = case_when(
  grepl("GL", data$Model) ~ "Ja",
  grepl("X", data$Model) ~ "Ja",
  TRUE ~ "Nein"))
head(data)


#6 Statistical analysis ----
ggplot(data, aes(x = Ps)) + geom_histogram(binwidth = 10, fill = "blue", color = "black") +
labs(title = "Histogram of Ps for all cars", x = "Ps", y = "Frequency")


#7 Data visualization ----
ggplot(data, aes(x = Price, y = Ps, color = manufacturer_new)) + geom_point() +
labs(title = "Price vs Ps", x = "Price", y = "Ps")

ggplot(count_cars_per_year, aes(x = Year, y = count, fill = manufacturer_new)) + geom_bar(stat = "identity") +
labs(title = "Number of cars per year", x = "Year", y = "Number of cars")


#8 Sort and Group ----
data %>% arrange(desc(Price)) %>% head(10)

data_grouped <- data %>% group_by(manufacturer_new) %>% summarise(max_price = max(Price, na.rm = TRUE))
print(data_grouped)


#9 Statistical tests ----
t.test(data$Price[data$Ps > 300], data$Price[data$Ps <= 300])
# t = 3.1825, df = 303.46, p-value = 0.001611
# Interpretation:
# The p-value is less than 0.05, so we reject the null hypothesis that the means are equal.
# This means that the average price of cars with more than 300 Ps is significantly different from the average price of cars with 300 Ps or less.

cor(data$Ps, data$Price)
# 0.2640877
# Interpretation: The correlation between Ps and Price is 0.26, indicating a weak positive relationship between the two variables.
# This means that as Ps increases, Price tends to increase as well, but the relationship is not very strong.


#10 Creating samples ----
data_sample <- data[data$Price > 100000, c("manufacturer_new", "Model", "Price", "Ps")]
head(data_sample)

write.csv(data_sample, file = "./data/BenzBMW_data_sample.csv", row.names = FALSE)


#11 Linear regression ----
head(data)
lr_model_1 <- lm(Price ~ manufacturer_new + Ps + state + Year + luxus_wagen, data = data)
summary(lr_model_1)