context("test-geometry.R")

x <- st_point(c(0, 0))

test_that("multiplication works", {
  expect_silent(
    expect_geom_type(x, type = "POINT")
  )

  expect_error(
    expect_geom_type(x, type = "LINESTRING")
  )

  expect_error(
    expect_geom_type(x, type = "LINE")
  )

  expect_silent(
    expect_geom_type(
      c(sf::st_point(1:2), sf::st_point(5:6)),
      "MULTIPOINT"
    )
  )
  expect_silent(
    expect_geom_type(
      sf::st_polygon(list(rbind(c(0, 0), c(1, 0), c(1, 1), c(0, 1), c(0, 0)))), # nolint
      "POLYGON"
    )
  )
})
