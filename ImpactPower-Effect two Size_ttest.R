# Function to calculate power for a two-sample t-test
calculate_power <- function(effect_sizes, sample_size, alpha = 0.05) {
  power_values <- numeric(length(effect_sizes))
  
  for (i in seq_along(effect_sizes)) {
    power_values[i] <- power.t.test(n = sample_size, delta = effect_sizes[i], sd = 1, sig.level = alpha, type = "two.sample")$power
  }
  
  return(power_values)
}

# Set a seed for reproducibility
set.seed(42)

# Define effect sizes and sample sizes
effect_sizes <- seq(0.1, 1, by = 0.1)
sample_size <- 50

# Calculate power for different effect sizes
power_values <- calculate_power(effect_sizes, sample_size)

# Plot the impact on power
plot(effect_sizes, power_values, type = "b", pch = 16, col = "blue",
     xlab = "Effect Size", ylab = "Power", main = "Impact on Power Due to Effect Size")

# Add a reference line for 80% power
abline(h = 0.8, col = "red", lty = 2)

# Add text to label the reference line
text(0.2, 0.82, "80% Power", col = "red")

# Add a legend
legend("topright", legend = paste("Sample Size =", sample_size), col = "blue", pch = 16)
