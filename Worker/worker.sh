sudo apt-get update
sudo apt-get upgrade 

sudo apt-get remove -y docker docker-engine docker.io runc
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker


docker swarm join --token SWMTKN-1-01y8ba4esviwwllq26eu9ijtb1fweksugum1aovi7285ze2ezt-evwywmh5rqnbtd7oyho42ni6g 192.168.36.100:2377




