## Run MAESPA in specified folder
runmaespa_in <- function(runwd, intern=TRUE, WatBal=FALSE){
  o <- getwd()
  on.exit(setwd(o))
  setwd(runwd)
  
  if (!WatBal){
    file.remove("watpars.dat")
  }
  shell("MAESPA.exe", intern=intern)
}
