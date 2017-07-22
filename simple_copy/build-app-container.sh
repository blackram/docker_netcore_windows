#!/bin/bash

# about: build the container

docker build -t app/latest ./publish/app -f ./publish/app/app.Dockerfile