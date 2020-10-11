#!/bin/bash

set -e
set -u
set -x

ASSSEMBLIES=./bin/Debug/netstandard2.1/WasmAloneLab.dll

# From https://unowasmbootstrap.azureedge.net/runtime/mono-wasm-35c322c0198.zip
SDKDIR=~/bin/mono-wasm-35c322c0198

APPDIR=$(pwd)/wwwroot

mkdir -p $APPDIR

dotnet build

mono $SDKDIR/packager.exe --appdir=$APPDIR $ASSSEMBLIES

cp -a $SDKDIR/server.py $APPDIR/
cp -a index.html $APPDIR/
