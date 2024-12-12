#!/bin/bash

export WINEARCH=win64
export WINEPREFIX=$HOME/EVE/eve-online

echo 'Running Wine Config'
winecfg /v win11

echo 'Linking temp dirs to /tmp/'
rm -rf $WINEPREFIX/drive_c/users/$USER/Temp $WINEPREFIX/drive_c/windows/temp
ln -s /tmp/ $WINEPREFIX/drive_c/users/$USER/Temp
ln -s /tmp/ $WINEPREFIX/drive_c/windows/temp

echo 'Installing dependencies'
winetricks -q vcrun2022 dxvk vkd3d

echo 'Check Staging > Enable VAAPI as backend for DXVA2 GPU Decoding'
winecfg

echo 'Installing EVE Online'
wine 'eve-online-latest+Setup.exe'
