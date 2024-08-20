## Remove previous files
remPrevInputfiles <- function(filepath = getwd()){
  
  o <- getwd()
  on.exit(setwd(o))
  setwd(filepath)
  
  NO_SP <- readPAR("confile.dat", "nspecies", "species")
  for (i in 1:NO_SP) {
    PHY_NAMES <- readPAR("confile.dat", "phyfiles", "species")
    file.remove(PHY_NAMES[i])
    
    STR_NAMES <- readPAR("confile.dat", "strfiles", "species")
    file.remove(STR_NAMES[i])
  }
  
  file.remove("confile.dat")
  file.remove("Met.dat")
  file.remove("Trees.dat")
  file.remove("watpars.dat")
}
