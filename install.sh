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

git_inst=0
openconnect_inst=0
[ $(git --version | grep -Eci 'version') = 0 ] && git_inst=1
[ $(openconnect --version | grep -Eci 'version') = 0 ] && openconnect_inst=1

if [ $git_inst = 1 || $openconnect_inst = 1 ]; then
    if [ -z $package_manager ]; then
        echo "unknown linux distro".
        echo "try installing git and openconnect with your package manager"
        echo "then run ./install.sh"
        echo "exiting."
        exit
    fi
    [ git_intst = 1 ] && $package_manager git
    [ openconnect_inst = 1 ] && $package_manager openconnect
fi


git clone https://github.com/mrtaalebi/occ
cd occ

copy_to=/usr/bin/occ
if  [ -f $copy_to ] || [ -d $copy_to ]; then
    echo
    echo "a file or directory named occ already exists in $copy_to."
    echo "try checking and removing it before running installation script again."
    echo "ABORTING INSTALLATION."
    echo
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

