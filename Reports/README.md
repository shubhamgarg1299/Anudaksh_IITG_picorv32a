> Openlane_Installation

> 1. Python
> 2. Magic
> 3. Docker
> 4. Klayout
> 5. Openlane

>####################################################################  
>##################Follow the commands for installation#####################  
>####################################################################  

git clone https://github.com/rushikparmar/Openlane_Installation

cd Openlane_Installation/

chmod 777 openlane_script.sh
 
sudo ./ openlane_script.sh

>################## Wait for "Basic test passed"###########################  
>################### This marks successful installation #####################  


>####################################################################  
>###########Follow the commands for Openlane installation Test###############  
>####################################################################  

cd apr/OpenLane

sudo make mount 

./flow.tcl -design inverter 

> Wait for "[SUCCESS]: Flow complete." 

> In a new terminal cd to "designs/inverter/runs/RUN...../results/final/gds/"  
> cd "designs/inverter/runs/RUN...../results/final/gds/"  

klayout inverter.gds 
 
