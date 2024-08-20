# Rmaespa: Useful functions to use MAESPA from R  
Most functions need the `Maeswrap` R package.   
   
_Example usage:_  
```
setwd("C:/Users/[username]/MAESPA/RUN/Input files/")

remPervInputfiles() # Remove previous files
copy_input_files() # Copy input files from origin to run folder

create_new_runfolder(Name = "runfolder") # Create new folder in working directory with 'Name' as its name 
create_str_files() # Create multiple str.dat files for all species (read from confile!)
create_phy_files() # Create multiple phy.dat files for all species (read from confile!)

defineInputParams() # Change every parameters at once in input files

setwd("C:/Users/[username]/MAESPA/RUN")
rundir <- deploy_runfolder("runfolder") # Create new folder and copy into it the latest released build of MAESPA
Input_to_dir(rundir) # Copy input file into folder
runmaespa_in(rundir) # Run MAESPA in specified folder
```
