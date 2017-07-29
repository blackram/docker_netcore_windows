FROM microsoft/aspnetcore:1.1.2-nanoserver
ARG source=obj/Docker
ARG http_port=80

WORKDIR /inetpub/wwwroot

COPY ${source} .

ENV ASPNETCORE_URLS=http://+:${http_port}
EXPOSE ${http_port}

ENTRYPOINT ["dotnet", "WebUI.dll","--server.urls", "http://0.0.0.0:${http_port}"]
