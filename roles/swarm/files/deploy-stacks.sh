#!/bin/sh

docker stack deploy --compose-file=/vagrant/roles/swarm/files/portainer-agent-stack.yml portainer
docker stack deploy --compose-file=/vagrant/roles/swarm/files/visualizer.yml visualizer