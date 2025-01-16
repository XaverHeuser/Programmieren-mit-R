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

#6 Create histogram ----
ggplot(data, aes(x = Sepal.Length)) +
geom_histogram(binwidth = 0.2, fill = "red", color ="black") +
labs( title = "Titel des Histogramms",
x = "Beschriftung der X-Achse",
y = "Beschriftung der Y-Achse" )
# TODO: Interpretation:

#7 Create boxplot ----
ggplot(data, aes(x = Species, y = Sepal.Width)) +
geom_boxplot(fill = "green", color = "white") +
labs( title = "Titel des Boxplots",
x = "BeschriIung der X-Achse",
y = "BeschriIung der Y-Achse" )
# TODO: Interpretation:

#8 Group and Aggregate ----
aggregate(data$Sepal.Length, by = list(data$Species), FUN = mean)