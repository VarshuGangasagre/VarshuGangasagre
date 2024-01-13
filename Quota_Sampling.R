# Set a seed for reproducibility
set.seed(42)

# Generate a synthetic dataset with two normal distributions
population <- c(rnorm(800, mean = 40, sd = 8), rnorm(200, mean = 70, sd = 5))

# Define the quotas for two groups
quota_group1 <- 400
quota_group2 <- 100

# Select individuals based on quotas
quota_sample_group1 <- sample(population[population <= 50], size = quota_group1, replace = TRUE)
quota_sample_group2 <- sample(population[population > 50], size = quota_group2, replace = TRUE)

# Combine the quota samples
quota_sample <- c(quota_sample_group1, quota_sample_group2)

# Plot the population distribution
hist(population, main = "Population Distribution", xlab = "Values", col = "lightblue", border = "black")

# Add a vertical line at the overall population mean
abline(v = mean(population), col = "red", lwd = 2)

# Add text to label the overall mean
text(mean(population) + 5, 100, "Population Mean", col = "red", pos = 4)

# Plot the quota sample distribution
hist(quota_sample, main = "Quota Sample Distribution", xlab = "Values", col = "lightgreen", border = "black")

# Add a vertical line at the mean of the quota sample
abline(v = mean(quota_sample), col = "blue", lwd = 2)

# Add text to label the quota sample mean
text(mean(quota_sample) - 10, 10, "Quota Sample Mean", col = "blue", pos = 4)
