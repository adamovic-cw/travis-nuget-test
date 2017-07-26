#!/usr/bin/env bash

wget -nc https://nuget.org/nuget.exe
mozroots --import --sync

echo "[INFO] remove Travis.Nuget.Example.Test/bin/Debug/Travis.Nuget.Example.dll"
rm Travis.Nuget.Example.Test/bin/Debug/Travis.Nuget.Example.Test.dll 2> /dev/null

echo "[INFO] install NUnit runners via NuGet"
wget -nc https://dist.nuget.org/win-x86-commandline/v4.1.0/nuget.exe;
mozroots --import --sync
mono nuget.exe install Travis.Nuget.Example.Test/packages.config -o packages

echo "[INFO] Install NUnit runners via NuGet"
mono nuget.exe install NUnit.Runners -Version 2.6.4 -OutputDirectory packages

echo "[INFO] Build the solution and run the unit test"
msbuild Travis.Nuget.Example.sln && \
    mono ./packages/NUnit.Runners.2.6.4/tools/nunit-console.exe Travis.Nuget.Example.Test/bin/Debug/Travis.Nuget.Example.Test.dll
