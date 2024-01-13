# Set a seed for reproducibility
set.seed(42)

# Generate a population with a Poisson distribution
population <- rpois(10000, lambda = 50)

# Plot the population distribution
hist(population, main = "Population Distribution (Poisson)", xlab = "Values", col = "lightblue", border = "black")

# Add a vertical line at the population mean
abline(v = mean(population), col = "red", lwd = 2)

# Add text to label the mean
text(mean(population) + 5, 500, "Population Mean", col = "red", pos = 4)

# Simulate the sampling process
sample_size <- 100
num_samples <- 5

sampling_errors <- numeric(num_samples)

for (i in 1:num_samples) {
  # Take a random sample from the population
  sample_data <- sample(population, sample_size, replace = TRUE)
  
  # Plot each sample distribution
  hist(sample_data, main = paste("Sample Distribution ", i), xlab = "Values", col = "lightgreen", border = "black")
  
  # Add a vertical line at the sample mean
  abline(v = mean(sample_data), col = "blue", lwd = 2)
  
  # Add text to label the mean
  text(mean(sample_data) + 5, 12, paste("Sample Mean ", i), col = "blue", pos = 4)
  
  # Calculate and store the sampling error
  sampling_errors[i] <- mean(sample_data) - mean(population)
}

# Display sampling errors
cat("Sampling Errors:", sampling_errors, "\n")

# Plot sampling errors
barplot(sampling_errors, main = "Sampling Errors", xlab = "Sample", ylab = "Sampling Error", col = "orange")
