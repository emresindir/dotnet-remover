# dotnet-remover
This is a bash script for removes specified dotnet sdk and runtimes from the macOS system.

Instructuons: 
  First argument is component of the dotnet distribution. Accepted values [sdk, runtime]
  Second argument is version number of the specified component. 

  You can use dotnet --info command to list installed dotnet components on your system.

Usage:

  # dotnet-remove sdk 7.0.101
  # dotnet-remove runtime 7.0.1
