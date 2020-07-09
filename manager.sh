sudo apt-get update
sudo apt-get upgrade 

sudo apt-get remove -y docker docker-engine docker.io runc
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

docker swarm init --advertise-addr 192.168.122.14 

curl -L https://downloads.portainer.io/portainer-agent-stack.yml -o portainer-agent-stack.yml
docker stack deploy --compose-file=portainer-agent-stack.yml portainer

