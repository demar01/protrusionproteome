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

allpeptides<- system.file(
  "extdata",
  "allPeptides_identified.txt",
  package = "protrusionproteome"
)

allpeptides.raw <- read.delim(allpeptides,stringsAsFactors = FALSE) %>%
  janitor::clean_names()
evidence.raw <- read.delim(evidencefile,stringsAsFactors = FALSE)
#evidence.raw<-evidence.raw %>% select(1:5)
usethis::use_data(evidence.raw, overwrite = TRUE)
usethis::use_data(allpeptides.raw, overwrite = TRUE)


