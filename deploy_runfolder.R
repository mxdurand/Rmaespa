## Create new folder and copy into it the latest released build of MAESPA
deploy_runfolder <- function(Name = "runfolder"){
  
  newd <- create_new_runfolder(Name)
  file.copy("C:/Users/mxdurand/Desktop/These/FORTRAN Code/MAESPA/MAESPA/Release/MAESPA.EXE", newd)
  
  return(invisible(newd))  
}
