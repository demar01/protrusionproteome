data("prot.raw")
data <- prot.raw
test_that("filter_MaxQuant throws error without valid input", {
  expect_error(filter_MaxQuant("data",  c("Reverse", "Potential.contaminant","Only.identified.by.site")))
  expect_error(filter_MaxQuant(data, Only.identified.by.site))
 })

test_that("filter_MaxQuant returns a data.frame", {
  expect_true(is.data.frame(filter_MaxQuant(data, c("Reverse", "Potential.contaminant","Only.identified.by.site"))))
})

test_that("filter_MaxQuant returns error if colnames to filter are incorrect", {
  expect_true(all(is.na(match("Only.identified.by.site", colnames(data))))!=TRUE)
})




