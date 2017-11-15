##Third script: read the output of the second script, generate some output, and save them to files.

##Perform Statistical Analyses

#Import the data created in the last script:
  
download.file("https://raw.githubusercontent.com/vmichalowski/STAT545-hw-Michalowski-Victoria/master/hw07%20-%20automating%20pipelines/CO2_b.csv", destfile="CO2_b.csv")

#Fit a linear regression of CO2 emissions per capita on year within each country.

CO2_b <- read.csv("CO2_b.csv", header = TRUE, check.names = FALSE, na="NA")
head(CO2_b)

library(tidyverse)
library(broom)

CO2_nested <- CO2_b %>%
  group_by(Country) %>% 
  nest()

CO2_vs_yr <- function (df) {
  lm(CO2_emission_per_capita ~ I(Year), data = df)
}

CO2_coefs <- CO2_nested %>% 
  mutate(fit = map(data, CO2_vs_yr),
         tidy = map(fit, tidy)) %>% 
  select(Country, tidy) %>% 
  unnest(tidy)

(CO2_coefs <- CO2_coefs %>%
    mutate(term = recode(term,
                         `(intercept)` = "intercept",
                         `I(Year)` = "slope")))

head(CO2_coefs)

#Write the table of results to file.

write_csv(CO2_coefs, "CO2_coefs.csv")
saveRDS(CO2_coefs,"CO2_coefs.rds")


#Following up on the data exploration done in the last script, I pulled out Canada and Qatar from this analyses.

CO2_ests <- CO2_coefs %>% 
  select(Country:estimate) %>% 
  filter(Country == "Qatar" | Country == "Canada") %>% 
  spread(key = term, value = estimate)
CO2_ests

##Generate Figures

#Next, I wanted to create a figure for each of Canada and Qatar, and write one file for each of these countries, with an informative name. I wanted the figures to be scatterplots of CO2 emission versus year, with a fitted line overlaid.

p4_scatterplot_CO2_vs_year_Canada <- CO2_b %>% 
  filter(Country == "Canada") %>% 
  ggplot(aes(x = Year, y = CO2_emission_per_capita)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = TRUE) +
  scale_y_continuous(name="CO2 emissions per capita") +
  ggtitle("CO2 Emissions per Capita vs Year: Canada") +
  theme_bw()
p4_scatterplot_CO2_vs_year_Canada

p5_scatterplot_CO2_vs_year_Qatar <- CO2_b %>% 
  filter(Country == "Qatar") %>% 
  ggplot(aes(x = Year, y = CO2_emission_per_capita)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = TRUE) +
  scale_y_continuous(name="CO2 emissions per capita") +
  ggtitle("CO2 Emissions per Capita vs Year: Qatar") +
  theme_bw()
p5_scatterplot_CO2_vs_year_Qatar

ggsave("hw07_scatterplot-CO2emissions-vs-year-Canada.png", p4_scatterplot_CO2_vs_year_Canada)
ggsave("hw07_scatterplot-CO2emissions-vs-year-Qatar.png", p5_scatterplot_CO2_vs_year_Qatar)