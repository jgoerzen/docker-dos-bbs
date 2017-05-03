#!/bin/bash

set -e
set -x

# Unpack ADF (FOSSIL)
cd /dos/drive_h
mkdir adf
cd adf
unzip /tmp/setup/adf_150.zip

# Set up Telemate
cd /dos/drive_h
mkdir comm
cd comm
unzip /tmp/setup/tm421.zip
mv tm421 TM
cd TM
sed -i 's/Baud=38400/Baud=57600/' TM.CFG
sed -i 's/RegNo=.*/RegNo="TM00F1C0129"/' TM.CFG
sed -i 's/RegName=.*/RegName="Nobody"/' TM.CFG
mv -vi /tmp/setup/TM.FON .

# Set up Telix
cd /dos/drive_h/comm
mkdir TELIX
mkdir telix_extract
cd telix_extract
unzip /tmp/setup/telix351.zip
cd ../TELIX
unzip ../telix_extract/TELIX351.DAT
rm -r /dos/drive_d/comm/telix_extract
mv -vi /tmp/setup/TELIX.* /dos/drive_d/comm/TELIX/


# Download doors
cd /dos/drive_g
mkdir doors
cd doors
mkdir tw2002
cd tw2002
unzip /tmp/setup/doors/2002v309.zip
cd ..
mkdir lord
cd lord
unzip -L /tmp/setup/doors/lord407.zip
unzip -L lord.zip
unzip -o -L /tmp/setup/doors/lord407-patch.zip

