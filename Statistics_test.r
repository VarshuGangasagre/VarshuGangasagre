
# 'here': Provides a way to create paths to files using the here() function
library(here)

# 'pdftools': Allows working with PDF files in R
library(pdftools)

# 'stringr': Offers a set of string manipulation functions
library(stringr)

# 'readr': Part of the tidyverse, used for reading and writing rectangular data
library(readr)

# 'dplyr': Part of the tidyverse, provides functions for data manipulation
library(dplyr)

# 'tibble': Provides a modern data frame class
library(tibble)

# 'magrittr': Provides a set of operators for enhancing readability of code
library(magrittr)

# 'glue': Offers an easy-to-use string interpolation function
library(glue)

# 'purrr': Part of the tidyverse, provides functional programming tools
library(purrr)

# 'tidyr': Part of the tidyverse, provides functions for data tidying
library(tidyr)

# 'ggplot2': Part of the tidyverse, used for creating static graphics
library(ggplot2)

# 'ggrepel': Provides functions for avoiding overplotting of labels in ggplot2 plots
library(ggrepel)

# 'cowplot': Allows combining multiple ggplots into a single plot
library(cowplot)

# 'patchwork': Allows combining multiple ggplots using a syntax similar to arithmetic operations
library(patchwork)

# 'OCSdata': Not a commonly used library, please verify if it's necessary for your project
library(OCSdata)

# ONE SAMPLE T-TEST

#import the data
LungCapData <- read.table(file="E:\\IIITD\\tutorial/LungCapData.txt", sep="\t", header=T)

#get summary of data
summary(LungCapData)

#get column names of data
names(LungCapData)

#arguments for t-test
help("t.test")

# Histogram to check normal distribution
hist(LungCapData$LungCap, col = "lightgreen", main = "Histogram of Lung Capacity")

#boxplot to check homogeneity of variance
boxplot(LungCapData$LungCap)

#perform one sample t-test
t.test(LungCapData$LungCap, mu = 8, alternative = "less", conf.level = 0.95)

# PAIRED T-TEST

#load the data
BMI_long <- read_csv("E:\\IIITD\\tutorial/BMI_long.csv")

#summary of data
summary(BMI_long)

#histogram to check distribution
BMI_long %>%
  ggplot(aes(x=BMI)) +
  geom_histogram() +
  facet_wrap(~ Sex + Year + Region)

#get qqplot for checking variance
BMI_long %>%
  filter(Sex == "Women") %>%
  ggplot(aes(sample = BMI)) +
  stat_qq() + 
  stat_qq_line() +
  facet_wrap(~ Year + Region)

#perform paired t-test
t.test(pull(filter(BMI_long, Sex == "Women", 
                   Year == "1985", 
                   Region == "Rural"), BMI), 
       pull(filter(BMI_long, Sex == "Women", 
                   Year == "1985", 
                   Region == "Urban"), BMI), 
       paired = TRUE)


#perform independent t-test
t.test(pull(filter(BMI_long, Sex == "Men", 
                   Year == "1985", 
                   Region == "Urban"), BMI), 
       pull(filter(BMI_long, Sex == "Women", 
                   Year == "1985", 
                   Region == "Urban"), BMI), 
       var.equal = TRUE)


# ONE WAY ANOVA

#read the data
crop.data <- read.csv("E:\\IIITD\\tutorial/crop_data.csv")

#check the column names(contents) of the data
names(crop.data)

# Create a Q-Q plot to check normality distribution
ggplot(crop.data, aes(sample = yield)) +
  stat_qq() + 
  stat_qq_line()

# Create a boxplot to check homogeneity of variance
ggplot(crop.data, aes(x = factor(density), y = yield)) +
  geom_boxplot() +
  labs(title = "Homogeneity of Variance Check", x = "Density", y = "Yield")

#Convert the 'fertilizer' variable in the 'crop.data' dataframe to a factor
crop.data$fertilizer <- factor(crop.data$fertilizer)

#check the arguments to be entered for ANOVA model
help("aov")

#perform one-way ANOVA
one.way <- aov(yield ~ fertilizer, data = crop.data)

#explore the reslts of ANOVA model
summary(one.way)


# TWO WAY ANOVA

#load the package
install.packages("palmerpenguins")

#import library
library(palmerpenguins)

# rename dataset
dat <- penguins 

# structure of dataset
str(dat)

#summary of the dataset
summary(dat)

#get qq plot to check normal distribution
mod <- aov(body_mass_g ~ sex * species,
           data = dat
)
plot(mod, which = 2)

# histogram
hist(mod$residuals)

# boxplots by sex to check for outliers
ggplot(dat) +
  aes(x = sex, y = body_mass_g) +
  geom_boxplot()

# boxplots by species
ggplot(dat) +
  aes(x = species, y = body_mass_g) +
  geom_boxplot()

# mean by group
aggregate(body_mass_g ~ species + sex,
          data = dat,
          FUN = mean
)

# mean and sd by group
group_by(dat, sex, species) %>%
  summarise(
    mean = round(mean(body_mass_g, na.rm = TRUE)),
    sd = round(sd(body_mass_g, na.rm = TRUE))
  )

# Two-way ANOVA with interaction
# save model
mod <- aov(body_mass_g ~ sex * species,
           data = dat
)

# print results
summary(mod)




