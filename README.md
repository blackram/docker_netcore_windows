# docker_netcore_windows

These are some example setups for building .net core on windows. 
- Simple_copy uses a docker build step to copy the build output into the container image.


## Simple_Copy

This is an example of a .net core 1.1 app for Windows NanoServer.

  1. It demonstrates a difference between linux and windows currently in that the container address isn't bound to the host directly - have to run docker inspect to get the actual 
address which the go.sh script will report.
  2. .net core default project binds to 5000 and this can be passed in as an environment variable (not the only way to do it)
  3. This build is run in bash where the source is in one folder, the docker file is neatly in a nearby folder and the published files
  are kept in a disposable folder separate from the source.
  4. Because of the copying the build of the container is a little slow but it does work.
  5. The build is local to the machine
  
Steps to get it working:

- Navigate to /simple_copy

- Open bash (I used cmder on Windows 10)

```sh
sh go.sh
```

This is sample output (I had already downloaded the  microsoft/aspnetcore:1.1.2-nanoserver)

```sh
  Restoring packages for docker_netcore_windows\simple_copy\src\app\app.csproj...
  Lock file has not changed. Skipping lock file write. Path: docker_netcore_windows\simple_copy\src\app\obj\project.assets.json
  Restore completed in 702.12 ms for docker_netcore_windows\simple_copy\src\app\app.csproj.
  
  NuGet Config files used:
      AppData\Roaming\NuGet\NuGet.Config
      C:\Program Files (x86)\NuGet\Config\Microsoft.VisualStudio.Offline.config
  
  Feeds used:
      https://api.nuget.org/v3/index.json
      C:\Program Files (x86)\Microsoft SDKs\NuGetPackages\
Microsoft (R) Build Engine version 15.1.1012.6693
Copyright (C) Microsoft Corporation. All rights reserved.

  app -> docker_netcore_windows\simple_copy\src\app\bin\Debug\netcoreapp1.1\app.dll
Sending build context to Docker daemon  6.565MB

Step 1/7 : FROM microsoft/aspnetcore:1.1.2-nanoserver
 ---> f5b00df94299

Step 2/7 : MAINTAINER blackram@live.com.au
 ---> Using cache
 ---> e48c8cce60c9

Step 3/7 : WORKDIR /app
 ---> Using cache
 ---> aa3a3ee8e425

Step 4/7 : COPY . .
 ---> Using cache
 ---> b40d7d3a9e33

Step 5/7 : ENV ASPNETCORE_URLS http://+:5000
 ---> Using cache
 ---> 3671d8f095e1

Step 6/7 : EXPOSE 5000
 ---> Using cache
 ---> 4e07e4eb3f6e

Step 7/7 : ENTRYPOINT dotnet app.dll --server.urls http://0.0.0.0:5000
 ---> Using cache
 ---> 7956fbe39e4b

Successfully built 7956fbe39e4b

Successfully tagged app/latest:latest
app

app

ContainerId: bf440d9d8afb4c20088ce64686e2764baae68f3d670c49046351e583f65f6d67 (app)

172.20.163.52

5000/tcp -> 0.0.0.0:5000

``

Useful and reference links:

- http://cmder.net/
- https://hub.docker.com/r/microsoft/aspnetcore/
- http://iamnotmyself.com/2017/05/07/simplest-possible-asp-net-core-web-application-in-docker-for-windows/
- https://github.com/moby/moby/issues/15740#issuecomment-197407997 (Port Exposure)
- https://rominirani.com/docker-tutorial-series-a7e6ff90a023
