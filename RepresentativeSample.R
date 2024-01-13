# Set a seed for reproducibility
set.seed(42)

# Generate a synthetic dataset with two normal distributions representing two clusters
population <- data.frame(
  ID = 1:1000,
  Cluster = sample(1:2, size = 1000, replace = TRUE),
  Values = c(rnorm(500, mean = 40, sd = 8), rnorm(500, mean = 70, sd = 5))
)

# Function to create a representative sample
create_representative_sample <- function(population, sample_size) {
  clusters <- unique(population$Cluster)
  sample_per_cluster <- sample_size / length(clusters)
  
  sampled_data <- lapply(clusters, function(cluster) {
    cluster_data <- population[population$Cluster == cluster, ]
    sampled_cluster <- cluster_data[sample(1:nrow(cluster_data), size = sample_per_cluster, replace = TRUE), ]
    return(sampled_cluster)
  })
  
  return(do.call(rbind, sampled_data))
}

# Create a representative sample
representative_sample_size <- 200
representative_sample <- create_representative_sample(population, representative_sample_size)

# Plot the population distribution
hist(population$Values, main = "Population Distribution", xlab = "Values", col = "lightblue", border = "black")

# Add a vertical line at the overall population mean
abline(v = mean(population$Values), col = "red", lwd = 2)

# Add text to label the overall mean
text(mean(population$Values) + 5, 100, "Population Mean", col = "red", pos = 4)

# Plot the representative sample distribution
hist(representative_sample$Values, main = "Representative Sample Distribution", xlab = "Values", col = "lightgreen", border = "black")

# Add a vertical line at the mean of the representative sample
abline(v = mean(representative_sample$Values), col = "blue", lwd = 2)

# Add text to label the representative sample mean
text(mean(representative_sample$Values) - 10, 10, "Representative Sample Mean", col = "blue", pos = 4)
