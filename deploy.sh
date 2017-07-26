#!/usr/bin/env bash

mono nuget.exe pack Travis.Nuget.Example/Travis.Nuget.Example.nuspec -Version $TEST_VERSION -Verbosity detailed && \
mono nuget.exe push Travis.Nuget.Example.$TEST_VERSION.nupkg -ApiKey $NUGET_API_KEY -Verbosity detailed -Source nuget.org
