#!/bin/bash

which wine

if [ -z "${WINEPREFIX}" ]; then
    export WINEPREFIX=$HOME/EVE/eve-online
fi

export WINEARCH=win64
export STAGING_SHARED_MEMORY=1 WINEFSYNC_FUTEX2=1 WINEFSYNC=1 WINEDEBUG="-all"
export FREETYPE_PROPERTIES="truetype:interpreter-version=35"

export VK_DRIVER_FILES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json
export RADV_PERFTEST='aco,cswave32,dccmsaa,gewave32,pswave32,rtwave64,sam' RADV_TEX_ANISO=4

export VKD3D_CONFIG=force_host_cached VKD3D_DEBUG=none
export DXVK_HUD="fps,compiler" DXVK_LOG_LEVEL=none
export LD_BIND_NOW=1 ENABLE_VKBASALT=1 VKBASALT_LOG_LEVEL=error MANGOHUD=1

if [ "$#" -eq 0 ]; then
    wineserver -k 15; sleep 3;
fi
gamemoderun wine start "%USERPROFILE%\AppData\Local\eve-online\eve-online.exe" "$@"

# ps aux | grep eve-online | awk '{print $2}' | xargs -I{} kill -9 {}
# ps aux | grep "wine...?" | awk '{print $2}' | xargs -I{} kill -9 {}
