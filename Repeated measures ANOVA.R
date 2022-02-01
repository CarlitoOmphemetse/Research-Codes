
library(tidyverse)

setwd("C:/Users/omphe/Desktop/resultss/tests_data") 


crp <- read.csv('prog_runtimes.csv',header = TRUE, sep=',')

head(crp)

crp_long <- crp %>%
  gather(key='Runtime',value='crp',
         BGRU, BRNN,B_OGRU)

crp_long

crp <- crp_long$crp
crp_long$ID <-as.factor(crp_long$ID)
crp_long$Runtime <-as.factor(crp_long$Runtime)
crp_long$Runtime <-relevel(crp_long$Runtime, 'BGRU')

sum <- crp_long %>%
  group_by(Runtime) %>%
  summarise(
    mean_Runtime = mean(crp),
    sd = sd(crp)
  )

ggplot(sum, aes(x=Runtime, y=mean_Runtime)) +
 geom_col() +
 geom_errorbar(aes(ymin=mean_Runtime-sd, ymax=mean_Runtime+sd), width=0.2)


crp_anova <- aov(crp ~ Runtime + Error(ID/Runtime), crp_long)
summary(crp_anova)
