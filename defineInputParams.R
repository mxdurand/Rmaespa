## Change every parameters at once in input files
defineInputParams <- function() {
  # 1.    
  # 2.    Confile
  file <- "confile.dat"
  
  ## 2.1   CONTROL Namelist
  NM <- "control"
  
  replacePAR(file, "iohrly", NM, 1) # Hourly output
  replacePAR(file, "iotutd", NM, 9) # 9 days between each diffuse transmittance calculations
  replacePAR(file, "ioresp", NM, 0) # Show respiration flux
  replacePAR(file, "iohist", NM, 1) # Show PAR histogram
  replacePAR(file, "isimus", NM, 0) # Simulate understorey (0 = no)
  replacePAR(file, "iowatbal", NM, 0) # Simulate water balance (0 = no)
  
  ## 2.2   SPECIES Namelist
  NM <- "species"
  
  replacePAR(file, "nspecies", NM, 9) # Number of "species" including borders
  replacePAR(file, "speciesnames", NM, c("CH", "CS", "IH", "IS", "JH", "JS", "NH", "NS", "B"))
  replacePAR(file, "phyfiles", NM, c("phyCH.dat", "phyCS.dat", "phyIH.dat", "phyIS.dat", "phyJH.dat", "phyJS.dat", "phyNH.dat", "phyNS.dat", "phyB.dat"))
  replacePAR(file, "strfiles", NM, c("strCH.dat", "strCS.dat", "strIH.dat", "strIS.dat", "strJH.dat", "strJS.dat", "strNH.dat", "strNS.dat", "strB.dat"))
  
  ## 2.3   TREESCON Namelist
  NM <- "treescon"
  
  itargets <- dfPos[dfPos$Nr %in% l48trees,]$Number
  #itargets <- 30
  
  replacePAR(file, "itargets", NM, itargets)
  replacePAR(file, "norandom", NM, 0)
  
  ## 2.4   DIFFANG Namelist
  NM <- "diffang"
  
  replacePAR(file, "nolay", NM, 6)
  replacePAR(file, "pplay", NM, 12)
  replacePAR(file, "nzen", NM, 5)
  replacePAR(file, "naz", NM, 11)
  
  ## 2.5   MODEL Namelist
  NM <- "model"
  
  replacePAR(file, "modelgs", NM, 4)
  replacePAR(file, "modelrd", NM, 0)
  replacePAR(file, "modeljm", NM, 0)
  replacePAR(file, "modelrw", NM, 0)
  replacePAR(file, "modelss", NM, 0)
  replacePAR(file, "itermax", NM, 0)
  
  ## 2.6   HISTO Namelist
  NM <- "histo"
  
  replacePAR(file, "binsize", NM, 20)
  
  #### 2.7  DATES Nameslist
  NM <- "dates"
  
  replacePAR(file, "startdate", NM, "14/07/17")
  replacePAR(file, "enddate", NM, "31/08/17")
  
  # 3.    Trees
  file <- "Trees.dat"
  
  ## 3.1  PLOT Namelist
  NM <- "plot"
  
  replacePAR(file, "x0", NM, 0)
  replacePAR(file, "y0", NM, 0)
  replacePAR(file, "xmax", NM, 100)
  replacePAR(file, "ymax", NM, 100)
  replacePAR(file, "xslope", NM, 3)
  replacePAR(file, "yslope", NM, -5)
  replacePAR(file, "bearing", NM, 121)
  replacePAR(file, "notrees", NM, 201)
  replacePAR(file, "shadeht", NM, 0)
  
  ## 3.2  AERODYN Namelist
  NM <- "aerodyn"
  
  replacePAR(file, "zht", NM, 5)
  replacePAR(file, "zpd", NM, 0.03)
  replacePAR(file, "z0ht", NM, 0.01)
  
  ## 3.3  XY Namelist
  NM <- "xy"
  
  coords <- c(rbind(dfPos$Xrev, dfPos$Yrev))
  replacePAR(file, "xycoords", NM, coords)
  
  ## 3.4  SPECLIST Namelist
  NM <- "speclist"
  
  replacePAR(file, "ispecies", NM, dfPos$Nsp)
  
  
  ## 3.5  INDIVRADX Namelist
  NM <- "indivradx"
  
  replacePAR(file, "nodates", NM, 7)
  replacePAR(file, "dates", NM, c("14/07/17", "21/07/17", "28/07/17", "07/08/17", "17/08/17", "24/08/17", "31/08/17")) ### Add all dates
  replacePAR(file, "values", NM, as.matrix(dfTREE[dfTREE$VAR == "R",c("J195", "J202", "J209", "J219", "J229", "J236", "J243")]))
  
  ## 3.6  INDIVRADY Namelist
  NM <- "indivrady"
  
  replacePAR(file, "nodates", NM, 7)
  replacePAR(file, "dates", NM, c("14/07/17", "21/07/17", "28/07/17", "07/08/17", "17/08/17", "24/08/17", "31/08/17")) ### Add all dates
  replacePAR(file, "values", NM, as.matrix(dfTREE[dfTREE$VAR == "R",c("J195", "J202", "J209", "J219", "J229", "J236", "J243")]))
  
  ## 3.7  INDIVHTCROWN Namelist
  NM <- "indivhtcrown"
  
  replacePAR(file, "nodates", NM, 7)
  replacePAR(file, "dates", NM, c("14/07/17", "21/07/17", "28/07/17", "07/08/17", "17/08/17", "24/08/17", "31/08/17")) ### Add all dates
  replacePAR(file, "values", NM, as.matrix(dfTREE[dfTREE$VAR == "H",c("J195", "J202", "J209", "J219", "J229", "J236", "J243")]))
  
  ## 3.8  INDIVDIAM Namelist
  NM <- "indivdiam"
  
  replacePAR(file, "nodates", NM, 7)
  replacePAR(file, "dates", NM, c("14/07/17", "21/07/17", "28/07/17", "07/08/17", "17/08/17", "24/08/17", "31/08/17")) ### Add all dates
  replacePAR(file, "values", NM, as.matrix(dfTREE[dfTREE$VAR == "D",c("J195", "J202", "J209", "J219", "J229", "J236", "J243")]))
  
  ## 3.9  INDIVHTTRUNK Namelist
  NM <- "indivhttrunk"
  
  replacePAR(file, "nodates", NM, 7)
  replacePAR(file, "dates", NM, c("14/07/17", "21/07/17", "28/07/17", "07/08/17", "17/08/17", "24/08/17", "31/08/17")) ### Add all dates
  replacePAR(file, "values", NM, as.matrix(dfTREE[dfTREE$VAR == "HT",c("J195", "J202", "J209", "J219", "J229", "J236", "J243")]))
  
  ## 3.10 INDIVLAREA Namelist
  NM <- "indivlarea"
  
  replacePAR(file, "nodates", NM, 7)
  replacePAR(file, "dates", NM, c("14/07/17", "21/07/17", "28/07/17", "07/08/17", "17/08/17", "24/08/17", "31/08/17")) ### Add all dates
  replacePAR(file, "values", NM, as.matrix(dfTREE[dfTREE$VAR == "LA",c("J195", "J202", "J209", "J219", "J229", "J236", "J243")]))
  
  # 4. Met
  file <- "Met.dat"
  
  ## 4.1 ENVIRON Namelist
  NM <- "environ"
  
  replacePAR(file, "difsky", NM, 0.0)
  replacePAR(file, "ca", NM, 380)
  replacePAR(file, "swmin", NM, 0.0)
  replacePAR(file, "swmax", NM, 1.0)
  
  ## 4.2 LATLONG Namelist
  NM <- "latlong"
  
  replacePAR(file, "lat", NM, c(48, 44, 57))
  replacePAR(file, "long", NM, c(6, 20, 18))
  replacePAR(file, "tzlong", NM, 15)
  replacePAR(file, "lonhem", NM, "E")
  replacePAR(file, "lathem", NM, "N")
  
  
  ## 4.3 METFORMAT Namelist
  NM <- "metformat"
  
  replacePAR(file, "dayorhr", NM, 1)
  replacePAR(file, "khrsperday", NM, 24)
  replacePAR(file, "nocolumns", NM, 11)
  replacePAR(file, "startdate", NM, "14/07/17")
  replacePAR(file, "enddate", NM, "31/08/17")
  replacePAR(file, "columns", NM, c("DOY", "HEURE", "AN", "MOIS", "JOUR", "PPT", "TAIR", "RH", "WIND", "PRESS", "RAD"))
  
  ## 4.4 WEATHER DATA data frame
  replacemetdata(metdfr=dfM)
  
  # 5. str
  
  ## 5.1 Create multiple str.dat files for all species
  create_str_files()
  
  STR_NAMES <- readPAR("confile.dat", "strfiles", "species")
  
  ## 5.2 CANOPY Namelist
  NM <- "canopy"
  
  for (iSTR in STR_NAMES)
  {
    replacePAR(iSTR, "cshape", NM, "CONE")
  }
  
  ## 5.3 LIA Namelist
  NM <- "lia"
  
  for (iSTR in STR_NAMES)
  {
    if(substring(iSTR, 4, 4) == "C" |  substring(iSTR, 4, 4) == "B"){ELP = 0.4285034} # {Package: RLeafAngle} computeLambda(dfLIA[dfLIA$GTP == "C",]$angle)
    if(substring(iSTR, 4, 4) == "I"){ELP = 0.2532537}
    if(substring(iSTR, 4, 4) == "J"){ELP = 0.2954752}
    if(substring(iSTR, 4, 4) == "N"){ELP = 0.5579318}
    
    replacePAR(iSTR, "avgang", NM, -1.0)
    replacePAR(iSTR, "nalpha", NM, 9)
    replacePAR(iSTR, "elp", NM, ELP)
  }
  
  ## 5.4 LADD Namelist
  NM <- "ladd"
  
  for (iSTR in STR_NAMES)
  {
    replacePAR(iSTR, "jleaf", NM, 1)
    replacePAR(iSTR, "noagec", NM, 1)
    replacePAR(iSTR, "random", NM, 1.0)
    
    if(substring(iSTR, 4, 4) == "C" & substring(iSTR, 5, 5) == "H"){a = dfBETA[dfBETA$GTP == "C" & dfBETA$TTT == "H","a"] ; b = dfBETA[dfBETA$GTP == "C" & dfBETA$TTT == "H","b"] ; c = dfBETA[dfBETA$GTP == "C" & dfBETA$TTT == "H","c"]}
    if(substring(iSTR, 4, 4) == "C" & substring(iSTR, 5, 5) == "S"){a = dfBETA[dfBETA$GTP == "C" & dfBETA$TTT == "S","a"] ; b = dfBETA[dfBETA$GTP == "C" & dfBETA$TTT == "S","b"] ; c = dfBETA[dfBETA$GTP == "C" & dfBETA$TTT == "S","c"]}
    if(substring(iSTR, 4, 4) == "I" & substring(iSTR, 5, 5) == "H"){a = dfBETA[dfBETA$GTP == "I" & dfBETA$TTT == "H","a"] ; b = dfBETA[dfBETA$GTP == "I" & dfBETA$TTT == "H","b"] ; c = dfBETA[dfBETA$GTP == "I" & dfBETA$TTT == "H","c"]}
    if(substring(iSTR, 4, 4) == "I" & substring(iSTR, 5, 5) == "S"){a = dfBETA[dfBETA$GTP == "I" & dfBETA$TTT == "S","a"] ; b = dfBETA[dfBETA$GTP == "I" & dfBETA$TTT == "S","b"] ; c = dfBETA[dfBETA$GTP == "I" & dfBETA$TTT == "S","c"]}
    if(substring(iSTR, 4, 4) == "J" & substring(iSTR, 5, 5) == "H"){a = dfBETA[dfBETA$GTP == "J" & dfBETA$TTT == "H","a"] ; b = dfBETA[dfBETA$GTP == "J" & dfBETA$TTT == "H","b"] ; c = dfBETA[dfBETA$GTP == "J" & dfBETA$TTT == "H","c"]}
    if(substring(iSTR, 4, 4) == "J" & substring(iSTR, 5, 5) == "S"){a = dfBETA[dfBETA$GTP == "J" & dfBETA$TTT == "S","a"] ; b = dfBETA[dfBETA$GTP == "J" & dfBETA$TTT == "S","b"] ; c = dfBETA[dfBETA$GTP == "J" & dfBETA$TTT == "S","c"]}
    if(substring(iSTR, 4, 4) == "N" & substring(iSTR, 5, 5) == "H"){a = dfBETA[dfBETA$GTP == "N" & dfBETA$TTT == "H","a"] ; b = dfBETA[dfBETA$GTP == "N" & dfBETA$TTT == "H","b"] ; c = dfBETA[dfBETA$GTP == "N" & dfBETA$TTT == "H","c"]}
    if(substring(iSTR, 4, 4) == "N" & substring(iSTR, 5, 5) == "S"){a = dfBETA[dfBETA$GTP == "N" & dfBETA$TTT == "S","a"] ; b = dfBETA[dfBETA$GTP == "N" & dfBETA$TTT == "S","b"] ; c = dfBETA[dfBETA$GTP == "N" & dfBETA$TTT == "S","c"]}
    if(substring(iSTR, 4, 4) == "B"){a = dfBETA[dfBETA$GTP == "C" & dfBETA$TTT == "H","a"] ; b = dfBETA[dfBETA$GTP == "C" & dfBETA$TTT == "H","b"] ; c = dfBETA[dfBETA$GTP == "C" & dfBETA$TTT == "H","c"]}
    replacePAR(iSTR, "bpt", NM, c(a, b, c, 0, 0, 0))
  }
  
  ## 5.5 AERO Namelist
  NM <- "aero"
  
  for (iSTR in STR_NAMES)
  {
    replacePAR(iSTR, "extwind", NM, 0)
  }
  
  # 6. phy
  create_phy_files()
  PHY_NAMES <- readPAR("confile.dat", "phyfiles", "species")
  
  ## 6.1 NOAGES Namelist
  NM <- "noages"
  
  for (iPHY in PHY_NAMES)
  {
    replacePAR(iPHY, "noagep", NM, 1)
  }
  
  ## 6.2 PHENOL Namelist
  NM <- "phenol"
  
  for (iPHY in PHY_NAMES)
  {
    replacePAR(iPHY, "prop", NM, 1.0)
  }
  
  ## 6.3 ABSORP Namelist
  NM <- "absorp"
  
  for (iPHY in PHY_NAMES)
  {
    replacePAR(iPHY, "nolayers", NM, 1)
    replacePAR(iPHY, "rhosol", NM, c(0.10, 0.30, 0.05))
    replacePAR(iPHY, "atau", NM, c(0.064, 0.307, 0.05))
    replacePAR(iPHY, "arho", NM, c(0.054, 0.446, 0.01))
  }
  
  ## 6.4 BBGSCON Namelist
  NM <- "bbgscon"
  
  for (iPHY in PHY_NAMES)
  {
    replacePAR(iPHY, "nodates", NM, 1)
    replacePAR(iPHY, "condunits", NM, "H2O")
  }
  
  ## 6.5 BBMGS Namelist
  NM <- "bbmgs"
  
  replacePAR(PHY_NAMES[1], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[2], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[3], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[4], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[1], "g0", NM, 0.001)
  replacePAR(PHY_NAMES[2], "g0", NM, 0.001)
  replacePAR(PHY_NAMES[3], "g0", NM, 0.001)
  replacePAR(PHY_NAMES[4], "g0", NM, 0.001)
  replacePAR(PHY_NAMES[1], "g1", NM, 6.0995)
  replacePAR(PHY_NAMES[2], "g1", NM, 6.3809)
  replacePAR(PHY_NAMES[3], "g1", NM, 5.5939)
  replacePAR(PHY_NAMES[4], "g1", NM, 5.8010)
  replacePAR(PHY_NAMES[1], "gk", NM, 0.5)
  replacePAR(PHY_NAMES[2], "gk", NM, 0.5)
  replacePAR(PHY_NAMES[3], "gk", NM, 0.5)
  replacePAR(PHY_NAMES[4], "gk", NM, 0.5)
  replacePAR(PHY_NAMES[1], "nsides", NM, 2)
  replacePAR(PHY_NAMES[2], "nsides", NM, 2)
  replacePAR(PHY_NAMES[3], "nsides", NM, 2)
  replacePAR(PHY_NAMES[4], "nsides", NM, 2)
  replacePAR(PHY_NAMES[1], "wleaf", NM, 0.0753)
  replacePAR(PHY_NAMES[2], "wleaf", NM, 0.0908)
  replacePAR(PHY_NAMES[3], "wleaf", NM, 0.0623)
  replacePAR(PHY_NAMES[4], "wleaf", NM, 0.0828)
  replacePAR(PHY_NAMES[1], "gamma", NM, 0)
  replacePAR(PHY_NAMES[2], "gamma", NM, 0)
  replacePAR(PHY_NAMES[3], "gamma", NM, 0)
  replacePAR(PHY_NAMES[4], "gamma", NM, 0)
  
  ## 6.6 JMAXCON Namelist
  NM <- "jmaxcon"
  
  replacePAR(PHY_NAMES[1], "nolayers", NM, 1)
  replacePAR(PHY_NAMES[2], "nolayers", NM, 1)
  replacePAR(PHY_NAMES[3], "nolayers", NM, 1)
  replacePAR(PHY_NAMES[4], "nolayers", NM, 1)
  replacePAR(PHY_NAMES[1], "noages", NM, 1)
  replacePAR(PHY_NAMES[2], "noages", NM, 1)
  replacePAR(PHY_NAMES[3], "noages", NM, 1)
  replacePAR(PHY_NAMES[4], "noages", NM, 1)
  replacePAR(PHY_NAMES[1], "nodates", NM, 1)
  replacePAR(PHY_NAMES[2], "nodates", NM, 1)
  replacePAR(PHY_NAMES[3], "nodates", NM, 1)
  replacePAR(PHY_NAMES[4], "nodates", NM, 1)
  
  ## 6.7 JMAX Namelist
  NM <- "jmax"
  
  replacePAR(PHY_NAMES[1], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[2], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[3], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[4], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[1], "values", NM, 108)
  replacePAR(PHY_NAMES[2], "values", NM, 129)
  replacePAR(PHY_NAMES[3], "values", NM, 148)
  replacePAR(PHY_NAMES[4], "values", NM, 165)
  
  ## 6.8 VCMAXCON Namelist
  NM <- "vcmaxcon"
  
  replacePAR(PHY_NAMES[1], "nolayers", NM, 1)
  replacePAR(PHY_NAMES[2], "nolayers", NM, 1)
  replacePAR(PHY_NAMES[3], "nolayers", NM, 1)
  replacePAR(PHY_NAMES[4], "nolayers", NM, 1)
  replacePAR(PHY_NAMES[1], "noages", NM, 1)
  replacePAR(PHY_NAMES[2], "noages", NM, 1)
  replacePAR(PHY_NAMES[3], "noages", NM, 1)
  replacePAR(PHY_NAMES[4], "noages", NM, 1)
  replacePAR(PHY_NAMES[1], "nodates", NM, 1)
  replacePAR(PHY_NAMES[2], "nodates", NM, 1)
  replacePAR(PHY_NAMES[3], "nodates", NM, 1)
  replacePAR(PHY_NAMES[4], "nodates", NM, 1)
  
  ## 6.9 VCMAX Namelist
  NM <- "vcmax"
  
  replacePAR(PHY_NAMES[1], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[2], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[3], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[4], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[1], "values", NM, 42)
  replacePAR(PHY_NAMES[2], "values", NM, 50)
  replacePAR(PHY_NAMES[3], "values", NM, 50)
  replacePAR(PHY_NAMES[4], "values", NM, 55)
  
  
  ## 6.10 JMAXPARS Namelist
  NM <- "jmaxpars"
  
  replacePAR(PHY_NAMES[1], "eavj", NM, 39676.89)
  replacePAR(PHY_NAMES[2], "eavj", NM, 39676.89)
  replacePAR(PHY_NAMES[3], "eavj", NM, 39676.89)
  replacePAR(PHY_NAMES[4], "eavj", NM, 39676.89)
  replacePAR(PHY_NAMES[1], "edvj", NM, 200000)
  replacePAR(PHY_NAMES[2], "edvj", NM, 200000)
  replacePAR(PHY_NAMES[3], "edvj", NM, 200000)
  replacePAR(PHY_NAMES[4], "edvj", NM, 200000)
  replacePAR(PHY_NAMES[1], "delsj", NM, 641.3615)
  replacePAR(PHY_NAMES[2], "delsj", NM, 641.3615)
  replacePAR(PHY_NAMES[3], "delsj", NM, 641.3615)
  replacePAR(PHY_NAMES[4], "delsj", NM, 641.3615)
  replacePAR(PHY_NAMES[1], "theta", NM, 0.85)
  replacePAR(PHY_NAMES[2], "theta", NM, 0.85)
  replacePAR(PHY_NAMES[3], "theta", NM, 0.85)
  replacePAR(PHY_NAMES[4], "theta", NM, 0.85)
  replacePAR(PHY_NAMES[1], "ajq", NM, 0.24)
  replacePAR(PHY_NAMES[2], "ajq", NM, 0.24)
  replacePAR(PHY_NAMES[3], "ajq", NM, 0.24)
  replacePAR(PHY_NAMES[4], "ajq", NM, 0.24)
  
  ## 6.11 VCMAXPARS Namelist
  NM <- "vcmaxpars"
  
  replacePAR(PHY_NAMES[1], "eavc", NM, 82620.87)
  replacePAR(PHY_NAMES[2], "eavc", NM, 82620.87)
  replacePAR(PHY_NAMES[3], "eavc", NM, 82620.87)
  replacePAR(PHY_NAMES[4], "eavc", NM, 82620.87)
  replacePAR(PHY_NAMES[1], "edvc", NM, 0)
  replacePAR(PHY_NAMES[2], "edvc", NM, 0)
  replacePAR(PHY_NAMES[3], "edvc", NM, 0)
  replacePAR(PHY_NAMES[4], "edvc", NM, 0)
  replacePAR(PHY_NAMES[1], "delsc", NM, 645.1013)
  replacePAR(PHY_NAMES[2], "delsc", NM, 645.1013)
  replacePAR(PHY_NAMES[3], "delsc", NM, 645.1013)
  replacePAR(PHY_NAMES[4], "delsc", NM, 645.1013)
  
  ## 6.12 RDCON Namelist
  NM <- "rdcon"
  
  replacePAR(PHY_NAMES[1], "nolayers", NM, 1)
  replacePAR(PHY_NAMES[2], "nolayers", NM, 1)
  replacePAR(PHY_NAMES[3], "nolayers", NM, 1)
  replacePAR(PHY_NAMES[4], "nolayers", NM, 1)
  replacePAR(PHY_NAMES[1], "noages", NM, 1)
  replacePAR(PHY_NAMES[2], "noages", NM, 1)
  replacePAR(PHY_NAMES[3], "noages", NM, 1)
  replacePAR(PHY_NAMES[4], "noages", NM, 1)
  replacePAR(PHY_NAMES[1], "nodates", NM, 1)
  replacePAR(PHY_NAMES[2], "nodates", NM, 1)
  replacePAR(PHY_NAMES[3], "nodates", NM, 1)
  replacePAR(PHY_NAMES[4], "nodates", NM, 1)
  
  ## 6.13 RD Namelist
  NM <- "rd"
  
  replacePAR(PHY_NAMES[1], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[2], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[3], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[4], "dates", NM, "01/10/16")
  replacePAR(PHY_NAMES[1], "values", NM, 0.85)
  replacePAR(PHY_NAMES[2], "values", NM, 1.64)
  replacePAR(PHY_NAMES[3], "values", NM, 1.23)
  replacePAR(PHY_NAMES[4], "values", NM, 1.46)
  
  
  ## 6.14 RDPARS Namelist
  NM <- "rdpars"
  
  replacePAR(PHY_NAMES[1], "rtemp", NM, 25.0)
  replacePAR(PHY_NAMES[2], "rtemp", NM, 25.0)
  replacePAR(PHY_NAMES[3], "rtemp", NM, 25.0)
  replacePAR(PHY_NAMES[4], "rtemp", NM, 25.0)
  replacePAR(PHY_NAMES[1], "q10f", NM, 0.05)
  replacePAR(PHY_NAMES[2], "q10f", NM, 0.05)
  replacePAR(PHY_NAMES[3], "q10f", NM, 0.05)
  replacePAR(PHY_NAMES[4], "q10f", NM, 0.05)
  replacePAR(PHY_NAMES[1], "dayresp", NM, 1.0)
  replacePAR(PHY_NAMES[2], "dayresp", NM, 1.0)
  replacePAR(PHY_NAMES[3], "dayresp", NM, 1.0)
  replacePAR(PHY_NAMES[4], "dayresp", NM, 1.0)
  replacePAR(PHY_NAMES[1], "effyrf", NM, 0.4)
  replacePAR(PHY_NAMES[2], "effyrf", NM, 0.4)
  replacePAR(PHY_NAMES[3], "effyrf", NM, 0.4)
  replacePAR(PHY_NAMES[4], "effyrf", NM, 0.4)
}
