context("test-crs.R")

sfc <- sf::st_sfc(sf::st_point(c(0, 0)),
                  sf::st_point(c(1, 1)))
sf <- sf::st_sf(a = 1:2, geom = sfc)
sf::st_crs(sf) <- 4326

test_that("coordinate references systems", {
  expect_silent(expect_crs(sf, 4326))
  expect_silent(expect_crs(sf, "4326"))
  expect_silent(expect_crs(sf,
                           proj4string = "+proj=longlat +datum=WGS84 +no_defs"))
  expect_silent(expect_crs(sf::st_transform(sf, crs = 4612),
                           4612))
  expect_silent(
    expect_crs(
      sf::st_transform(sf, crs = 4612),
      epsg = NULL,
      proj4string = "+proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs"
    )
  )
  expect_silent(
    expect_crs(
      sf::st_transform(sf, crs = 4612),
      epsg = 4612,
      proj4string = "+proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs"
    )
  )
})
