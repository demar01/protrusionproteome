data("evidence.raw")
evidencedata <- evidence.raw
test_that("plot_labelingefficiency throws error without valid input", {
  expect_error(plot_labelingefficiency("evidencedata"))
})

test_that("plot_labelingefficiency returns a ggplot object", {
  expect_true(is.ggplot(plot_labelingefficiency(evidencedata)))
})
