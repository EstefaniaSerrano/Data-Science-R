
#install.packages("cowplot")
#install.packages("fGarch")

library(cowplot)
library(fGarch)

# take a randomly genrated set of numbers as the population
# setting mean = 7.8, deviation = 2.5 and skewness = 4

pop <- rsnorm(n = 100000, mean = 7.8, sd = 2.5, xi = 4)
#help("rsnorm")
pop_mean <- mean(pop)
pop_sd <- sd(pop)


# Set sample size and number of samples 
n = 100
N = 10000

# Take random samples of size n from the population, take their means and store
# the sample means in a new vector named samp_dist. Doing this N times.


samp_dist <- vector(,N);

for (i in 1:N) {
  samp_dist[i] <- mean(sample(pop, n))

}

# Store mean and SD of sampling distribution 

SD_mean <- mean(samp_dist)
paste("The mean of population distribution is", pop_mean)
paste("The mean of sampling distribution of sampling mean is", SD_mean)

SD_sd <- sd(samp_dist)
paste("The standard deviation of population distribution is", pop_sd)
paste("Population distribution divided by square root of n equals", pop_sd/sqrt(n))
paste("The standard deviation of sampling distribution of sample means is", SD_sd)

# plotting the 2 histograms together: population and sampling distribution of sample mean
plot1 <- qplot(pop)
plot2 <- qplot(samp_dist)
plot_grid(plot1, plot2, align = 'h', labels = c('Population', 'Sampling distribution of sample mean'))


