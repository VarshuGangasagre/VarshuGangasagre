# Install and load required packages (if not already installed)
# install.packages("ggplot2")

library(ggplot2)

# Function to perform moving average smoothing
moving_average <- function(data, window_size) {
  ma <- filter(data, rep(1/window_size, window_size), sides = 2, circular = TRUE)
  return(ma)
}

# Generate a synthetic dataset with noise
set.seed(123)
original_data <- cumsum(rnorm(100, mean = 0, sd = 1))

# Apply moving average smoothing
smoothed_data <- moving_average(original_data, window_size = 5)

# Create a plot to visualize the original and smoothed datasets
df <- data.frame(x = 1:length(original_data), Original = original_data, Smoothed = smoothed_data)

ggplot(df, aes(x = x)) +
  geom_line(aes(y = Original), color = "blue", size = 1, linetype = "solid") +
  geom_line(aes(y = Smoothed), color = "red", size = 1, linetype = "dashed") +
  labs(title = "Data Smoothing with Moving Average", x = "Index", y = "Value") +
  theme_minimal()
