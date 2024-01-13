# Set a seed for reproducibility
set.seed(42)

# Generate a population with a normal distribution
population <- rnorm(10000, mean = 50, sd = 10)

# Plot the population distribution
hist(population, main = "Population Distribution", xlab = "Values", col = "lightblue", border = "black")

# Add a vertical line at the population mean
abline(v = mean(population), col = "red", lwd = 2)

# Add text to label the mean
text(mean(population) + 5, 500, "Population Mean", col = "red", pos = 4)

# Simulate simple random sampling
sample_size <- 100
sample_indices <- sample(1:length(population), size = sample_size, replace = FALSE)

# Extract the sampled data
sample_data <- population[sample_indices]

# Plot the sample distribution
hist(sample_data, main = "Simple Random Sampling", xlab = "Values", col = "lightgreen", border = "black")

# Add a vertical line at the sample mean
abline(v = mean(sample_data), col = "blue", lwd = 2)

# Add text to label the mean
text(mean(sample_data) + 5, 12, "Sample Mean", col = "blue", pos = 4)
