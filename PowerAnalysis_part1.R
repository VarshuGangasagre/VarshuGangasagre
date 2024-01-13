# Set a seed for reproducibility
set.seed(42)

# Function to compare two distributions and calculate power
compare_distributions_power <- function(dist1, dist2, effect_size, alpha) {
  # Perform a two-sample t-test
  t_test_result <- t.test(dist1, dist2)
  
  # Plot the distributions
  hist(dist1, main = "Distribution 1", xlab = "Values", col = "lightblue", border = "black")
  hist(dist2, main = "Distribution 2", xlab = "Values", col = "lightgreen", border = "black", add = TRUE, alpha = 0.5)
  
  # Add critical value lines
  critical_value <- qt(1 - alpha / 2, df = length(dist1) + length(dist2) - 2)
  abline(v = c(critical_value, -critical_value), col = "red", lty = 2, lwd = 2)
  
  # Add text to label the critical values
  text(c(critical_value + 1, -critical_value - 1), 50, c("Critical Value", "-Critical Value"), col = "red", pos = 4)
  
  # Display t-test results
  text(50, 80, paste("t-Statistic =", round(t_test_result$statistic, 2)), col = "black", pos = 4)
  text(50, 70, paste("p-Value =", format.pval(t_test_result$p.value, digits = 3)), col = "black", pos = 4)
  
  # Calculate power
  power <- power.t.test(n = length(dist1), delta = effect_size, sd = sd(dist1), sig.level = alpha, type = "two.sample")$power
  
  # Add text to display power
  text(critical_value + 2, 40, paste("Power =", round(power, 2)), col = "blue", pos = 4)
}

# Generate data for two distributions
dist1 <- rnorm(50, mean = 50, sd = 10)
dist2 <- rnorm(50, mean = 55, sd = 10)

# Compare the distributions and calculate power
compare_distributions_power(dist1, dist2, effect_size = 5, alpha = 0.05)
