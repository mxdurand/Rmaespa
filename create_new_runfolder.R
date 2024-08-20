## Create new folder in working directory with 'Name' as its name 
create_new_runfolder <- function(Name = "runfolder"){
  dir.create(Name)
  return(Name)
}
