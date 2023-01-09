
#!/bin/bash
Log_File=./installation.log


CommandLog () {
author='IITG'
startdate=$(date)
scriptName='installation.log'

echo "${author}"
echo "[$startdate]:[INSTALLATION]: This is ${scriptName}, which shows the loging of install_openLane.sh:"

set -ex
echo "=============================================="
echo "----Basic Toolschain Installation----"
echo "=============================================="
echo

sudo apt update
sudo apt install build-essential
sudo apt-get install lsb-core
sudo apt install git-all
sudo apt install ufw
sudo apt-get install cmake
sudo apt-get update -y
sudo apt-get install -y device-tree-compiler
sudo apt-get install -y make
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
sudo apt install containerd
#sudo apt-get install python-pip
sudo apt-get install python3-pip
sudo pip install --upgrade pip

sudo apt-get install python3-venv

echo "=================================="
echo "--- DOCKER INSTALLATION---"
echo "=================================="

sudo apt install docker.io

sudo systemctl start docker

sudo systemctl enable docker

echo "=================================="
echo "----------DOCKER  ENABLED---------"
echo "=================================="

docker --version

sudo apt install klayout

# making tools folder

mkdir -p apr; cd apr

echo "=================================="
echo "--------MAGIC INSTALLATION--------"
echo "=================================="

# pre-req for magic
sudo apt-get install m4
sudo apt-get install csh
sudo apt-get install libx11-dev
sudo apt-get install libncurses-dev
sudo apt-get install tcl-dev tk-dev
sudo apt-get install blt-dev
sudo apt-get install freeglut3
sudo apt-get install libgl1-mesa-dev
sudo apt-get install libglu1-mesa-dev

git clone https://github.com/RTimothyEdwards/magic.git
cd magic
./configure
sudo make
sudo make install
magic --version
cd ../


echo "======================================"
echo "----KICK OFF OpenLane INSTALATTION----"
echo "======================================"
echo

git clone https://github.com/The-OpenROAD-Project/OpenLane.git
cd OpenLane/
sudo git checkout master
# Default PDK_ROOT is $(pwd)/pdks. If you want to install the PDK at a differnt location, uncomment the next line.
#export PDK_ROOT=<absolute path to where skywater-pdk and open_pdks will reside>
sudo make
#sudo makeopenlane
#make pdk
sudo make test # This is to test that the flow and the pdk were properly inst
} 


CommandLog | tee "${Log_File}"
#ErrorLog "Found error in logic to logging for investigation" | tee "${Log_File}"
