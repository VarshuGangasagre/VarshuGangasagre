# Set a seed for reproducibility
set.seed(42)

# Generate a synthetic dataset with a normal distribution
population <- rnorm(1000, mean = 50, sd = 10)

# Function to create samples of different sizes
create_samples <- function(population, sample_sizes) {
  sample_means <- sapply(sample_sizes, function(size) {
    sample_data <- sample(population, size = size)
    return(mean(sample_data))
  })
  return(sample_means)
}

# Define different sample sizes
sample_sizes <- c(10, 30, 50, 100, 200)

# Create samples
samples <- create_samples(population, sample_sizes)

# Plot the population distribution
hist(population, main = "Population Distribution", xlab = "Values", col = "lightblue", border = "black")

# Add a vertical line at the overall population mean
abline(v = mean(population), col = "red", lwd = 2)

# Add text to label the overall mean
text(mean(population) + 5, 100, "Population Mean", col = "red", pos = 4)

# Plot the distribution of sample means for different sample sizes
par(mfrow = c(2, 3), mar = c(4, 4, 2, 1))

for (i in 1:length(sample_sizes)) {
  hist(samples[[i]], main = paste("Sample Size =", sample_sizes[i]), xlab = "Sample Means", col = "lightgreen", border = "black")
  
  # Add a vertical line at the mean of the sample means
  abline(v = mean(samples[[i]]), col = "blue", lwd = 2)
  
  # Add text to label the mean of the sample means
  text(mean(samples[[i]]) - 2, 10, paste("Sample Mean =", round(mean(samples[[i]]), 2)), col = "blue", pos = 4)
}

# Reset graphical parameters
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2))
