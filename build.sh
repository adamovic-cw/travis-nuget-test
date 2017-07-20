#!/usr/bin/env bash

frameworkVersion=net45
netfx=${frameworkVersion#net}

echo "[INFO] Target framework: ${frameworkVersion}"

echo "[INFO] Download nuget and packages"
wget -nc https://nuget.org/nuget.exe;
mozroots --import --sync
mono nuget.exe install Travis.Nuget.Example/packages.config -o packages;

echo "[INFO] Copy DLLs to the 'bin' folder"
mkdir -p bin;
cp packages/RestSharp.105.2.3/lib/net45/RestSharp.dll bin/RestSharp.dll;

echo "[INFO] Run 'mcs' to build bin/Travis.Nuget.Example.dll"
mcs -sdk:${netfx} -r:bin/RestSharp.dll,\
System.ComponentModel.DataAnnotations.dll,\
System.Runtime.Serialization.dll \
-target:library \
-out:bin/Travis.Nuget.Example.dll \
-recurse:'Travis.Nuget.Example/*.cs' \
-doc:bin/Travis.Nuget.Example.xml \
-platform:anycpu

if [ $? -ne 0 ]
then
  echo "[ERROR] Compilation failed with exit code $?"
  exit 1
else
  echo "[INFO] bin/Travis.Nuget.Example.dll was created successfully"
fi