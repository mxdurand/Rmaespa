## Create multiple str.dat files for all species (read from confile!)
create_str_files <- function() {
  o <- getwd()
  on.exit(setwd(o))
  NO_SP <- readPAR("confile.dat", "nspecies", "species")
  STR_NAMES <- readPAR("confile.dat", "strfiles", "species")
  for (i in 1:NO_SP) {
    file.copy("str.dat","temp")
    file.rename("temp/str.dat", paste("temp/", STR_NAMES[i], sep=""))
    file.copy(paste("temp/", STR_NAMES[i], sep=""), o)
    file.remove(paste("temp/", STR_NAMES[i], sep=""))
  }
  file.remove("str.dat")
}
