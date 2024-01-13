# Set a seed for reproducibility
set.seed(42)

# Create a vector of means to illustrate varying mean
means <- c(40, 50, 60)

# Plot the normal distribution for each mean
par(mfrow = c(1, length(means)), mar = c(4, 4, 2, 1))

for (mean_val in means) {
  data <- rnorm(1000, mean = mean_val, sd = 10)
  hist(data, main = paste("Mean =", mean_val), xlab = "Values", col = "lightblue", border = "black")
  
  # Add a vertical line at the mean
  abline(v = mean(data), col = "red", lwd = 2)
  
  # Add text to label the mean
  text(mean(data) + 2, 100, paste("Sample Mean =", round(mean(data), 2)), col = "red", pos = 4)
}

# Reset graphical parameters
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2))
