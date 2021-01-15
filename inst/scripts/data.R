protfile<- system.file(
  "extdata",
  "proteinGroups.txt",
  package = "protrusionproteome"
)
prot.raw <- read.delim(protfile,stringsAsFactors = FALSE)
usethis::use_data(prot.raw, overwrite = TRUE)


peptidesfile<- system.file(
  "extdata",
  "peptides.txt",
  package = "protrusionproteome"
)
peptides.raw <- read.delim(peptidesfile,stringsAsFactors = FALSE)
peptides.raw<- peptides.raw %>% select(1:6, 30:35)
usethis::use_data(peptides.raw, overwrite = TRUE)

evidencefile<- system.file(
  "extdata",
  "evidence.txt",
  package = "protrusionproteome"
)
evidence.raw <- read.delim(evidencefile,stringsAsFactors = FALSE)
#evidence.raw<-evidence.raw %>% select(1:5)
usethis::use_data(evidence.raw, overwrite = TRUE)
