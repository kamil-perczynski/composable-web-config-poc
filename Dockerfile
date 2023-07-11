FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019
 
WORKDIR /inetpub/wwwroot/

COPY ./obj/Docker/publish/ .

EXPOSE 80

COPY entrypoint.ps1 /

ENTRYPOINT ["powershell", "-File", "/entrypoint.ps1"]
