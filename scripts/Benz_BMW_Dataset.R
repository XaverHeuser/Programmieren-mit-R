data = read.csv("../data/benzfinal.csv")

#1 Overview of dataquality
skim(data)
summary(data)
plot_missing(data)

#2 Create new variable
if (data$Ps > 300) {
  data$sport_wagen <- 1
} else {
  data$sport_wagen <- 0
}
if (data$Price > 200000) {
  data$luxus_wagen <- 1
} else {
  data$luxus_wagen <- 0
}