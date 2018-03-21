#' Expect geometry type
#'
#' @details
#'
#' * `expect_geom_type()`: test with which geometry type
#' * `expect_dimention()`: test with N's spatial dimension of geometry. Expect values are 0 for points,
#' 1 for lines, 2 for planar.
#'
#' @import sf
#' @import testthat
#' @importFrom rlang enquo
#'
#' @param object object of class \code{\link[sf]{sf}} or \code{\link[sf]{sfc}}
#' @param type test equality geometry type (`character`)
#' @param value expected value
#'
#' @name expect_geometry
#' @examples
#' library(sf)
#' x <- st_point(c(0, 0))
#' expect_geom_type(x, "POINT")
NULL

#' @rdname expect_geometry
#' @export
expect_geom_type <- function(object,
                             type = c(
                               "POINT", "LINESTRING", "POLYGON",
                               "MULTIPOINT", "MULTISTRING", "MULTIPOLYGON",
                               "GEOMETRYCOLLECTION"
                             )) {
  type <- match.arg(type)
  act <- testthat::quasi_label(rlang::enquo(object))

  act$type <- as.character(sf::st_geometry_type(act$val))
  testthat::expect(
    act$type == type,
    glue::glue(
      "{x}, geometry type is {y}, not {z}.",
      x = act$lab,
      y = act$type,
      z = type
    )
  )

  invisible(act$val)
}

#' @rdname expect_geometry
#' @export
expect_dimension <- function(object, value) {
  act <- testthat::quasi_label(rlang::enquo(object))

  act$value <- as.character(sf::st_dimension(act$val))
  testthat::expect(
    act$value == value,
    glue::glue(
      "{x}, dimension of geometry is {y}, not {z}.",
      x = act$lab,
      y = act$value,
      z = value
    )
  )

  invisible(act$val)
}
