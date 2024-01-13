# Set a seed for reproducibility
set.seed(42)

# Generate a synthetic dataset with two groups
population <- data.frame(
  ID = 1:1000,
  Group = sample(c("A", "B"), size = 1000, replace = TRUE),
  Values = c(rnorm(500, mean = 40, sd = 8), rnorm(500, mean = 70, sd = 5))
)

# Function to create a homogeneous sample
create_homogeneous_sample <- function(population, sample_size, target_group) {
  target_data <- population[population$Group == target_group, ]
  sampled_data <- target_data[sample(1:nrow(target_data), size = sample_size, replace = TRUE), ]
  return(sampled_data)
}

# Create a homogeneous sample from Group A
homogeneous_sample_size <- 100
homogeneous_sample_group_A <- create_homogeneous_sample(population, homogeneous_sample_size, "A")

# Plot the population distribution
hist(population$Values, main = "Population Distribution", xlab = "Values", col = "lightblue", border = "black")

# Add a vertical line at the overall population mean
abline(v = mean(population$Values), col = "red", lwd = 2)

# Add text to label the overall mean
text(mean(population$Values) + 5, 100, "Population Mean", col = "red", pos = 4)

# Plot the homogeneous sample distribution from Group A
hist(homogeneous_sample_group_A$Values, main = "Homogeneous Sample (Group A)", xlab = "Values", col = "lightgreen", border = "black")

# Add a vertical line at the mean of the homogeneous sample
abline(v = mean(homogeneous_sample_group_A$Values), col = "blue", lwd = 2)

# Add text to label the homogeneous sample mean
text(mean(homogeneous_sample_group_A$Values) - 10, 10, "Homogeneous Sample Mean", col = "blue", pos = 4)
