###################
#
# Cameron Norrie
# CIS4020
# Nov 2023
#
###################
# Clear Memory
# & Load Packages
###################
remove(list=ls())
#install.packages("arrow")
#install.packages("ggplot2")


library(arrow)   # package needed to work with Parquet files
library(ggplot2) # package for line graph


amr_data_file <- "./data/AMR Data.parquet"


# Read in the AMR data file into memory
amr_data_file_mem <- arrow::read_parquet(amr_data_file)

# store counts of each type of year in a table
test_counts <- table(amr_data_file_mem[["order_month"]])

months_count_df <- data.frame(value = as.numeric(names(test_counts)), count = as.numeric(test_counts))

# plot that baby
ggplot(months_count_df, aes(x = value, y = count)) +
  geom_line() +
  geom_point() +
  labs("Number of Tests Per Month",
       x = "Months",
       y = "Number of Tests",
       title = "Number of AMR Tests per Month") +
  scale_x_continuous(breaks = 1:12)
