#' Expect geometry type
#'
#' @import sf
#' @import testthat
#' @importFrom rlang enquo
#'
#' @param object object of class \code{\link[sf]{sf}} or \code{\link[sf]{sfc}}
#' @param type test equality geometry type (`character`)
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
