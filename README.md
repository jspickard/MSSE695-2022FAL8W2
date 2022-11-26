# Custom SSL image build files for NextCloud container
- James Spickard
- Regis University
- MSSE695 - Software Engineering Res & Dev
- Fall 2022 8 Week 2 Semester
- Doctor Kevin Pyatt
- Due date: 12/11/2022

## Description
This repo is being used to aid in the Research and Development (R&D) of containerization by using the NextCloud Free Open Source Software (FOSS) as the main service of installation. This repo adds a self-signed certificate to implement SSL and the https protocol upon application launch to the existing content described in [Reference](https://github.com/jspickard/MSSE695-2022FAL8W2#references) 1.

## What's Required
- A test computer connected to a local network with an internet browser (i.e.: Windows 10 Home Version 21H2 with Edge 64-bit Version 107.0.1418.52 was used for the main test.)
- A server with the following:
1.  An Operating System (OS) that can install Docker.
2.  A known pingable IP address on a local network.
```shell
# Ubuntu Server 18.04.6 LTS 64-bit
# Fedora 37 Server x86_64 
ip a    # get IP here then ping from test computer (i.e.: Windows 10 command prompt "ping 192.168.238.131")

```
3.  If the server has port restrictions, allow 8081 at a minimum.
4. Docker and Docker-Compose is installed.
```shell
# Ubuntu Server 18.04.6 LTS 64-bit
# Fedora 37 Server x86_64 
curl -fsSL get.docker.com | sudo sh
systemctl start docker    # Fedora it did not start automatically

```
```shell
# Ubuntu Server 18.04.6 LTS 64-bit
apt  install docker-compose

```
```shell
# Fedora 37 Server x86_64 
dnf install docker-compose

```
5. Other installations may be required throughout (i.e.: git); install as needed.
```shell
# Fedora 37 Server x86_64 
dnf install git-all

```

## Installation instructions
#### Notes: 
- Example commands have been provided. Use what is relative to your OS. 
- Elevated privledges are assumed (including "sudo"). 
### Steps
1. Make the required directories.
```shell
# Ubuntu Server 18.04.6 LTS 64-bit
# Fedora 37 Server x86_64 
mkdir $HOME/nextcloud
mkdir $HOME/nextcloud/data
mkdir $HOME/nextcloud/data/dockerfile
mkdir $HOME/nextcloud/datadb

```
2. Enter into new dir and clone this git.
```shell
# Ubuntu Server 18.04.6 LTS 64-bit
# Fedora 37 Server x86_64 
cd $HOME/nextcloud/data
git clone https://github.com/jspickard/MSSE695-2022FAL8W2.git


```
3. Enter into dockerfile dir and change permissions on dependent script.
```shell
# Ubuntu Server 18.04.6 LTS 64-bit
# Fedora 37 Server x86_64 
cd ./MSSE695-2022FAL8W2/nextcloud-js/dockerfile
chmod 700 ./nextcloud-ssl-js.sh

```
4. Build docker image.
```shell
# Ubuntu Server 18.04.6 LTS 64-bit
# Fedora 37 Server x86_64 
docker build -t nextcloud-js .

```
5. Run container from image.
```shell
# Ubuntu Server 18.04.6 LTS 64-bit
# Fedora 37 Server x86_64 
cd ..
docker-compose up

```

## Operating instructions
- Open a browser on your test computer and goto the following link (replace ###.###.###.### with the OS's known IP address)
https://###.###.###.###:8081
- Acknowledge the "NET::ERR_CERT_AUTHORITY_INVALID" self-signed cert warning and proceed.
- Follow the NextCloud prompts for proper setup (additional features may require more ports to be open).

## Copyright and licensing information.
The owner of this repo does not own NextCloud; these files are intended to aid in the R&D of containerization only.

## Contact information for the distributor or programmer.
James Spickard, jspickard@regis.edu

## Known bugs/issues.
1.  The Non-SSL site http://###.###.###.###:8080 was disabled for this demonstration. Redirection with containers proved difficult using the existing port route configuration. The following guide should be referenced for information on redirect.
https://www.namecheap.com/support/knowledgebase/article.aspx/9821/38/apache-redirect-to-https/

## Troubleshooting.
1. If necessary, delete the git repo dir, stop and remove all containers, then restart from step 2 in the instructions.
```shell
# Ubuntu Server 18.04.6 LTS 64-bit
# Fedora 37 Server x86_64 
docker stop $(docker ps -a -q)    # stop all containers
docker rm $(docker ps -a -q)    # remove all containers
cd $HOME/nextcloud/data
sudo rm -r ./MSSE695-2022FAL8W2    # delete copied git dir
docker image prune -a    # remove all images
# If need to delete admin account and redo setup, delete/rename datadb and data dirs from Step 1

```

## References
1. Open Source Tech Training. (2021, July 27). Nextcloud in Docker! opensourcetechtrn.blogspot.com. https://opensourcetechtrn.blogspot.com/2021/07/nextcloud-in-docker.html 
