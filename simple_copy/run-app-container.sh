#!/bin/bash

docker stop app
docker rm app

#run the container in detached mode so that the console can still be used.
CONTAINERID=$(docker run -d --name app -p 5000:5000 app/latest)
echo "ContainerId: $CONTAINERID (app)"

# can use the containerid above or just the name 'app'
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' app

docker port app