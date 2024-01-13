# Set a seed for reproducibility
set.seed(42)

# Generate a synthetic dataset with a normal distribution
population <- rnorm(1000, mean = 50, sd = 10)

# Create clusters
num_clusters <- 10
cluster_size <- length(population) / num_clusters
clusters <- cut(1:length(population), breaks = seq(1, length(population), cluster_size), labels = FALSE)

# Cluster Sampling
selected_clusters <- sample(unique(clusters), size = num_clusters / 2)

# Extract the sampled data from selected clusters
cluster_sample <- population[clusters %in% selected_clusters]

# Visualize Clusters in Population
plot(1:length(population), population, col = clusters, pch = 16, main = "Clusters in Population", xlab = "Index", ylab = "Values")

# Add a legend
legend("topright", legend = unique(clusters), col = 1:num_clusters, pch = 16, title = "Clusters")

# Plot the population mean line
abline(h = mean(population), col = "red", lwd = 2)

# Visualize Clusters in Cluster Sample
plot(1:length(cluster_sample), cluster_sample, col = clusters[clusters %in% selected_clusters], pch = 16, main = "Clusters in Cluster Sample", xlab = "Index", ylab = "Values")

# Add a legend
legend("topright", legend = unique(clusters[clusters %in% selected_clusters]), col = 1:num_clusters, pch = 16, title = "Clusters")

# Plot the cluster sample mean line
abline(h = mean(cluster_sample), col = "blue", lwd = 2)

# Plot the mean of the sampled clusters in the population
plot(1:length(population), rep(mean(cluster_sample), length(population)), col = "green", type = "l", lwd = 2, add = TRUE)

# Add text to label the mean
text(length(population) / 2, mean(cluster_sample) + 5, "Mean of Sampled Clusters", col = "green", pos = 4)
