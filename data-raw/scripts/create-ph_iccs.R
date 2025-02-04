# Setting up a temporary path and defining the URL from the official websites:
# https://chemical.emb.gov.ph/?page_id=138

url <- "http://chemical.emb.gov.ph/wp-content/uploads/2020/07/PICCS.2017.pdf"

# Downloading the PDFs to the temporary location

download.file(
  url = url,
  destfile = paste("data-raw/data", "PICCS.2017.pdf", sep = "/"),
  quiet = TRUE,
  mode = ifelse(.Platform$OS.type == "windows", "wb", "w")
)

# Read-in the TCSI PDFs in "cleanventory" format

ph_iccs <- cleanventory::read_ph_iccs(
  path = paste("data-raw/data", "PICCS.2017.pdf", sep = "/"),
  clean_non_ascii = TRUE
)

# Export the data as RDA

save(ph_iccs, file = "data/ph_iccs.rda")
tools::resaveRdaFiles(paths = "data/ph_iccs.rda")

## The two PDF files for the EMB MC 7 and 8 are unfortunately terribly
## mal-formatted for fully automated integration. Luckily the data sets are
## relatively small, so here is a literal copy-paste from the PDF files.

url_1 <- "https://chemical.emb.gov.ph/wp-content/uploads/2020/05/EMB-MC-2020-007.pdf"

url_2 <- "https://chemical.emb.gov.ph/wp-content/uploads/2021/05/EMB-MC-2021-08-2021PICCS.pdf"

download.file(
  url = url_1,
  destfile = paste("data-raw/data", "EMB-MC-2020-007.pdf", sep = "/"),
  quiet = TRUE,
  mode = ifelse(.Platform$OS.type == "windows", "wb", "w")
)

download.file(
  url = url_2,
  destfile = paste("data-raw/data", "EMB-MC-2021-08-2021PICCS.pdf", sep = "/"),
  quiet = TRUE,
  mode = ifelse(.Platform$OS.type == "windows", "wb", "w")
)

ph_emb_mc_07 <- data.frame(
  no = 1:31,
  cas_registry_no = c(
    "90028-31-2", "226708-41-4", "71714-29-9", "1465004-85-6",
    "1447721-00-7", "69029-86-3", "54116-08-4", "585-07-9", "7580-85-0",
    "62256-00-2", "1354201-99-2", "68609-68-7", "1001320-38-2",
    "39142-36-4", "53378-52-2", "86329-09-1", "2495-35-4", "300711-92-6",
    "1255680-66-0", "232938-43-1", "148324-78-1", "35674-65-8",
    "21944-98-9", "646-25-3", "155090-83-8", "39072-70-3", "9051-51-8",
    "25084-89-3", "690-39-1", "1314-61-0", "12060-00-3"
  ),
  notified_chemical_name = c(
    "Epilobium angustifolium Flower/ Leaf/ Stem extract",
    "Olive Oil Peg-7 Esters",
    "Cellulose, ethyl 2-hydroxyethyl methyl ether",
    "Cyclopentanol, 1-ethyl-2-(3-methylbutyl)-",
    "Benzofuran, octahydro-2,6-dimethyl-3a-(1-methylethyl)-",
    "Slags Tellurium",
    "Polyoxyethylene Tridecyl ether sulfonate sodium salt",
    "2-Propenoic acid, 2-methyl-,1-1-dimethylethyl ester",
    "Ethylene glycol mon-tertiary-butyl ether",
    "2-Ethylhexyl 7-Oxabicyclo[4.1.0] Heptane-3-Carboxylate",
    "Phosphorodithioic acid, O,O-bis(2-methylpropyl) ester, compd. With N,N-dimethylmethanamine (1:1)",
    "1-Hexanol, 2-ethyl-, manuf. Of by-products from, distn. Residues",
    "Carbamic acid, [(butylthio)thioxomethyl]-,butyl ester",
    "N-Butyoxycarbonyl-O-n-Butyl thiocarbamate",
    "Phosphorothioic acid, O,O-bis(2-methylpropyl) ester, sodium salt",
    "Carbamothioic acid, N-2-propen-1-yl,O-(2-methylpropyl)ester",
    "Benzyl acrylate",
    "Octadecanoic acid, methyl ester, reaction products with 1-(2-hydroxy-2-methylpropoxy)-2,2,6,6-tetramethyl-4-piperidinol",
    "Amines, bis(C11-14-branched and linear alkyl), 3-[[bis(2-methylpropoxy)phosphinothioyl]thio]-2-methylpropanoates",
    "Benzenesulfonamide, 4-methyl-N-[[[3-[[(4-methylphenyl)sulfonyl]oxy]phenyl]amino]carbonyl]-",
    "Phosphonic acid, P,P'-[(2,4-dihydroxycyclodisiloxane-2,4-diyl)di-3,1-propanediyl]bis-, P,P'-diethyl ester, sodium salt (1:4), reaction products with silicic acid (H2SiO3) sodium salt (1:2)",
    "Urea, N,N''-1,3-propanediylbis[N'-octadecyl-",
    "(Z)-4-dodecenal",
    "Decamethylenediamine",
    "Benzenesulfonic acid, ethenyl-, homopolymer, compd. with 2,3-dihydrothieno[3,4-b]-1,4-dioxin homopolymer",
    "N,N''-hexane-1,6-diylbis[N'-benzylurea]",
    "2'2-Oxy diethanol, propoxylated",
    "Formaldehyde, Polymer with Benzenamine and Methyloxirane",
    "1,1,1,3,3,3-Hexafluoropropane",
    "Tantalum Oxide",
    "Lead Titanium Oxide"
  ),
  stringsAsFactors = FALSE
)

