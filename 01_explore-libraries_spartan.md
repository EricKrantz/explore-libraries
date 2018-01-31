01\_explore-libraries\_spartan.R
================
Eric.Krantz
Wed Jan 31 14:06:49 2018

Which libraries does R search for packages?

``` r
library(tidyverse)
```

    ## -- Attaching packages ----------------------------------------------- tidyverse 1.2.1 --

    ## v ggplot2 2.2.1     v purrr   0.2.4
    ## v tibble  1.4.2     v dplyr   0.7.4
    ## v tidyr   0.7.2     v stringr 1.2.0
    ## v readr   1.1.1     v forcats 0.2.0

    ## -- Conflicts -------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
mylibs <- .libPaths()
```

Installed packages

``` r
## use installed.packages() to get all installed packages
pacs <- as.data.frame(installed.packages())

     #  or  #

pacs <- installed.packages() %>% 
  as.tibble()

## how many packages?
npacs <- nrow(pacs)
npacs
```

    ## [1] 239

Exploring the packages

``` r
## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
with(pacs, table(LibPath))
```

    ## LibPath
    ## C:/Program Files/R/R-3.4.3/library                       C:/R/Library 
    ##                                 30                                209

``` r
table(pacs$LibPath)
```

    ## 
    ## C:/Program Files/R/R-3.4.3/library                       C:/R/Library 
    ##                                 30                                209

``` r
table(pacs$Priority, pacs$LibPath)
```

    ##              
    ##               C:/Program Files/R/R-3.4.3/library C:/R/Library
    ##   base                                        14            0
    ##   recommended                                 15            0

``` r
table(pacs$LibPath, pacs$Priority)
```

    ##                                     
    ##                                      base recommended
    ##   C:/Program Files/R/R-3.4.3/library   14          15
    ##   C:/R/Library                          0           0

``` r
table(pacs$Priority)
```

    ## 
    ##        base recommended 
    ##          14          15

``` r
##   * what proportion need compilation?
table(pacs$NeedsCompilation)[2] / (table(pacs$NeedsCompilation)[2] + table(pacs$NeedsCompilation)[1])
```

    ##       yes 
    ## 0.4759825

``` r
##   * how break down re: version of R they were built on
table(pacs$Version)
```

    ## 
    ##      0.0.2        0.1      0.1-1      0.1-2      0.1-3    0.1-5.1 
    ##          1          3          1          1          1          1 
    ##      0.1.0 0.1.0.9000      0.1.1      0.1.2      0.1.6      0.1.7 
    ##          1          1          1          1          3          1 
    ##     0.10-1    0.10-42     0.10.1    0.12.15     0.15.3     0.19-1 
    ##          1          1          1          1          1          1 
    ##     0.19.0        0.2     0.2-15      0.2.0      0.2.1      0.2.2 
    ##          1          1          1          4          3          1 
    ##      0.2.3      0.2.4    0.20-35     0.20.6     0.21.0       0.22 
    ##          1          1          1          1          1          1 
    ##     0.23-3        0.3      0.3-1      0.3-2      0.3-6      0.3.0 
    ##          1          1          1          1          1          2 
    ##      0.3.2  0.3.3.3.1      0.3.6        0.4      0.4-1     0.4-12 
    ##          1          1          1          1          1          1 
    ##      0.4-7      0.4.0      0.4.1      0.4.2      0.4.3    0.4.8-1 
    ##          2          1          3          1          2          1 
    ##        0.5   0.5-13.1      0.5.0        0.6      0.6-2     0.6-28 
    ##          2          1          1          1          1          1 
    ##      0.6-6     0.6.14        0.7      0.7-0      0.7.2      0.7.4 
    ##          1          1          2          1          1          1 
    ##        0.8      0.8-4     0.8-69      0.8.5     0.9-35      0.9-9 
    ##          1          2          1          1          1          1 
    ##      0.9.0      0.9.2      0.9.9     0.99.9        1.0      1.0-0 
    ##          1          1          1          1          2          1 
    ##      1.0-2      1.0-3      1.0-4      1.0-5      1.0-6      1.0-7 
    ##          1          1          1          1          2          2 
    ##      1.0-8      1.0.0      1.0.1     1.0.11      1.0.4      1.0.5 
    ##          1          8          2          1          1          1 
    ##      1.0.9      1.1-1     1.1-16      1.1-2      1.1.0      1.1.1 
    ##          1          1          1          1          5          4 
    ##    1.1.1.4      1.1.2      1.1.3      1.1.6   1.10.4-3     1.11.2 
    ##          1          2          1          1          1          1 
    ##     1.13.4     1.17.1       1.19      1.2-1     1.2-11     1.2-12 
    ##          1          1          1          1          1          1 
    ##      1.2-2      1.2.0      1.2.1      1.2.4     1.21.0       1.22 
    ##          1          6          1          2          1          1 
    ##      1.3-0      1.3-2     1.3-20      1.3.0      1.3.1      1.3.4 
    ##          1          2          1          1          1          1 
    ##      1.3.5      1.4-4      1.4-5      1.4-8      1.4.1      1.4.2 
    ##          1          1          1          1          2          1 
    ##      1.4.3      1.4.4        1.5      1.5-5      1.5-8      1.6-8 
    ##          1          1          3          2          1          1 
    ##   1.65.0-1      1.7.1      1.7.8       1.77        1.8      1.8-1 
    ##          1          2          1          1          1          1 
    ##      1.8-2     1.8-22      1.8.4      1.8.5      1.9-3        2.0 
    ##          1          1          1          1          1          1 
    ##      2.0-0      2.0-7      2.0.0      2.0.1      2.0.3      2.0.6 
    ##          1          1          1          2          1          1 
    ##      2.1-6      2.1.1     2.1.16      2.2.1      2.2.2    2.23-15 
    ##          1          1          1          1          1          1 
    ##        2.3      2.3.2      2.4-0     2.41-3        2.5      2.6.0 
    ##          1          1          1          1          1          1 
    ##      2.6.1        3.0      3.0-0        3.1    3.1-131      3.1-9 
    ##          1          1          1          1          1          1 
    ##      3.2.0       3.33      3.4.3      3.6.1   3.98-1.9      4.0-0 
    ##          1          1         15          1          1          1 
    ##      4.1-1     4.1-11       5.34      6.0-0     7.3-11     7.3-12 
    ##          1          1          1          1          1          1 
    ##     7.3-14     7.3-47 
    ##          1          1

Reflections

``` r
## reflect on ^^ and make a few notes to yourself; inspiration
##   * does the number of base + recommended packages make sense to you?
##   * how does the result of .libPaths() relate to the result of .Library?
.Library
```

    ## [1] "C:/PROGRA~1/R/R-34~1.3/library"

``` r
.libPaths()
```

    ## [1] "C:/R/Library"                      
    ## [2] "C:/Program Files/R/R-3.4.3/library"

``` r
chunk1 <- .Library

library(fs)
chunk2 <- path_real(.Library)

chunk1 == chunk2
```

    ## [1] FALSE

Going further

``` r
## if you have time to do more ...

## is every package in .Library either base or recommended?

    # No, there is one package that is neither:
pacs %>%
  filter(LibPath == "C:/Program Files/R/R-3.4.3/library") %>% 
  select(Package, Priority)
```

    ## # A tibble: 30 x 2
    ##    Package   Priority   
    ##    <chr>     <chr>      
    ##  1 base      base       
    ##  2 boot      recommended
    ##  3 class     recommended
    ##  4 cluster   recommended
    ##  5 codetools recommended
    ##  6 compiler  base       
    ##  7 datasets  base       
    ##  8 foreign   recommended
    ##  9 graphics  base       
    ## 10 grDevices base       
    ## # ... with 20 more rows

``` r
## study package naming style (all lower case, contains '.', etc
## use `fields` argument to installed.packages() to get more info and use it!
```
