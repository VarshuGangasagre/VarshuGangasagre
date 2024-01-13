# Set a seed for reproducibility
set.seed(42)

# Create a vector of standard deviations to illustrate varying standard deviation
sds <- c(5, 10, 15)

# Plot the normal distribution for each standard deviation
par(mfrow = c(1, length(sds)), mar = c(4, 4, 2, 1))

for (sd_val in sds) {
  data <- rnorm(1000, mean = 50, sd = sd_val)
  hist(data, main = paste("Standard Deviation =", sd_val), xlab = "Values", col = "lightblue", border = "black")
  
  # Add text to label the standard deviation
  text(80, 80, paste("Sample SD =", round(sd(data), 2)), col = "red", pos = 4)
}

# Reset graphical parameters
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2))