ph_emb_mc_07 <- transform(
  ph_emb_mc_07,
  cas_registry_no = ifelse(
    test = cleanventory:::.check_cas(cas_registry_no),
    yes = cas_registry_no,
    no = NA_character_
  )
)

save(ph_emb_mc_07, file = "data/ph_emb_mc_07.rda")
tools::resaveRdaFiles(paths = "data/ph_emb_mc_07.rda")

ph_emb_mc_08 <- data.frame(
  no = 1:52,
  cas_registry_no = c(
    "183815-52-3", "848366-84-7", "736150-63-3", "25915-57-5", "192268-65-8",
    "73936-91-1", "54889-63-3", "1803088-15-4", "6297-03-6", "1374859-51-4",
    "13162-05-5", "160875-66-1", "68333-82-4", "1890134-22-1", "234114-82-0",
    "151006-60-9", "2205009-18-1", "160738-72-7", "64653-79-8", "118685-25-9",
    "7789-02-8", "84697-09-6", "958663-49-5", "14315-63-0", "13537-82-1",
    "16251-77-7", "1945993-03-2", "1571956-78-9", "140921-24-0",
    "102687-65-0", "1190091-71-4", "1394035-93-8", "1302-93-8",
    "68551-15-5", "140668-04-8", "2002435-42-7", "84632-67-7", "88949-44-4",
    "191358-81-3", "332142-67-3", "68954-12-1", "132983-38-1", "72681-01-7",
    "1370699-98-1", "15229-79-5", "870515-09-6", "103983-77-3",
    "1643921-90-7", "51231-09-5", "84625-54-7", "2142611-77-4",
    "1137739-11-7"
  ),
  notified_chemical_name = c(
    "Tasmannia lanceolata, ext. -",
    "1,5-Naphthalenedisulfonic acid, 2-[2-[8-[(4,6-dichloro1,3,5-triazin-2-yl)amino]-1-hydroxy-3,6-disulfo-2-naphthalenyl]diazenyl]-, sodium salt (1:?), reaction products with sodium 2,4-diamino-5-[2-[4-[[2-(sulfooxy)ethyl]sulfonyl]phenyl]diazenyl]benzenesulfonate (1:?)",
    "Glycerides, castor-oil, mono-, hydrogenated, acetates",
    "Alpha-D-Glucopyranoside, Beta-D-frictofuranosyl, didodecanoate (en-US)",
    "Phosphorothioic acid, O,O,O-triphenyl esters, tert-Bu",
    "Phenol,2-(2H-benzotriazol-2-yl)-6-(1-methyl-1-phenylethyl)-4-(1,1,3,3-tetramethylbutyl-(9Cl)",
    "Cyclohexane, 1,4-bis(ethoxymethyl)-",
    "2(3H)-Benzofuranone, 5,7-bis(1,1-dimethylethyl)-3- [3,5-dimethyl-4-[[2,4,8,10-tetrakis(1,1-dimethylethyl)-12-methyl-12H-dibenzo[d,g] [1,3,2]dioxa-phosphocin-6-yl]oxy]phenyl]-",
    "Octadecane,1,1'-oxybis",
    "Amines, bis(hydrogenated palm-oil alkyl)hydroxy",
    "Formamide, N-ethenyl-",
    "Poly(oxy-1,2-ethanediyl), alpha-(2-propylheptyl)-omegahydroxy-",
    "Amides, coco, N-(2-hydroxypropyl)",
    "Formaldehyde, polymer with 2-methylphenol, benzylated, glycidyl ethers",
    "1,2-Benzendiol, 4-(1,1-dimethylethyl)-polymer with 2-(chloromethyl)oxirane",
    "1-dodecene, polymer with 1-decene, hydrogenated",
    "Fatty acids, coco, triesters with ethoxylated N-coco alkyltrimethylenediamines, di-Me sulfate-quaternized",
    "Creosote oil, sulfonated, polymer with formaldehyde, sodium salt",
    "Formaldehyde, polymer with 2-methylphenol, phenol and 1,3,5,7-tetraazatricyclo [3.3.1.13,] decane",
    "Formaldehyde, polymer with 2-methylphenol, butyl ether",
    "Chromium (III) Nitrate Nonahydrate",
    "Heptanal, 2-[(4-methylphenyl)methylene]-",
    "Oils, Aquilaria crassna",
    "Cyclohexane, 1,1'-[oxybis(methylene)]bis-",
    "Cyclohexanecarboxylic acid, 4-methyl-2-oxo-, ethyl ester",
    "Benzenepropanal, beta-methyl-",
    "2H-Pyran, 3,6-dihydro-4,6-dimethyl-2-(1-phenylethyl)-",
    "2-Propenoic acid, 2-methyl-, C9-11 branched alkyl esters, polymers with Bu methacrylate,2-butoxyethyl methacrylate, C12-15 branched and linear alkyl methacrylate, cetyl methacrylate, hydroxyl-terminated hydrogenated polybutadiene monomethacrylate and stearyl methacrylate",
    "Carbamic acid, N,N'-1,6-hexanediylbis-, C,C'-bis(2-(2-(1-ethylpentyl)-3-oxazolidinyl)ethyl)ester",
    "trans-1-Chloro-3,3,3-trifluoropropene",
    "Copolymer of ammonium acryloyldimethyltaurate, dimethylacrylamide, lauryl methacrylate and laureth-4 methacrylate",
    "2,7-Naphthalenediol polymer with 2-(chloromethyl)oxirane, ar-benzyl derivatives",
    "tris(oxo[(oxoalumanyl)oxy]alumane), bis(silanedione)",
    "Alkanes, C8-10-iso-",
    "Ethanaminium, N,N,N-trimethyl-2-[(2-methyl-1-oxo-2-propen-1-yl)oxy]-, chloride (1:1), polymer with 2-propenamide, 2-propenoic acid and N,N,N-trimethyl-2-[(1-oxo-2-propen-1-yl)oxy]ethanaminium chloride (1:1)",
    "2-propenoic acid, 2-methyl-, polymers with cyclohexyl acrylate, cyclohexyl methacrylate, 2-phenoxyethyl methacrylate and polyethylene glycol hydrogen sulfate Ph ether 1-phenylethyl and 1-propen-1-yl derivs. Ammonium salts",
    "Pyrrolo[3,4-c]pyrrole-1,4-dione, 3,6-bis(3,6-bis(3-chlorophenyl-2,5-dihydro-",
    "Pyrrolo[3,4-c]pyrrole-1,4-dione, 3-(3-chlorophenyl)-6-(4-chlorophenyl)-2,5-dihydro-",
    "Formaldehyde, reaction products with 5,12-dihydroquino[2,3-b]acridine-7,14-dione and 3,5-dimethyl1H-pyrazole, sulfonated",
    "Quino[2,3-b]acridine-7,14-dione, 5,12-dihydro-, (1,3-dihydro-1,3-dioxo-2H-isoindol-2-yl)methyl derivs.",
    "2-Butenedioic acid (2E)-, di-C8-18-alkyl esters, polymers with vinyl acetate",
    "Benzene, ethenyl-, polymer with 1,3-butadiene and 2-methyl-1, 3-butadiene, hydrogenated",
    "Benzenepentanol, .alpha.,.gamma.-dimethyl or Benzene-.alpha.,.gamma.-dimethyl",
    "Ethanone, 1-(5-propyl-1,3-benzodioxol-2-yl)-",
    "4,8-Cyclododecadien-1-one",
    "1(2H)-Naphthalenone, 4-ethyloctahydro-8-methyl",
    "2,7-Nonadien-4-ol, 4,8-dimethyl-",
    "2-OXIRANEACETIC ACID, 3-ETHYL-, 1-(3,3-DIMETHYLCYCLOHEXYL)ETHYL ESTER",
    "4-Pentenoic acid, phenyl ester",
    "Pyridine, 4-methyl-2-pentyl-",
    "2-propenoic acid, 2-methyl-, polymer with 1,1'-(1,4-butanediyl) bis(2-methyl-2-propenoate), methyl 2-methyl2-propenoate and 3- (trimethoxysilyl)propyl 2-methylprop2-enoate, dilauroyl peroxide-initiated, reaction products with hexadecyltrimethoxysilane-silica hydrolysis products",
    "Oils, Evodia rutaercarpa"
  ),
  stringsAsFactors = FALSE
)

ph_emb_mc_08 <- transform(
  ph_emb_mc_08,
  cas_registry_no = ifelse(
    test = cleanventory:::.check_cas(cas_registry_no),
    yes = cas_registry_no,
    no = NA_character_
  )
)

save(ph_emb_mc_08, file = "data/ph_emb_mc_08.rda")
tools::resaveRdaFiles(paths = "data/ph_emb_mc_08.rda")
