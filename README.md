# diffindiff

<!-- badges: start -->
<!-- badges: end -->

The goal of diffindiff is to provide a simple function to run difference-in-differences estimation,
as described in Card and Krueger (1994). This package also contains the data from their paper.

## Installation

NOT (YET) ON CRAN!!!!

You can install the released version of diffindiff from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("diffindiff")
```

You can install it from Github:

``` r
remotes::install_github("b-rodrigues/diffindiff")
```


## Example

Re-creating Figure 1 from Card and Krueger (1994):

``` r
library(diffindiff)
library(tidyverse)

ggplot(dataset, aes(wage_st)) + geom_density(aes(fill = state), alpha = 0.3) +
 facet_wrap(vars(observation)) + theme_blog() +
 theme(legend.title = element_blank(), plot.caption = element_text(colour = "white")) +
 labs(title = "Distribution of starting wage rates in fast food restaurants",
 caption = "On April 1st, 1992, New Jersey's minimum wage rose from $4.25 to $5.05. Source: Card and Krueger (1994)")
```

