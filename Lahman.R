install.packages("Lahman")
require(Lahman)
require(dplyr)
require(ggplot2)

LahmanData
head(Teams)

mydata <- Teams %>% select(yearID,lgID,teamID,W,L,R,RA) %>%
  filter(yearID==2014,lgID=="AL") %>%
  mutate(wpct=R/(R+RA))
