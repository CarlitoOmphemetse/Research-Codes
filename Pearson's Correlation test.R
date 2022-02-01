
library(tidyverse)

setwd("C:/Users/omphe/Desktop/resultss") 

#===================Pearson's Correlation test=======================#

d <- read.csv('df.csv',header = TRUE, sep=',')

head(d)


cor.test(d$Leapfrog_steps,d$Uncertainty_estimate, alternative = 'greater')

cor.test(d$Step_size, d$Uncertainty_estimate, alternative = 'greater' )
