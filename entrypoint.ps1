if ($env:APPSETTINGS_XML) {
  echo "Overriding appsettings.xml with environent variable: $env:APPSETTINGS_XML"
  $env:APPSETTINGS_XML | Out-File -FilePath ".\appsettings.xml" -Encoding UTF8
}

if ($env:CONNECTIONSTRINGS_XML) {
  echo "Overriding connectionstrings.xml with environent variable: $env:CONNECTIONSTRINGS_XML"
  $env:CONNECTIONSTRINGS_XML | Out-File -FilePath ".\connectionstrings.xml" -Encoding UTF8
}

C:\ServiceMonitor.exe w3svc
