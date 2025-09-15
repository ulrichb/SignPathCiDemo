#!/bin/bash
set -ex

echo "Building ..."
dotnet publish src/HelloSignPath.csproj -c Release -r win-x64 -o build

echo ""
echo "Build output:"
ls -l build/*
