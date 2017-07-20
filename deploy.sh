#!/usr/bin/env bash

mono nuget.exe pack Travis.Nuget.Example/Travis.Nuget.Example.nuspec -Version $TEST_VERSION -Verbosity detailed && \
mono nuget.exe push *.nupkg -ApiKey $NUGET_API_KEY -Verbosity detailed
