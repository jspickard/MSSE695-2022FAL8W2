# MSSE695-2022FAL8W2
The repo is being used to aid in the Research and Development (R&D) of containerization by using the NextCloud Free Open Source Software (FOSS) as the main service of installation. This repo adds a self-signed certificate to implement SSL and the https protocol upon application launch to the existing content described from this website:
https://opensourcetechtrn.blogspot.com/2021/07/nextcloud-in-docker.html

# Prereqs
- An OS with an known pingable IP address that can install Docker (if there are port restrictions, allow 8081 at a minimum).
- Docker is installed.
```shell
# Ubuntu Server 18.04.6 LTS 64-bit
curl -fsSL get.docker.com | sudo sh
```

# Installation instructions
## Run the following commands
- Ubuntu Server 18.04.6 LTS 64-bit
```shell
mkdir $HOME/nextcloud
mkdir $HOME/nextcloud/data
mkdir $HOME/nextcloud/data/dockerfile
mkdir $HOME/nextcloud/datadb
cd $HOME/nextcloud/data
git clone https://github.com/jspickard/MSSE695-2022FAL8W2.git
cd ./MSSE695-2022FAL8W2/nextcloud-js/dockerfile
chmod 700 ./nextcloud-ssl-js.sh
docker build -t nextcloud-js .
cd ..
docker-compose up
```

# Operating instructions
- Open a browser and goto the following link (replace ###.###.###.### with the OS's known IP address)
https://###.###.###.###:8081
- Follow the NextCloud prompts for proper setup (additional features may require more ports to be open).

# Copyright and licensing information.
The owner of this repo does not own NextCloud; these files are intended to aid in the R&D of containerization only.

# Contact information for the distributor or programmer.
James Spickard, jspickard@regis.edu

# Known bugs.
{TBD}

# Troubleshooting.
{TBD}