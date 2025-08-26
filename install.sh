#!/bin/bash

which wine

if [ -z "${WINEPREFIX}" ]; then
    export WINEPREFIX=$HOME/.wine
fi

set -a
source env.conf
set +a

echo 'Running Wine Config'
winecfg /v win11

echo 'Linking temp dirs to /tmp/'
rm -rf $WINEPREFIX/drive_c/users/$USER/Temp $WINEPREFIX/drive_c/windows/temp
ln -s /tmp/ $WINEPREFIX/drive_c/users/$USER/Temp
ln -s /tmp/ $WINEPREFIX/drive_c/windows/temp

echo 'Check Staging > Enable VAAPI as backend for DXVA2 GPU Decoding'
winecfg

echo 'Updating winetricks'
sudo winetricks --self-update

echo 'Installing dependencies'
winetricks -q vcrun2022 #dxvk vkd3d
setup_dxvk install
setup_vkd3d_proton install

echo 'Installing EVE Online'
wine 'eve-online-latest+Setup.exe'
