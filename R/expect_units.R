#' Expect a units
#'
#' @import testthat
#' @importFrom glue glue
#' @importFrom units deparse_unit
#' @importFrom rlang enquo
#'
#' @param object object of class units
#' @param units expect units name
#'
#' @name expect_units
#' @examples
#' library(units)
#' x <- as_units(1, "m")
#' expect_units(x, "m")
#'
#' expect_units(set_units(x, "km"), "km")
NULL

#' @name expect_units
#' @export
expect_units <- function(object, units = NULL) {
  act <- testthat::quasi_label(rlang::enquo(object))

  act$types <- units::deparse_unit(act$val)

  testthat::expect(
    act$types[1] == units,
    glue::glue(
      "{x}, units is {y}, not {z}.",
      x = act$lab,
      y = act$types,
      z = units
    )
  )

  invisible(act$val)

}
