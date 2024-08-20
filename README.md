# Rmaespa: Useful functions to use MAESPA from R  
Most functions need the `Maeswrap` R package.   
   
_Example usage:_  
```
setwd("C:/Users/[username]/MAESPA/RUN/Input files/")

remPervInputfiles()
copy_input_files()
defineInputParams()

setwd("C:/Users/[username]/MAESPA/RUN")
rundir <- deploy_runfolder("this_run")
Input_to_dir(rundir)
runmaespa_in(rundir)
```
