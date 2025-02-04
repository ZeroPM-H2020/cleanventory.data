# Setting up a temporary path and defining the URL from the official website:
# http://hcis.safeworkaustralia.gov.au/HazardousChemical

tmp <- tempdir()

url <- paste(
  "http://hcis.safeworkaustralia.gov.au/HazardousChemical/DownloadExcel2007",
  "SearchBy=Name&results=30&sortBy=Name&orderBy=MR&isAdvancedSearch=false",
  sep = "?"
)

# Downloading the XLSX file to the temporary location

options(timeout = max(300, getOption("timeout")))

download.file(
  url = url,
  destfile = paste("data-raw/data", "HCResults.xlsx", sep = "/"),
  quiet = TRUE,
  mode = ifelse(.Platform$OS.type == "windows", "wb", "w")
)

# Read-in the HCIS XLSX in "cleanventory" format

au_hcis <- cleanventory::read_au_hcis(
  path = paste("data-raw/data", "HCResults.xlsx", sep = "/"),
  clean_non_ascii = TRUE
)

# Export the data as RDA

save(au_hcis, file = "data/au_hcis.rda")
tools::resaveRdaFiles(paths = "data/au_hcis.rda")
