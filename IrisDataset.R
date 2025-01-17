#1 Load dataset ----
data <- iris
head(data)

#2 Data exploration ----
str(data)

#3 Statistical summary ----
skim(data)
summary(data)

#4 Calculate mean and median ----
mean(data$Sepal.Length)
median(data$Sepal.Length)

#5 Calculate mode ----
modus <- function(x) {
  unique_x <- unique(x)
  unique_x[which.max(tabulate(match(x, unique_x)))]
}
modus(data$Sepal.Length)
# Interpretation:
# The mode of the Sepal.Length is 5.0. It represents the value that appears most frequently in the dataset.

#6 Create histogram ----
ggplot(data, aes(x = Sepal.Length)) +
geom_histogram(binwidth = 0.2, fill = "red", color ="black") +
labs( title = "Titel des Histogramms",
x = "Sepal Length",
y = "Values" )
# Interpretation:
# The histogram shows the distribution of the Sepal Length values.
# It shows how frequently each value occurs in the dataset.
# The distribution is approximately normal with a peak around 5.0.
# The majority of the values are between 5.0 and 6.0.

#7 Create boxplot ----
ggplot(data, aes(x = Species, y = Sepal.Width)) +
geom_boxplot(fill = "green", color = "white") +
labs( title = "Titel des Boxplots",
x = "Species",
y = "Sepal Width" )
# Interpretation:
# The boxplot shows the distribution of the Sepal Width values for each species.
# It has information about the median, quartiles, and potential outliers.
# The median Sepal Width is highest for the Virginica species.

#8 Group and Aggregate ----
aggregate(data$Sepal.Length, by = list(data$Species), FUN = mean)
# Interpretation:
# The aggregate function calculates the mean Sepal Length for each species.

#9 Create new variable ----
data$Sepal.Size <- ifelse(data$Sepal.Length > 5.0, "Ja", "Nein")

#10 Save dataset ----
write.csv(data, file = "./data/iris_dataset_edited.csv")

#11 Filter data ----
data_filtered <- data[data$Sepal.Length > 6.0, ]

#12 Calculate standard deviation ----
sd(data$Petal.Length)
# Interpretation:
# It represents the average distance of the values from the mean.
# A higher standard deviation indicates more variability in the data.
# The standard deviation of the Petal Length values is 1.765298.

#13 Calculate interquartile range ----
IQR(data$Sepal.Width)
# Interpretation:
# The interquartile range represents the range of values between the 25th and 75th percentiles.
# It is a measure of the spread of the data around the median.

#14 Create scatterplot ----
ggplot(data, aes(x = Sepal.Width, y = Petal.Width)) +
geom_point(aes(color = Species)) +
labs( title = "Scatterplot",
x = "Sepal Width",
y = "Petal Width" )
# Interpretation:
# The scatterplot shows the relationship between the Sepal Width and Petal Width values.
# Each point represents a data point, and the color represents the species.
# There is a positive correlation between the two variables.

#15 Rename column ----
colnames(data)[1] <- "SepalLength_cm"
head(data)

#16 Maximum and minimum ----
max(data$Petal.Length)
min(data$Petal.Length)

#17 Count values per Species ----
fct_count(data$Species)

#18 Sort data ----
data_sorted <- data[order(data$SepalLength_cm), ]
head(data_sorted)

#19 Get rows with missing values ----
sum(is.na(data))

#20 Mean of columns for each Species ----
aggregate(data[, 1:4], by = list(data$Species), FUN = mean)
aggregate(data$Petal.Width, by = list(data$Species), FUN = mean)
