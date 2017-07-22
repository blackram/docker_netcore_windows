#!/bin/bash

if [ ! -d publish ]; then
  mkdir publish
fi
 
rm -rf publish/app
dotnet restore src/app/
dotnet publish src/app/ --output ../../publish/app
cp src/app.Dockerfile publish/app/app.Dockerfile