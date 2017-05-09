#!/bin/bash

set -e
set -x

echo 0 > /dos/numnodes
echo 1 > /dos/startconsole

echo '$_com1 = "virtual"' >> /etc/dosemu/dosemu.conf
echo '$_timemode = "linux"' >> /etc/dosemu/dosemu.conf
mkdir /dos/drive_h/STARTUP

## Do the downloads
cd /tmp/setup
wget https://ftp.sunet.se/mirror/archive/ftp.sunet.se/pub/simtelnet/msdos/fossil/adf_150.zip
wget http://www.starbase21.net/tm421.zip
wget https://archive.org/download/TelixCommunications_1020/telix351.zip
wget http://ftp.stat.duke.edu/bats/pkz204g.exe
wget http://presys.com/~ahgray/stuff/list91k.zip
wget http://www.filegate.net/comm/dszexe.zip

sha256sum -c < sums

mkdir doors
cd doors
wget http://archives.scovetta.com/pub/fehq/BBSDoorGames/2002v309.zip
wget http://www.slbbs.com/files/doorgame/lord407.zip
wget http://www.slbbs.com/files/doorgame/lord407-patch.zip
sha256sum -c < ../doorsums

# Unpack PKZIP
mkdir /tmp/setup/t
cd /tmp/setup/t
unzip ../pkz204g.exe
mv -v PKZIP.EXE PKUNZIP.EXE PKUNZJR.COM /dos/drive_h/UTILS/
cd /tmp/setup
rm -r /tmp/setup/t

# Unpack LIST
mkdir /tmp/setup/t
cd /tmp/setup/t
unzip ../list91k.zip
mv -v LIST.COM /dos/drive_h/UTILS/
cd /tmp/setup
rm -r /tmp/setup/t

# Unpack DSZ
mkdir /tmp/setup/t
cd /tmp/setup/t
unzip ../dszexe.zip
mv -v DSZ.EXE /dos/drive_h/UTILS/
cd /tmp/setup
rm -r /tmp/setup/t

# Unpack ADF (FOSSIL)
cd /dos/drive_h
mkdir adf
cd adf
unzip /tmp/setup/adf_150.zip
rm /tmp/setup/adf_150.zip

# Set up Telemate
cd /dos/drive_g
mkdir comm
cd comm
unzip /tmp/setup/tm421.zip
rm /tmp/setup/tm421.zip
mv tm421 TM
cd TM
sed -i 's/Baud=38400/Baud=57600/' TM.CFG
sed -i 's/RegNo=.*/RegNo="TM00F1C0129"/' TM.CFG
sed -i 's/RegName=.*/RegName="Nobody"/' TM.CFG
mv -v /tmp/setup/TM.FON .

# Set up Telix
cd /dos/drive_g/comm
mkdir TELIX
mkdir telix_extract
cd telix_extract
unzip /tmp/setup/telix351.zip
rm /tmp/setup/telix351.zip
cd ../TELIX
unzip ../telix_extract/TELIX351.DAT
rm -r /dos/drive_g/comm/telix_extract
mv -v /tmp/setup/TELIX.* /dos/drive_g/comm/TELIX/


# set up doors
cd /dos/drive_g
mkdir doors
cd doors
mkdir tw2002
cd tw2002
unzip /tmp/setup/doors/2002v309.zip
rm /tmp/setup/doors/2002v309.zip
cd ..
mkdir lord
cd lord
unzip -L /tmp/setup/doors/lord407.zip
rm /tmp/setup/doors/lord407.zip
unzip -L lord.zip
rm lord.zip
unzip -o -L /tmp/setup/doors/lord407-patch.zip
rm /tmp/setup/doors/lord407-patch.zip

