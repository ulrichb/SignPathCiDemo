#!/bin/bash
set -ex

echo "Restoring dotnet tools ..."
dotnet tool restore

echo "Building ..."
dotnet publish src/HelloSignPath -c Release -r win-x64 -o build

echo ""
echo "Creating SBOM ..."
dotnet dotnet-CycloneDX src/HelloSignPath/HelloSignPath.csproj \
  --output build --filename HelloSignPath.cdx.json

echo ""
echo "Build output:"
ls -l build/*
