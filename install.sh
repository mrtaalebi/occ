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
sudo cp occ /usr/bin/occ
sudo chmod +x /usr/bin/occ

echo
echo "occ successfully installed."
echo
occ

