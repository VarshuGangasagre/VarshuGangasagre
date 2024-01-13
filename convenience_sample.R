# Set a seed for reproducibility
set.seed(42)

# Generate a synthetic dataset with a normal distribution
population <- rnorm(1000, mean = 50, sd = 10)

# Define the number of elements to select conveniently
convenience_sample_size <- 100
convenience_sample_indices <- sample(1:length(population), size = convenience_sample_size)

# Extract the conveniently sampled data
convenience_sample <- population[convenience_sample_indices]

# Plot the population distribution
hist(population, main = "Population Distribution", xlab = "Values", col = "lightblue", border = "black")

# Add a vertical line at the population mean
abline(v = mean(population), col = "pink", lwd = 2)

# Add text to label the mean
text(mean(population) + 5, 100, "Population Mean", col = "red", pos = 4)

# Plot the convenience sample distribution
hist(convenience_sample, main = "Convenience Sample Distribution", xlab = "Values", col = "lightgreen", border = "black")

# Add a vertical line at the mean of the convenience sample
abline(v = mean(convenience_sample), col = "black", lwd = 2)

# Add text to label the mean
text(mean(convenience_sample) - 10, 10, "Convenience Sample Mean", col = "blue", pos = 4)

