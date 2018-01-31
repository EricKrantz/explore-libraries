#' Which libraries does R search for packages?

mylibs <- .libPaths()

#' Installed packages

## use installed.packages() to get all installed packages
pacs <- as.data.frame(installed.packages())

     #  or  #

pacs <- installed.packages() %>% 
  as.tibble()

## how many packages?
npacs <- nrow(pacs)
npacs

#' Exploring the packages

## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
with(pacs, table(LibPath))
table(pacs$LibPath)
table(pacs$Priority, pacs$LibPath)
table(pacs$LibPath, pacs$Priority)

table(pacs$Priority)

##   * what proportion need compilation?
table(pacs$NeedsCompilation)[2] / (table(pacs$NeedsCompilation)[2] + table(pacs$NeedsCompilation)[1])

##   * how break down re: version of R they were built on
table(pacs$Version)


#' Reflections

## reflect on ^^ and make a few notes to yourself; inspiration
##   * does the number of base + recommended packages make sense to you?
##   * how does the result of .libPaths() relate to the result of .Library?
.Library
.libPaths()

chunk1 <- .Library

library(fs)
chunk2 <- path_real(.Library)

chunk1 == chunk2

#' Going further

## if you have time to do more ...

## is every package in .Library either base or recommended?

    # No, there is one package that is neither:
pacs %>%
  filter(LibPath == "C:/Program Files/R/R-3.4.3/library") %>% 
  select(Package, Priority)

## study package naming style (all lower case, contains '.', etc
## use `fields` argument to installed.packages() to get more info and use it!


