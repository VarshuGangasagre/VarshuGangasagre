# Install and load required packages
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
library(dplyr)

# Set a seed for reproducibility
set.seed(42)

# Generate a synthetic dataset with three strata
stratum_sizes <- c(3000, 3000, 4000)
stratum_means <- c(40, 50, 60)
stratum_sds <- c(8, 10, 8)

population <- numeric(0)
for (i in 1:length(stratum_sizes)) {
  population <- c(population, rnorm(stratum_sizes[i], mean = stratum_means[i], sd = stratum_sds[i]))
}

# Convert the population to a data frame
population_df <- data.frame(values = population)

# Stratified Sampling using dplyr
stratified_sample <- population_df %>%
  group_by(stratum = cut(values, breaks = c(-Inf, 45, 55, Inf))) %>%
  sample_frac(size = 0.7)

# Plot the population distribution
hist(population_df$values, main = "Population Distribution", xlab = "Values", col = "lightblue", border = "black")

# Add vertical lines at the stratum means
abline(v = stratum_means, col = c("red", "green", "blue"), lwd = 2)

# Add text to label the stratum means
text(stratum_means + 2, 300, c("Stratum 1 Mean", "Stratum 2 Mean", "Stratum 3 Mean"), col = c("red", "green", "blue"), pos = 4)

# Plot the stratified sample distribution
hist(stratified_sample$values, main = "Stratified Sampling", xlab = "Values", col = "lightgreen", border = "black")

# Add a vertical line at the overall sample mean
abline(v = mean(stratified_sample$values), col = "purple", lwd = 2)

# Add text to label the overall sample mean
text(mean(stratified_sample$values) + 2, 25, "Overall Sample Mean", col = "purple", pos = 4)
