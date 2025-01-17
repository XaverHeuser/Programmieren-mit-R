#0 Get the data
data = read.csv("./data/benzfinal.csv")

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

#3 Filter and choose data


#4 Data analysis and aggregation


#5 String operations


#6 Statistical analysis


#7 Data visualization


#8 Sort and Group


#9 Statistical tests


#10 Creating samples

