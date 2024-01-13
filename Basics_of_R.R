#install.packages("dplyr")
library(dplyr)
#install.packages("ggplot2")
library(ggplot2)

#Import Data:
df <- IMD_MH_2001.14
summary(df)

#Alternatively:
# Create a function to summarize the dataset
summarize_variable <- function(x) {
  mean_value <- mean(x)
  sd_value <- sd(x)
  median_value <- median(x)
  
  return(c(mean = mean_value, sd = sd_value, median = median_value))
}

# Apply the summarize_variable function to each variable in the dataframe
summary_list <- lapply(df, summarize_variable)

# Convert the list of summaries into a dataframe
summary_df <- as.data.frame(summary_list)

# Print the summarized data
print(summary_df)


#Problem?

# Need to Account for NA Values
summarize_variable <- function(x) {
  mean_value <- mean(x, na.rm=TRUE)
  sd_value <- sd(x, na.rm=TRUE)
  median_value <- median(x, na.rm=TRUE)
  
  return(c(mean = mean_value, sd = sd_value, median = median_value))
}

# Apply the summarize_variable function to each variable in the dataframe
summary_list <- lapply(df, summarize_variable)

# Convert the list of summaries into a dataframe
summary_df <- as.data.frame(summary_list)

# Print the summarized data
print(summary_df)

#Let's try to look at the data:

#Now, I want to look at total yearly rainfall or average temperature in a year for each village/station. 
#To do this, I must modify/collapse my dataset to obtain a year-wise temperature or rainfall summary for each station.
#I want one value for each station-year ID:
#For this type of manipulation, the most commonly used package in R is: DPLYR
#install.packages("dplyr")
library(dplyr)
df$station_year_id <- paste(df$NAME.OF.STATION,df$YEAR)

rf_yearly <- df %>%
  group_by(station_year_id, YEAR, NAME.OF.STATION) %>%
  summarise(rf_total = sum(R.F, na.rm=TRUE))

#Now, I want to visualize this data:
#install.packages("ggplot2")
library(ggplot2)

ggplot(rf_yearly, aes(x = YEAR, y = rf_total, color = NAME.OF.STATION)) +
  geom_line(size = 1) +
  labs(title = "Year-Wise Plot of Rainfall by Weather-Station", y = "Total Rainfall (in mm)") +
  theme_minimal() +
  facet_wrap(~NAME.OF.STATION, ncol = 1)

#Finally, I want to visualize the combined distribution of rainfall for these two villages for the 2001-14 period:
rf_yearly_combined <- rf_yearly %>%
  group_by(YEAR) %>%
  summarise(rf_combined = mean(rf_total, na.rm=TRUE))

ggplot(rf_yearly_combined, aes(x = YEAR, y = rf_combined)) +
  geom_line(size = 1) +
  labs(title = "Year-Wise Plot of Rainfall for all Villages in MH", y = "Total Rainfall (in mm)") +
  theme_minimal() 

#Moving onto GRID Data:
dg <- IMD_GRID_MH_2001.14
summary(dg)

# Apply the summarize_variable function to each variable in the NEW dataframe
summary_list <- lapply(dg, summarize_variable)

# Convert the list of summaries into a dataframe
summary_dg <- as.data.frame(summary_list)

# Print the summarized data
print(summary_dg)

#Visualizing:
#library(ggplot2)

ggplot(dg, aes(x = year, y = rf_annual, color = village)) +
  geom_line(size = 1) +
  labs(title = "Year-Wise Plot of Rainfall by Village", y = "Total Rainfall (in mm)") +
  theme_minimal() +
  facet_wrap(~village, ncol = 1)

#Finally, I want to visualize the combined distribution of rainfall for these two villages for the 2001-14 period:
rf_yearly_combined_grid <- dg %>%
  group_by(year) %>%
  summarise(rf_combined_grid = mean(rf_annual, na.rm=TRUE))

ggplot(rf_yearly_combined_grid, aes(x = year, y = rf_combined_grid)) +
  geom_line(size = 1) +
  labs(title = "Year-Wise Plot of Rainfall for all Villages in MH", y = "Total Rainfall (in mm)") +
  theme_minimal() 

#But, this is not a good graph to compare:
#We would need to merge the two data frames we have generated to compare: 

#Rename the year variable.
rf_yearly_combined <- rf_yearly_combined %>%
  rename(year = YEAR)

# Left join the dataframes based on the "year" column
merged_df <- rf_yearly_combined %>%
  left_join(rf_yearly_combined_grid, by = "year")

ggplot(merged_df, aes(x = year)) +
  geom_line(aes(y = rf_combined, color = "Rainfall_Weather_Station"), size = 1) +
  geom_line(aes(y = rf_combined_grid, color = "Rainfall_Grid"), size = 1) +
  labs(title = "Year-Wise Plot for Weather Station and Grid Data for Rainfall", y = "Rainfall (in mm.)") +
  scale_color_manual(values = c("Rainfall_Weather_Station" = "blue", "Rainfall_Grid" = "red")) +
  theme_minimal() 

#Okay, now we may want to compare the daily data itself:

# Extract data for a specific year and village using dplyr
#solapur_1_imd <- df %>%
#  filter(YEAR == 2001, NAME.OF.STATION == "Solapur")
#Since I will then want to bring in daily grid data as well, I have provided a clean file for comparison. 

solapur_2001<-Solapur_2001_GRID_WSTN

# Create a histogram plot for each variable
p <- ggplot(solapur_2001, aes(x = R.F_GRID)) +
  geom_histogram(fill = "blue", alpha = 0.2, bins = 30) +
  labs(title = "Daily Rainfall_Station-Level Vs. Gridded Data", x = "Values", y = "Frequency")
p <- p + geom_histogram(data = solapur_2001, aes(x = R.F), fill = "red", alpha = 0.2, bins = 30)

print(p)

#Exclude Zeroes:
solapur_2001_filtered <- solapur_2001 %>%
  filter(R.F_GRID != 0)

p <- ggplot(solapur_2001_filtered, aes(x = R.F_GRID)) +
  geom_histogram(fill = "blue", alpha = 0.2, bins = 30) +
  labs(title = "Daily Rainfall_Station-Level Vs. Gridded Data", x = "Values", y = "Frequency")
p <- p + geom_histogram(data = solapur_2001_filtered, aes(x = R.F), fill = "red", alpha = 0.2, bins = 30)

print(p)

#Side-By-Side Graphs:
# Combine the data for plotting
combined_data <- rbind(
  data.frame(Values = solapur_2001_filtered$R.F_GRID, Variable = "R.F_GRID"),
  data.frame(Values = solapur_2001_filtered$R.F, Variable = "R.F")
)

# Create side-by-side histograms with facet_wrap
p <- ggplot(combined_data, aes(x = Values, fill = Variable)) +
  geom_histogram(alpha = 0.2, bins = 30, position = "dodge") +
  labs(title = "Daily Rainfall_Station-Level Vs. Gridded Data", x = "Values", y = "Frequency") +
  scale_fill_manual(values = c("R.F_GRID" = "blue", "R.F" = "red")) +
  facet_wrap(~ Variable)

print(p)