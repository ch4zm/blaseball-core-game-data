#!/bin/sh
set -e

WORKDIR=$PWD
DIRNAME=$(dirname $0)
SCRIPTDIR=${WORKDIR}/${DIRNAME:2}
ROOTDIR=$SCRIPTDIR/..
echo "Script dir: $SCRIPTDIR"

cd $ROOTDIR

# make sure we are on correct branch
git checkout master

# make and enter virtualenv
virtualenv -p python3.6 $ROOTDIR/.releasevp
source $ROOTDIR/.releasevp/bin/activate

# bump version num in src code
$ROOTDIR/.releasevp/bin/python $ROOTDIR/scripts/bump_version_number.py
echo "Bumped source code to new version"

echo "Making things..."
make clean

# install requirements
make requirements || { echo "Failed make requirements step"; exit 1; }
make dev || { echo "Failed make dev step"; exit 1; }

# update data to latest
make update || { echo "Failed make update step"; exit 1; }

# build and upload
make clean
make build || { echo "Failed make build step"; exit 1; } 
make dist || { echo "Failed make dist step"; exit 1; }
make distcheck || { echo "Failed make distcheck step"; exit 1; } 

echo "Everything checks out. Uploading to testpypi, then pypi..."
#make testpypi || {echo "Failed make testpypi step"; exit 1}  
#make pypi || {echo "Failed make pypi step"; exit 1}   
echo "Done!"

echo "Making git tag"
git add blaseball_core_game_data/
git commit blaseball_core_game_data/ -m "auto-update to new version"
#git tag $NEWV
#git push --tags ch4zm master

#NEWV=$(./../vp/bin/python ./scripts/bump_version_number.py)
#echo $NEWV
#git add blaseball_core_game_data/__init__.py
#git commit blaseball_core_game_data/__init__.py -m 'auto-update to new version'
#make build
#make dist
#make distcheck
#make testpypi
#make pypi
#git tag $(NEWV)
#git push --tags ch4zm

# Clean up
deactivate
rm -fr $ROOTDIR/.releasevp
