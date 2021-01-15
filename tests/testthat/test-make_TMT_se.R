

data("prot.raw")
data <- prot.raw
library(stringr)
data <- data[data$Reverse != "+" & data$Potential.contaminant != "+" &
               data$Reverse != "+" ,]
columns_positions<-str_which(colnames(data),
                             "Reporter.intensity.corrected.(\\d)+.(\\d)")
intensities <- colnames(data)[str_which(colnames(data),
                                               "Reporter.intensity.corrected.(\\d)+.(\\d)")]
data_unique <- make_unique(data, "Gene.names", "Protein.IDs", delim = ";")


test_that("make_TMT_se throws error without valid input", {
  expect_error(make_TMT_se("data_unique",columns_positions,intensities,time_unit=30,time_span=c(1,2,4,8,16), numerator= "prot",denominator= "body", sep = "_"))
  expect_error(make_TMT_se(data_unique,"columns_positions",intensities,time_unit=30,time_span=c(1,2,4,8,16), numerator= "prot",denominator= "body", sep = "_"))
  expect_error(make_TMT_se(data_unique,columns_positions,intensities,time_unit="30",time_span=c(1,2,4,8,16), numerator= "prot",denominator= "body", sep = "_"))
  expect_error(make_TMT_se(data_unique,columns_positions,intensities,time_unit=30,time_span="2", numerator= "prot",denominator= "body", sep = "_"))
  expect_error(make_TMT_se(data_unique,columns_positions,intensities,time_unit=30,time_span=c(1,2,4,8,16), numerator= prot,denominator= "body", sep = "_"))
  expect_error(make_TMT_se(data_unique,columns_positions,intensities,time_unit=30,time_span=c(1,2,4,8,16), numerator= "prot",denominator= body, sep = "_"))
  })


