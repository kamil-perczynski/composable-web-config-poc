if ($env:APPSETTINGS_XML) {
  echo "Overriding appsettings.xml with environent variable"
  echo $env:APPSETTINGS_XML | Out-File -FilePath .\appsettings.xml
}

if ($env:CONNECTIONSTRINGS_XML) {
  echo "Overriding connectionstrings.xml with environent variable"
  echo $env:CONNECTIONSTRINGS_XML | Out-File -FilePath .\connectionstrings.xml
}

C:\ServiceMonitor.exe w3svc
