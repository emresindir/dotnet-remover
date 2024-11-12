#!/bin/bash
component=$1
version=$2

if [ -z $component ] 
then
	echo "You should pass which dotnet component you want to remove as first argument. sdk or runtime"
	exit 0
fi

if [ -z $version ]
then
	echo "Verison can not be null. please pass the version info as second argument."
	exit 0
fi

if [ $component = 'sdk' ]
then
	if [ -d "/usr/local/share/dotnet/sdk/$version" ]
	then
		sudo rm -rf /usr/local/share/dotnet/sdk/$version
		sudo rm -rf /usr/local/share/dotnet/sdk-manifests/$version
	else
		echo "Specified SDK version does not exist. Check installed dotnet versions via dotnet --info command."
		exit 0
	fi
elif [ $component = 'runtime' ]
then
	if [ -d "/usr/local/share/dotnet/packs/Microsoft.NETCore.App.Ref/$version" ]
        then

		sudo rm -rf /usr/local/share/dotnet/host/fxr/$version
		sudo rm -rf /usr/local/share/dotnet/packs/Microsoft.AspNetCore.App.Ref/$version
		sudo rm -rf /usr/local/share/dotnet/packs/Microsoft.NETCore.App.Host.osx-x64/$version
		sudo rm -rf /usr/local/share/dotnet/packs/Microsoft.NETCore.App.Ref/$version
		sudo rm -rf /usr/local/share/dotnet/packs/NETStandard.Library.Ref/$version
		sudo rm -rf /usr/local/share/dotnet/shared/Microsoft.AspNetCore.All/$version
		sudo rm -rf /usr/local/share/dotnet/shared/Microsoft.AspNetCore.App/$version
		sudo rm -rf /usr/local/share/dotnet/shared/Microsoft.NETCore.App/$version
		sudo rm -rf /usr/local/share/dotnet/templates/$version
	else
		echo "Specified Runtime version does not exist.! Check installed dotnet versions via dotnet --info command."
		exit 0
	fi
fi
echo $component $version successfuly removed.!
