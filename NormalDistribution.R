# Set a seed for reproducibility
set.seed(42)

# Generate a synthetic dataset with a normal distribution
data <- rnorm(1000, mean = 50, sd = 10)

# Plot the histogram to illustrate normal distribution
hist(data, main = "Normal Distribution", xlab = "Values", col = "lightblue", border = "black")

# Add a vertical line at the mean
abline(v = mean(data), col = "red", lwd = 2)

# Add text to label the mean
text(mean(data) + 5, 100, "Population Mean", col = "red", pos = 4)

# Add a horizontal line at the density peak
dens <- density(data)
max_density <- dens$x[which.max(dens$y)]
abline(h = max_density, col = "blue", lwd = 2)

# Add text to label the density peak
text(mean(data) + 5, max_density, "Peak Density", col = "blue", pos = 4)

# Illustrate factors affecting normal distribution
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

# Varying mean
hist(rnorm(1000, mean = 45, sd = 10), main = "Varying Mean", xlab = "Values", col = "lightgreen", border = "black")

# Varying standard deviation
hist(rnorm(1000, mean = 50, sd = 5), main = "Varying Standard Deviation", xlab = "Values", col = "lightcoral", border = "black")

# Skewed distribution
hist(rlnorm(1000, meanlog = 4, sdlog = 1), main = "Skewed Distribution", xlab = "Values", col = "lightyellow", border = "black")

# Bimodal distribution
hist(c(rnorm(500, mean = 40, sd = 8), rnorm(500, mean = 70, sd = 5)), main = "Bimodal Distribution", xlab = "Values", col = "lightpink", border = "black")

# Reset graphical parameters
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2))

# Add critical lines and p-value illustration
critical_value <- qnorm(0.95)
x_values <- seq(-3, 3, length.out = 1000)
y_values <- dnorm(x_values)

# Plot the normal distribution
plot(x_values, y_values, type = "l", main = "Critical Lines and P-Value", xlab = "Z-Score", ylab = "Density", col = "blue", lwd = 2)

# Highlight the critical region
polygon(c(x_values[x_values > critical_value], critical_value), c(y_values[x_values > critical_value], 0), col = "gray", border = NA)

# Add critical value line
abline(v = critical_value, col = "red", lty = 2, lwd = 2)

# Add text to label the critical value
text(critical_value + 0.2, 0.1, "Critical Value", col = "red", pos = 4)

# Add text for the p-value
text(critical_value - 2, 0.02, "P-Value", col = "black", pos = 4)

# Reset graphical parameters
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2))
