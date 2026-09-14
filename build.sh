#!/bin/bash
set -e

rm -rf build

echo "Restoring dotnet tools ..."
dotnet tool restore

echo "Building ..."
dotnet publish src/HelloSignPath -c Release -r win-x64 -o build

echo ""
echo "Creating SBOM ..."
dotnet dotnet-CycloneDX src/HelloSignPath/HelloSignPath.csproj \
  --output build --filename HelloSignPath.bom.json

echo ""
echo "Creating artifacts.zip ..."
(cd build && zip -r ../artifacts.zip .)
