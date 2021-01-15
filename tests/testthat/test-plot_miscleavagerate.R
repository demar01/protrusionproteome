

data("peptides.raw")
pepdata <- peptides.raw
test_that("plot_miscleavagerate throws error without valid input", {
  expect_error(plot_miscleavagerate("pepdata"))
})
