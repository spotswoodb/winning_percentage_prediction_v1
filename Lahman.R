install.packages("Lahman")
require(Lahman)
require(dplyr)
require(ggplot2)

LahmanData
head(Teams)

mydata <- Teams %>% select(yearID,lgID,teamID,W,L,R,RA) %>%
  filter(yearID==2014,lgID=="AL") %>%
  mutate(wpct=R^2/(R^2+RA^2),expwin=round(wpct*(W+L)),diff=W-expwin)

head(mydata)

mydata

ggplot(mydata,aes(expwin,W)) + geom_point() + stat_smooth(method="lm")

mod <- lm(W~expwin,data=mydata)
mod

summary(mod)
