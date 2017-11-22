DESCRIPTION OF MY APP.

The app explores baby name popularity in British Columbia from 1915 until 2014. Users are able to select any name that has been registered in the past century, and view it's frequency across a custom range of years in graphical or tabular form.

Here is a link to [the app](https://vmichalowski.shinyapps.io/baby_names_app/).

PROCESS REPORT.

For this assignment, I wanted to try using a different data set than the one we explored in class. I looked into what other public data Birtish Columbia has available on their data catalogue, and found data on baby names over the past 100 years for [girls](https://catalogue.data.gov.bc.ca/dataset/most-popular-girl-names-for-the-past-100-years) and [boys](https://catalogue.data.gov.bc.ca/dataset/most-popular-boys-names-for-the-past-100-years). The BC Ministry of Health already actually has an interactive plot for baby names on their [website](https://www.health.gov.bc.ca/vs//babynames/), so I wanted to see if I could use what we learned in class to reproduce and potentially even improve on it... probably a little too ambitious as I discovered.

Because I was using a new data set, there was some cleaning required as a first step. I created a [md. file](https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/blob/master/hw08%20-%20building%20shiny%20apps/hw08.md) to document my data cleaning procedures.

For creating the actual app, I created seperate ui and server files. Links to: my [ui code](https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/blob/master/hw08%20-%20building%20shiny%20apps/ui%20and%20server%20folder/ui.R) and [server code](https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/blob/master/hw08%20-%20building%20shiny%20apps/ui%20and%20server%20folder/server.R).

Building on class notes, I incorporated several new elements:

- Added an input for sex, so that the name options in the drop down menu are for either boy or girl names, depending on what the user selected. This one probably took me the longest time to figure out, because I'm so used to using the dyplr function filter(), that I didn't realize there was a base function called subset() that could easily be incorporated into the example code. I then used if/return to specify when each subset of names should be displayed in the drop down menu.
- Used tabsetPanel() to create seperate tabs for the graph and data table. No real challenges here, except I feel like the graph is smaller than I'd like it to be. I wasn't sure how to change this, as when looking at the documentation for this function, I didn't find anything about specifying dimensions.
- Used DT::dataTableOutput() to make an interactive table. Also no real issues here.

I attempted a couple other features, but without success (any ideas for what I might have been doing wrong would be greatly appreciated):

- Provide a way for users to show results from multiple names. I followed the suggestions to use checkboxGroupInput() or selectInput() with multiple = TRUE, but this seemed to cause problems with running the app. I didn't make any changes in my server, so perhaps something there was the problem.
- Add an image. As in class, I simply got a square box with a question mark when I attempted this one. I tried img(src = "myimage.jgp", width = "100%").

And something that was weird (and maybe had something to do with how my code was organized) was that the results in my app would get cut off at 2010 (even though the year range is supposed to go up to 2014) when I didn't have download.file() before I read in my data with read.csv() in the server file. Not sure why that was happening.

