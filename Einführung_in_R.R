#1
x <- seq(0, 100, 5)
print(x)

#2
vector <- c(5,6,7,4,3,2)
vector_mean <- mean(vector)
print(vector_mean)

#3
vector_range <- range(vector)
print(vector_range)

#4
vector_sum <- sum(vector)
print(vector_sum)

#5
vector_scale <- scale(vector, center=TRUE, scale=TRUE)
print(vector_scale)

#6
vektor <- rep(3, times=100)
print(vektor)

#7
coin_toss <- sample(c(1, 2), size = 100, replace = TRUE)
print(coin_toss)

#8
coin_toss_biased <- sample(c(1, 2), size = 100, replace = TRUE, prob = c(0.2, 0.8))
print(coin_toss_biased)

#9
vector_new <- rep(9, 15)
print(vector_new)

