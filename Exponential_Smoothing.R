# Install and load required packages (if not already installed)
# install.packages(c("forecast", "ggplot2"))

library(forecast)
library(ggplot2)

# Generate a synthetic time series dataset
set.seed(123)
time_series <- ts(cumsum(rnorm(100, mean = 0, sd = 1)), frequency = 1)

# Apply exponential smoothing
smoothed_data <- forecast::forecast(HoltWinters(time_series, beta = FALSE, gamma = FALSE), h = length(time_series))

# Create a plot to visualize the original and smoothed time series
df <- data.frame(
  Time = time(time_series),
  Original = as.numeric(time_series),
  Smoothed = as.numeric(smoothed_data$mean)
)

ggplot(df, aes(x = Time)) +
  geom_line(aes(y = Original), color = "blue", size = 1, linetype = "solid") +
  geom_line(aes(y = Smoothed), color = "red", size = 1, linetype = "dashed") +
  labs(title = "Exponential Smoothing", x = "Time", y = "Value") +
  theme_minimal()
