#!/bin/bash

declare -A osInfo;
osInfo[/etc/debian_version]="apt-get install -y"
osInfo[/etc/alpine-release]="apk --update add"
osInfo[/etc/centos-release]="yum install -y"
osInfo[/etc/fedora-release]="dnf install -y"

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        package_manager=${osInfo[$f]}
    fi
done

${package_manager} git openconnect


git clone https://github.com/mrtaalebi/occ
cd occ

copy_to=/usr/bin/occ
if  [ -f $copy_to ] || [ -d $copy_to ]; then
    echo "a file or directory named occ already exists in $copy_to."
    echo "try checking and removing it before running installation script again."
    echo "exiting."
    exit 1
fi

sudo cp occ $copy_to
sudo chmod +x /usr/bin/occ
cd ..
rm -rf occ

echo
echo "occ successfully installed."
echo
occ

