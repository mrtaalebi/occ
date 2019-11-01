# occ

occ is a cli vpn tool (currently only supporting openconnect) which helps in several ways
</br>
## Features
* ### Save your time
  - **Saving username and password** so you don't have to enter them every time you try to connect to a vpn server
  - Separating urls into two parts, so you'll **never type the common part of vpnservers' urls** which is the same among all of them (server_postfix) and just type the first part (server_prefix) which is usually shorter
  </br>
* ### Make things easy
  - Wrap openconnect cert check so **you won't get troubled with a non-trusted cert-signature**
  - Short commandline arguments
  - Save all vpn servers available for you and **let occ choose one of them randomly** when you're not sure which one to connect
  </br>
* ### Connect to the best server
  - Possibility to **run a ping test on all available vpn servers** and choose the best one to connect
    - *let me know your ideas about how else could occ detect the best vpn server*
  </br>
    
## Get started
* ### Installation: you may choose one of the following methods
  - First method(automatic):
    - using curl:
      `sh -c "$(curl -fsSL https://raw.githubusercontent.com/mrtaalebi/occ/master/install.sh)"`
    - using wget:
      `sh -c "$(wget -O- https://raw.githubusercontent.com/mrtaalebi/occ/master/install.sh)"`
  - Second method(manual):
    - clone this repository by `git clone https://github.com/mrtaalebi/occ`
    - cd into occ directory (`cd occ`) then run `chmod +x install.sh && ./install.sh`
* ### Usage
  - Don't worry. occ has a **detailed and interactive cli**. Outputs make everything clear for you.
  - Just try one of the following to get started using occ:
    - `occ vpndata`
      - You may connect to a specific server using first format `occ <server-prefix>` next.
    - `occ vpnlist`
      - It'll open a file where you should put vpn servers' urls to use `occ best` and `occ rand` afterwards.
  - You may disconnect any time running `occ d`.
  </br>
    
    
## Also take a look at `occ -h|--help` output:

```
occ uses openconnect to connect and disconnect in a more suitable way :)

    make sure you have following pacakages installed (e.g. using apt install on ubuntu):
        openconnect

    usage:
        occ <server-prefix>    connects to vpn server at server_prefix.vpn_server_postfix
        occ best               connects to best vpn server (lowest ping) from vpnlist
        occ rand               connects to a random vpn server from vpnlist
        occ d                  disconnects!
        occ vpndata            updates vpn data (vpn_server_postfix, username, password)
        occ vpnlist            updates a file of all vpn servers available for current registered user
        occ -h|--help          shows this help

```
</br>
