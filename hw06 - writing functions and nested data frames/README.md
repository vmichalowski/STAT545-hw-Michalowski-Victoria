Here's a link to my [homework 6 md file](https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/blob/master/hw06%20-%20writing%20functions%20and%20nested%20data%20frames/hw06.md).

PROCESS REPORT

For this homework, the biggest challenge I had was figuring out if I was incorporating a quadratic term correctly into the code. I wanted to use a reparametertized year term, such that in the regression equation Y ~ X, my equation was Y ~ I(X - 1952). However, I wasn't sure how to square this to make the quadratic term: Y ~ I(X^2 - 1952)? Y ~ I(X - 1952^2)? Y ~ I(X - 1952)^2? In the end, I thought it made the most sense to go with Y ~ I((X - 1952)^2), but I'm still not totally sure if this was correct.

Perhaps from my decision to do this, I ran into a couple issues that seemed strange to me. One was the when I ran my code in R studio, the output would actually be different than how it showed up when it was knitted and showed up in the preview window of how it would look in github. More specifically, what happened was that when I tried to explore the nested coefficients in task 6, using the code:

(gap_coefs <- gap_coefs %>%
   mutate(term = recode(term,
                        `(Intercept)` = "intercept",
                        `I(year - 1952)` = "slope",
                        `I((year - 1952)^2)` = "slope2")))
                        
What would happen is that my intercepts would look unreasonably small (around 2 for Afghanistain for instance) in my r studio output, and then as expected (around 28 this time) in the output shown on github. So I'm not sure why that happened.

I also ran into a warning message in the output on my console when I knitted the rmd file: 

Warning messages:
1: Unknown column 'fit' 
2: Unknown column 'fit' 

So perhaps something was going on with my nested data, but I was never able to figure out exactly what the issue was.


