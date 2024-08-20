## Create multiple str.dat files for all species (read from confile!)
create_phy_files <- function() {
  o <- getwd()
  on.exit(setwd(o))
  NO_SP <- readPAR("confile.dat", "nspecies", "species")
  PHY_NAMES <- readPAR("confile.dat", "phyfiles", "species")
  for (i in 1:NO_SP) {
    file.copy("phy.dat","temp")
    file.rename("temp/phy.dat", paste("temp/", PHY_NAMES[i], sep=""))
    file.copy(paste("temp/", PHY_NAMES[i], sep=""), o)
    file.remove(paste("temp/", PHY_NAMES[i], sep=""))
  }
  file.remove("phy.dat")
}
