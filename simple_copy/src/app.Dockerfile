FROM microsoft/aspnetcore:1.1.2-nanoserver
MAINTAINER blackram@live.com.au

WORKDIR /app
COPY . .

ENV ASPNETCORE_URLS=http://+:5000
EXPOSE 5000

ENTRYPOINT ["dotnet", "app.dll","--server.urls", "http://0.0.0.0:5000"]


