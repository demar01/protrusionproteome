
data("prot.raw")
data <- prot.raw
library(stringr)
data_unique <- make_unique(data, "Gene.names", "Protein.IDs", delim = ";")
intensities <- colnames(data_unique)[str_which(colnames(data_unique),"Reporter.intensity.corrected.(\\d)+.(\\d)")]
columns_positions<-str_which(colnames(data_unique),"Reporter.intensity.corrected.(\\d)+.(\\d)")

se <- make_TMT_se(data_unique,columns_positions,
                  intensities,time_unit=30,
                  time_span=c(1,2,4,8,16), numerator= "prot", denominator= "body", sep = "_")
test_that("plot_scatter throws error without valid input", {
  expect_error(plot_scatter("se", 1, 2, "HIST", 'orange', 4, 4))
  expect_error(plot_scatter(se, "1", 2, "HIST", 'orange', 4, 4))
  expect_error(plot_scatter(se, 1, 2, HIST, 'orange', 4, 4))
  expect_error(plot_scatter(se, 1, 2, "HIST", orange, 4, 4))
  expect_error(plot_scatter(se, "1", 2, "HIST", 'orange', 4, 4))
  expect_error(plot_scatter(se, 1, 2, "HIST", 'orange', "4", 4))
  expect_error(plot_scatter(se, 1, 2, "HIST", 'orange', 4, '4'))
})

test_that("plot_scatter returns a ggplot object", {
  expect_true(is.ggplot(plot_scatter(se, 1, 2, "HIST", 'orange', 4, 4)))
})

