# Set a seed for reproducibility
set.seed(42)

# Generate data from a standard normal distribution
data <- rnorm(100)

# Set the significance level (alpha)
alpha <- 0.05

# Calculate the critical value for a two-tailed test
critical_value <- qnorm(1 - alpha / 2)

# Plot the standard normal distribution
hist(data, main = "Standard Normal Distribution", xlab = "Values", col = "lightblue", border = "black")
abline(v = c(critical_value, -critical_value), col = "red", lty = 2, lwd = 2)

# Add text to label the critical values
text(c(critical_value + 0.1, -critical_value - 0.1), 10, c("Critical Value", "-Critical Value"), col = "red", pos = 4)
