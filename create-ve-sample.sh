
## If you are on a linux OS, always start by 
##   updating your OS, 
##   and then install pip 
sudo apt-get update 
sudo apt-get install python-pip

## Next use pip to install virtualenv 
pip install virtualenv 

## Create a new environment 
##   The --python arg tells which python installation to use. 
##   If you are using a new computer without python3 isntalled, 
##   you will need to install it first. 
virtualenv --python python3 p3env 

## Now you can get into the env by running the `activate` script. 
source env/bin/activate 

## Now set up the package dependencies for your project. 
pip install -r requirements.txt

## And finally, you can always exit easily: 
deactivate 
