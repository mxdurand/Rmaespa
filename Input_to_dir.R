## Copy input file into folder
Input_to_dir <- function(runfolder){
  file.copy(dir("Input files", full.names=TRUE, include.dirs=FALSE),runfolder,overwrite=TRUE)
}
