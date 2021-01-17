data("prot.raw")
library(enrichR)
library(SummarizedExperiment)
nrows <- 6; ncols <- 6
counts <- matrix(runif(nrows * ncols, 1, 1e4), nrows)
row.names(counts)<-c( "RBM47" ,    "TTC26"  ,   "UBA6"  ,    "ESYT2"    , "UHRF1BP1L" ,"KIAA1598" )
colData <- DataFrame(Treatment=rep(c("genes", "Input"), 3),
                     row.names=LETTERS[1:6])
se0 <- SummarizedExperiment(assays=SimpleList(counts=counts),
                            colData=colData)
dbs = "GO_Molecular_Function_2018"


test_that("enrich_1D throws error without valid input", {
  expect_error(enrich_1D("prot.raw",1,"GO_Molecular_Function_2018", 1))
  expect_error(enrich_1D(prot.raw,"1","GO_Molecular_Function_2018", 1))
  expect_error(enrich_1D(prot.raw,1,GO_Molecular_Function_2018, 1))
  expect_error(enrich_1D(prot.raw,1,"GO_Molecular_Function_2018", "1"))
})

libraries<-enrichR::listEnrichrDbs()$libraryName
test_that("enrich_1D searches for annotation libraries", {
  expect_type(libraries, "character")
  expect_true(is.character(enrichR::listEnrichrDbs()$libraryName ))
  expect_equal(libraries,enrichR::listEnrichrDbs()$libraryName )
})


test_that("enrich_1D returns a data.frame", {
  df<-as.data.frame(assay(se0))
  expect_s3_class(df, "data.frame")
  expect_s3_class(data.frame(rownames(df),df[,1]), "data.frame")
  expect_s3_class(enrich_1D(se0,1,"GO_Molecular_Function_2018", 1), "data.frame")
})
