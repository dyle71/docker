#!/usr/bin/env bash
docker volume create portainer_data
docker rm -f portainer &> /dev/null
docker run -d -p 19443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
if [[ $? = 0 ]]; then
    echo "Portainer started at https://localhost:19443."
fi

