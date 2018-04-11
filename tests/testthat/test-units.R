context("test-units.R")

x <- structure(1,
               units = structure(
                 list(numerator = "m", denominator = character(0)),
                 .Names = c("numerator",
                            "denominator"),
                 class = "symbolic_units"
               ),
               class = "units")

test_that("Allow input units object", {
  expect_silent(expect_units(x, "m"))
  expect_silent(expect_units(units::set_units(x, "km"), "km"))
})
