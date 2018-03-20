#' Expect coordinate reference systems
#'
#' @import testthat
#' @importFrom glue glue
#' @importFrom sf st_crs
#' @importFrom rlang enquo
#'
#' @inheritParams expect_geometry
#' @param epsg A character for EPSG codes
#' @param proj4string A character string of projection arguments
#'
#' @name expect_crs
#' @examples
#' sfc <- sf::st_sfc(sf::st_point(c(0, 0)),
#' sf::st_point(c(1, 1)))
#' sf <- sf::st_sf(a = 1:2, geom = sfc)
#' sf::st_crs(sf) <- 4326
#' expect_crs(sf, 4326)
#' expect_crs(sf, proj4string = "+proj=longlat +datum=WGS84 +no_defs")
NULL

#' @name expect_crs
#' @export
expect_crs <- function(object,
                       epsg = NULL,
                       proj4string = NULL) {
  act <- testthat::quasi_label(rlang::enquo(object))

  act$types <- as.character(sf::st_crs(act$val))

  if (is.null(proj4string)) {
    testthat::expect(
      act$types[1] == epsg,
      glue::glue(
        "{x}, EPSG projection code is {y}, not {z}.",
        x = act$lab,
        y = act$types[1],
        z = epsg
      )
    )
  }

  if (is.null(epsg)) {
    testthat::expect(
      act$types[2] == proj4string,
      glue::glue(
        "{x}, EPSG projection string is {y}, not {z}.",
        x = act$lab,
        y = act$types[2],
        z = proj4string
      )
    )
  }

  invisible(act$val)

}
