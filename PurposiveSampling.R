# Set a seed for reproducibility
set.seed(42)

# Generate a synthetic dataset with a normal distribution
population <- rnorm(1000, mean = 50, sd = 10)

# Define the criteria for purposive sampling (e.g., selecting values above a threshold)
threshold <- 55
purposive_sample <- population[population > threshold]

# Plot the population distribution
hist(population, main = "Population Distribution", xlab = "Values", col = "lightblue", border = "black")

# Add a vertical line at the population mean
abline(v = mean(population), col = "red", lwd = 2)

# Add text to label the mean
text(mean(population) + 5, 100, "Population Mean", col = "red", pos = 4)

# Plot the purposive sample distribution
hist(purposive_sample, main = "Purposive Sample Distribution", xlab = "Values", col = "lightgreen", border = "black")

# Add a vertical line at the mean of the purposive sample
abline(v = mean(purposive_sample), col = "blue", lwd = 2)

# Add text to label the mean
text(mean(purposive_sample) - 10, 10, "Purposive Sample Mean", col = "blue", pos = 4)
