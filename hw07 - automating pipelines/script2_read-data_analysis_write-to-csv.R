#Second Script: read the data, perform some analysis, and write numerical data to file in CSV
#Next, I wanted to bring the data in as data frame. 
#I found that the years were being read in with an "X" in front of the year for some reason, 
#but using the check.names = FALSE argument fixed this so that the column names were read in as I wanted them to be.

CO2 <- read.csv("CO2_emissions-CDIAC.csv", header = TRUE, check.names = FALSE, na="NA")
head(CO2)
str(CO2)

##Basic Data Cleaning

#Some basic data cleaning was needed, since I was using a different data set from what we've seen in class.

#As we can see from taking a quick look at the data, each year currently is it's own variable - I wanted to reshape the data so that year is it's own variable.

library(tidyr)
library(tidyverse)
CO2_a <- CO2 %>% 
gather(key = "Year", value = "CO2_emission_per_capita", `1751`:`2012`) %>% 
arrange(Country)
str(CO2_a)


#This is good, but I also want year to be numeric, not character.


CO2_a$Year <- as.numeric(CO2_a$Year)
str(CO2_a)


#The other issue I have with this data is that there are not many countries that have data since 1751, when the data set begins. There seems to be fairly complete data since the 90s, so I decided to drop all year before 1990 and any countries that don't have data since then.

CO2_b <- CO2_a %>% 
  filter(Year == 1990:2012) %>% 
  filter(CO2_emission_per_capita > 0) %>% 
  arrange(Country)
head(CO2_b)
str(CO2_b)


#So for the final cleaned data set, we end up with 141 countries with data on CO2 emissions per capita for every year since 1990 until 2010.

##Perform Exploratory Analyses

#Now on to some data exploration.

library(tidyverse)
p1_CO2_time_series_plot <- CO2_b %>%
  ggplot(aes(x=Year, y=CO2_emission_per_capita, group=Country)) +
  geom_line(alpha=0.1) +
  scale_y_continuous(name="CO2 emissions per capita") +
  ggtitle("CO2 Emissions per Capita from 1990 to 2012")+
  theme_bw()
p1_CO2_time_series_plot

#Perhaps we are interested in how Canada fits into this plot:
  
p2_CO2_time_series_plot_Canada <- CO2_b %>%
  ggplot(aes(x=Year, y=CO2_emission_per_capita, group=Country)) +
  geom_line(alpha=0.1) +
  scale_y_continuous(name="CO2 emissions per capita") +
  ggtitle("CO2 Emissions per Capita from 1990 to 2012: Canada")+
  theme_bw()+
  geom_line(aes(x=Year, y=CO2_emission_per_capita, colour=Country), data=subset(CO2_b, Country == "Canada"))
p2_CO2_time_series_plot_Canada

#Or maybe we want to highlight the country with the highest CO2 emissions.

maxCO2 <- CO2_b %>% 
  group_by(Country) %>% 
  summarize(maxCO2=max(CO2_emission_per_capita)) %>% 
  arrange(desc(maxCO2))
head(maxCO2)

#The country with the highest CO2 emissions is Qatar, and so we can highlight that line too in the time series plot.

p3_CO2_time_series_plot_Qatar_vs_Canada <- CO2_b %>%
  ggplot(aes(x=Year, y=CO2_emission_per_capita, group=Country)) +
  geom_line(alpha=0.1) +
  scale_y_continuous(name="CO2 emissions per capita") +
  ggtitle("CO2 Emissions per Capita from 1990 to 2012: Canada and Qatar")+
  theme_bw()+
  geom_line(aes(x=Year, y=CO2_emission_per_capita, colour=Country), data=subset(CO2_b, Country == "Qatar" | Country == "Canada"))
p3_CO2_time_series_plot_Qatar_vs_Canada

#Save the descriptive time series plots to file with highly informative names:
  
ggsave("hw07_timeseries-CO2emissions-vs-year.png", p1_CO2_time_series_plot)
ggsave("hw07_timeseries-CO2emissions-vs-year-Canada.png", p2_CO2_time_series_plot_Canada)
ggsave("hw07_timeseries-CO2emissions-vs-year-Canada-Qatar.png", p3_CO2_time_series_plot_Qatar_vs_Canada)

#Save the CO2_b data to file for immediate and future reuse.

write_csv(CO2_b, "CO2_b.csv")
saveRDS(CO2_b,"CO2_b.rds")



