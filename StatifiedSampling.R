# Set a seed for reproducibility
set.seed(42)

# Generate a population with three strata
population_stratum1 <- rnorm(3000, mean = 40, sd = 8)
population_stratum2 <- rnorm(3000, mean = 50, sd = 10)
population_stratum3 <- rnorm(4000, mean = 60, sd = 8)

# Combine the strata into a single population
population <- c(population_stratum1, population_stratum2, population_stratum3)

# Plot the population distribution
hist(population, main = "Population Distribution", xlab = "Values", col = "lightblue", border = "black")

# Add vertical lines at the stratum means
abline(v = c(mean(population_stratum1), mean(population_stratum2), mean(population_stratum3)),
       col = c("red", "green", "blue"), lwd = 2)

# Add text to label the stratum means
text(mean(population_stratum1) + 2, 300, "Stratum 1 Mean", col = "red", pos = 4)
text(mean(population_stratum2) + 2, 300, "Stratum 2 Mean", col = "green", pos = 4)
text(mean(population_stratum3) + 2, 300, "Stratum 3 Mean", col = "blue", pos = 4)

# Stratified Sampling
stratum_sizes <- c(length(population_stratum1), length(population_stratum2), length(population_stratum3))
stratum_sample_sizes <- round(stratum_sizes / sum(stratum_sizes) * 100)  # Proportional to stratum sizes

# Initialize an empty vector to store the sampled data
sample_data <- numeric(0)

# Perform stratified sampling
for (i in 1:length(stratum_sizes)) {
  stratum_indices <- sample(1:stratum_sizes[i], size = stratum_sample_sizes[i], replace = FALSE)
  sample_data <- c(sample_data, population[stratum_indices])
}

# Plot the stratified sample distribution
hist(sample_data, main = "Stratified Sampling", xlab = "Values", col = "lightgreen", border = "black")

# Add a vertical line at the overall sample mean
abline(v = mean(sample_data), col = "purple", lwd = 2)

# Add text to label the overall sample mean
text(mean(sample_data) + 2, 25, "Overall Sample Mean", col = "purple", pos = 4)
