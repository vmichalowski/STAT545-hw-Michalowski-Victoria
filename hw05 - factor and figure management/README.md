Here is my [homework 5 md file](https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/blob/master/hw05/hw05.md).

PROCESS REPORT

FACTOR MANAGEMENT: This was not too difficult, except I found that at the end, I had ended up with a continent factor that looked right, but it seemed strange that it was seperated from the rest of the data. I'm not sure if I did this wrong or not, but I had a hard time understanding why I would ever need to seperate a factor from the rest of the data. Perhaps for plotting purposes?

FILE I/O: I had a problem with read_csv, where I found that when I tried to read the data back in, it would change the discrete variables (country and contitnent) from factor to character. I feel like the conversion to character would lead to issues with analysis down the line, so I chose to go with the read.csv function for the reason that it preserved those variables as factors.

VISUALIZATION DESIGN: My biggest frustration here was that I had figured out how to superimpose the mean life expectancy points over top of the rest of the data points for each country, but I couldn't figure out how to add these points to the legend. I also am not completely satisfied with the break points for the legend. The problem is that the values listed are not even measurement points - there is no year 2000 in the gapminder data. I tried playing with the "breaks" function, but I couldn't seem to get my code to run with it.
