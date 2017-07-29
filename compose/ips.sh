#!/bin/bash
# usage : sh ips.sh <containeridentifier>
# about : Windows docker clients aren't mounted on localhost. Have to get their internal IP addresses
#         to access any ports. This script uses 'docker inspect' to get this information.

if [ $1 ] 
then
  docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $1
else
  docker inspect --format='{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
fi

# refer to https://stackoverflow.com/questions/17157721/how-to-get-a-docker-containers-ip-address-from-the-host