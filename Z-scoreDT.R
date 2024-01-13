# Generate a synthetic dataset
set.seed(123)
original_data <- c(rnorm(100, mean = 10, sd = 5), rnorm(10, mean = 50, sd = 5))

# Function to detect and remove outliers using Z-scores
remove_outliers <- function(data, z_threshold = 2) {
  z_scores <- scale(data)
  outliers <- abs(z_scores) > z_threshold
  return(data[!outliers])
}

# Set Z-score threshold for outlier removal
z_threshold <- 2

# Remove outliers based on Z-scores
filtered_data <- remove_outliers(original_data, z_threshold)

# Create a boxplot to visualize the original and filtered datasets
boxplot(original_data, filtered_data, names = c("Original", "Filtered"), col = c("lightblue", "lightgreen"), main = "Z-Score Outlier Detection")

# Display Z-scores for the original data
cat("Z-Scores for Original Data:\n", scale(original_data), "\n")

# Display Z-scores for the filtered data
cat("\nZ-Scores for Filtered Data:\n", scale(filtered_data), "\n")
