This is my [homework 4 md file]().

PROCESS

The biggest issue I had with the WHO data was that it included confidence intervals, in addition to the % of insufficiently people in each country, in each cell. So I manually went through and deleted the brackets. This would clearly not be a viable solution for larger data sets though. Any ideas for how to deal with this better in the future would be greatly appreciated.

I have a better handle on ggplot by now, but I had never used the geom_text function before, and it was a little tricky to figure out how to position the text above the points. I also wanted each year to have it's own colour, which goes along with discrete variables. However, year is a continuous variable in the gapminder data, so when colouring by year, the colours came out as a gradient. So to achieve discrete colouring, my solution was to transform the year variable into a discrete variable for the purposes of the graph.

Figuring out the discrepancies between join(), merge(), and match() also took some thought, but what I found to be the best way to go about figuring out what the differences were with the functions was to try them and see what they did to the data. From there, I could make guesses and sort of "prove" these guesses to myself to understand what it was that each function did. There are likely more straightforward ways, but I found that this experimenting helped me understand the function better.

