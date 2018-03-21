#' Expect geometry type
#'
#' @details
#'
#' * `expect_geom_type()`: test with which geometry type. See also \code{\link[sf]{st_geometry_type}}.
#' * `expect_dimention()`: test with N's spatial dimension of geometry. Expect values are 0 for points,
#' 1 for lines, 2 for planar and NA for empty. See \code{\link[sf]{st_dimension}} to more details.
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
#'
#' expect_dimension(x, 0) # For point
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

  if (sf::st_is_valid(act$val)) {
    act$value <- as.character(sf::st_dimension(act$val))
    act

    if (is.na(act$value)) {
      testthat::expect(
        identical(act$value,
                  NA_character_),
        glue::glue(
          "{x}, dimension of geometry is {y}, not {z}.",
          x = act$lab,
          y = act$value,
          z = NA_character_
        )
      )
    } else {
      testthat::expect(
        act$value == value,
        glue::glue(
          "{x}, dimension of geometry is {y}, not {z}.",
          x = act$lab,
          y = act$value,
          z = value
        )
      )

    }

  } else {
    rlang::abort("object not match simple feature geometries")
  }
}
