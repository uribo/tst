
<!-- README.md is generated from README.Rmd. Please edit that file -->
tst
===

[![CRAN status](https://www.r-pkg.org/badges/version/tst)](https://cran.r-project.org/package=tst) [![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental) [![Travis build status](https://travis-ci.org/uribo/tst.svg?branch=master)](https://travis-ci.org/uribo/tst) [![Coverage status](https://codecov.io/gh/uribo/tst/branch/master/graph/badge.svg)](https://codecov.io/github/uribo/tst?branch=master) [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/uribo/tst?branch=master&svg=true)](https://ci.appveyor.com/project/uribo/tst)

------------------------------------------------------------------------

The goal of **tst** is geo-spatial data testing using the 'testthat' package frameworks. Geo Spatial Data tests including CRS, geometry types, spetial relatons and units correctly.

Installation
------------

You can install the develop version of tst from [GitHub](https://github.com) with:

``` r
# install.packages("remotes")
remotes::install_github("uribo/tst")
```

Example
-------

``` r
library(sf)
#> Linking to GEOS 3.6.1, GDAL 2.1.3, proj.4 4.9.3
library(tst)

x <- st_point(c(0, 0))
expect_geom_type(x, "POINT") # TRUE
```

``` r
expect_geom_type(x, "POLYGON") # FALSE
```

Code of Conduct
---------------

Please note that this project is released with a [Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
