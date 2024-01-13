# Set a seed for reproducibility
set.seed(42)

# Generate a synthetic dataset with a normal distribution
population <- rnorm(1000, mean = 50, sd = 10)

# Plot the population distribution
hist(population, main = "Population Distribution", xlab = "Values", col = "lightblue", border = "black")

# Add a vertical line at the population mean
abline(v = mean(population), col = "red", lwd = 2)

# Add text to label the mean
text(mean(population) + 5, 100, "Population Mean", col = "red", pos = 4)

# Systematic Sampling
systematic_sample_size <- 50
k <- round(length(population) / systematic_sample_size)

# Select a random start point
start_point <- sample(1:k, size = 1)

# Perform systematic sampling
systematic_sample_indices <- seq(start_point, length(population), by = k)
systematic_sample <- population[systematic_sample_indices]

# Plot the systematic sample distribution
hist(systematic_sample, main = "Systematic Sampling", xlab = "Values", col = "lightgreen", border = "black")

# Add a vertical line at the systematic sample mean
abline(v = mean(systematic_sample), col = "blue", lwd = 2)

# Add text to label the mean
text(mean(systematic_sample) + 5, 6, "Systematic Sample Mean", col = "blue", pos = 4)
