context("test-geometry.R")

sf_point <- st_point(c(0, 0))
sf_line <- st_linestring(matrix(1:12, ncol = 3))

test_that("geom-type", {
  expect_silent(expect_geom_type(sf_point, type = "POINT"))
  expect_error(expect_geom_type(sf_point, type = "LINESTRING"))
  expect_error(expect_geom_type(sf_point, type = "LINE"))
  expect_silent(expect_geom_type(c(sf::st_point(1:2), sf::st_point(5:6)),
                                 "MULTIPOINT"))
  expect_silent(expect_geom_type(sf::st_polygon(list(
    rbind(c(0, 0), c(1, 0), c(1, 1), c(0, 1), c(0, 0))
  )), # nolint
  "POLYGON"))
  expect_silent(expect_geom_type(sf_line,
                                 "LINESTRING"))
})

test_that("dimension", {
  expect_silent(expect_dimension(sf_point, 0))
  expect_silent(expect_dimension(sf_point, "0"))
  expect_silent(expect_dimension(sf_line,
                                 1))
})
