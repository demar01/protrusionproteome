data("prot.raw")
library(enrichR)

dbs = "GO_Molecular_Function_2018"

test_that("enrich_1D throws error without valid input", {
  expect_error(enrich_1D("prot.raw",1,"GO_Molecular_Function_2018", 1))
  expect_error(enrich_1D(prot.raw,"1","GO_Molecular_Function_2018", 1))
  expect_error(enrich_1D(prot.raw,1,GO_Molecular_Function_2018, 1))
  expect_error(enrich_1D(prot.raw,1,"GO_Molecular_Function_2018", "1"))

  })

libraries<-enrichR::listEnrichrDbs()$libraryName
test_that("enrich_1D searches for annotation libraries", {
  expect_true(is.character(enrichR::listEnrichrDbs()$libraryName ))
  expect_equal(libraries,enrichR::listEnrichrDbs()$libraryName )

})


