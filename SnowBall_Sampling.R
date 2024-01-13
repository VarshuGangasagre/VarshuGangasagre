# Set a seed for reproducibility
set.seed(42)

# Generate a synthetic network-based dataset
# In this example, we'll create a dataset with clusters representing different social circles
population <- data.frame(
  ID = 1:100,
  Cluster = sample(1:5, size = 100, replace = TRUE),
  Values = rnorm(100, mean = 50, sd = 10)
)

# Function to perform snowball sampling
snowball_sampling <- function(network, initial_nodes, depth) {
  sampled_nodes <- initial_nodes
  for (i in 1:depth) {
    neighbors <- unique(unlist(sapply(sampled_nodes, function(node) {
      network$ID[network$Cluster == network$Cluster[node]]
    })))
    sampled_nodes <- unique(c(sampled_nodes, neighbors))
  }
  return(network[network$ID %in% sampled_nodes, ])
}

# Perform snowball sampling starting from a randomly selected node
depth_of_sampling <- 2
initial_node <- sample(population$ID, 1)
snowball_sample <- snowball_sampling(population, initial_node, depth_of_sampling)

# Plot the population network
plot(population$Values, col = population$Cluster, pch = 16, main = "Population Network", xlab = "ID", ylab = "Values")

# Highlight the initial node
points(population$Values[population$ID == initial_node], col = "red", pch = 16, cex = 2)

# Plot the snowball sample
plot(snowball_sample$Values, col = snowball_sample$Cluster, pch = 16, main = "Snowball Sample", xlab = "ID", ylab = "Values")

# Add text to label the initial node
text(population$Values[population$ID == initial_node], label = "Initial Node", pos = 4, col = "red")
