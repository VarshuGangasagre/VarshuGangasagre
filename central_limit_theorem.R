# Install and load necessary libraries
install.packages("lattice")
library(lattice)

# Function to simulate the Central Limit Theorem
simulate_clt <- function(population, sample_size, num_samples) {
  # Create an empty data frame to store results
  results_df <- data.frame(Sample_Mean = numeric(num_samples))
  
  # Simulate sampling from the population and calculate sample means
  for (i in 1:num_samples) {
    sample_data <- sample(population, size = sample_size, replace = TRUE)
    sample_mean <- mean(sample_data)
    results_df$Sample_Mean[i] <- sample_mean
  }
  
  return(results_df)
}

# Set a seed for reproducibility
set.seed(42)

# Parameters
population_size <- 1000
sample_size <- 30
num_samples <- 1000

# Simulate data from different distributions (e.g., exponential, uniform, beta)
population_exponential <- rexp(population_size, rate = 1)
population_uniform <- runif(population_size, min = 0, max = 1)
population_beta <- rbeta(population_size, shape1 = 2, shape2 = 5)

# Simulate the Central Limit Theorem for each distribution
results_exponential <- simulate_clt(population_exponential, sample_size, num_samples)
results_uniform <- simulate_clt(population_uniform, sample_size, num_samples)
results_beta <- simulate_clt(population_beta, sample_size, num_samples)

# Original distribution plots
original_plots <- densityplot(~ population_exponential + population_uniform + population_beta,
                              groups = c("Exponential", "Uniform", "Beta"),
                              auto.key = TRUE,
                              main = "Original Distributions")

# Sample distribution plots
sample_plots <- histogram(~ Sample_Mean | Distribution,
                          data = rbind(cbind(results_exponential, Distribution = "Exponential"),
                                       cbind(results_uniform, Distribution = "Uniform"),
                                       cbind(results_beta, Distribution = "Beta")),
                          col = c("red", "green", "blue"),
                          main = "Sample Distributions",
                          xlab = "Sample Mean",
                          ylab = "Frequency")

# Q-Q plots
qq_plots <- qqmath(~ Sample_Mean | Distribution,
                   data = rbind(cbind(results_exponential, Distribution = "Exponential"),
                                cbind(results_uniform, Distribution = "Uniform"),
                                cbind(results_beta, Distribution = "Beta")),
                   groups = Distribution,
                   main = "Q-Q Plots",
                   xlab = "Theoretical Quantiles",
                   ylab = "Sample Quantiles")

# Display plots
print(original_plots)
print(sample_plots)
print(qq_plots)
