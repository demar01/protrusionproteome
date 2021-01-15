data("prot.raw")

test_that("make_unique throws error without valid input", {
  expect_error(make_unique("prot.raw", "Gene.names", "Protein.IDs"))
  expect_error(make_unique(prot.raw, "Gene.name", "Protein.IDs"))
  expect_error(make_unique(prot.raw, "Gene.names", "Protein.ID"))

 # expect error if neither names are valid
})

test_that("make_unique returns a data.frame", {
  expect_s3_class(make_unique(prot.raw, "Gene.names", "Protein.IDs"), "data.frame")
  expect_s3_class(make_unique(tibble::as_tibble(prot.raw), "Gene.names", "Protein.IDs"), "data.frame")
})

test_that("make_unique returns unique names", {
  expect_false(any(duplicated(make_unique(prot.raw, "Gene.names", "Protein.IDs")$name)))
})

