FROM artifacts.rbi.tech/mcr.microsoft.com-docker-proxy/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019

#RUN ["$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
#RUN "msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi /qn"

# SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

#RUN "Invoke-WebRequest -UseBasicParsing https://s3.amazonaws.com/aws-cli/AWSCLI64PY3.msi -OutFile AWSCLI64PY3.msi"
#RUN "msiexec.exe /i AWSCLI64PY3.msi /qn /norestart -Wait -NoNewWindow"
#RUN "Remove-Item -Force AWSCLI64PY3.msi;"

# RUN Invoke-WebRequest -Uri "https://artifacts.rbi.tech/artifactory/awscli-amazonaws-com-raw-proxy/AWSCLIV2.msi" -Outfile AWSCLIV2.msi -UseBasicParsing
# RUN Start-Process "msiexec.exe"  -ArgumentList '/i', 'AWSCLIV2.msi', '/qn', '/norestart' -Wait -NoNewWindow
# RUN aws --version

# RUN "aws --version" 
 
WORKDIR /inetpub/wwwroot/

COPY ./obj/Docker/publish/ .

EXPOSE 80

WORKDIR "/"

COPY entrypoint.ps1 /

ENTRYPOINT ["powershell", "-File", "/entrypoint.ps1"]
