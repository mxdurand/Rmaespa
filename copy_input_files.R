## Copy input files from origin to run folder
copy_input_files <- function(){
  o <- getwd()
  cp <- "C:/Users/mxdurand/Desktop/These/FORTRAN Code/RUN/Input files/Origin files/"
  file.copy(dir(cp, full.names=TRUE),o,overwrite=TRUE)
}
