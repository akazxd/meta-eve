#!/bin/bash

if [ -z "${WINEPREFIX}" ]; then
    export WINEPREFIX=$HOME/EVE/eve-online
fi

export WINEARCH=win64
# export PATH="$HOME/EVE/wine-9.15f/bin:$PATH"
export VK_DRIVER_FILES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json
export RADV_PERFTEST='aco,cswave32,dccmsaa,gewave32,pswave32,rtwave64,sam' RADV_TEX_ANISO=4
export LD_BIND_NOW=1 ENABLE_VKBASALT=1 DXVK_HUD="fps,compiler" DXVK_LOG_LEVEL=none VKD3D_DEBUG=none VKBASALT_LOG_LEVEL=error
export FREETYPE_PROPERTIES="truetype:interpreter-version=35"

# export DISPLAY=
export STAGING_SHARED_MEMORY=1 WINEFSYNC_FUTEX2=1 WINEFSYNC=1 WINEDEBUG="-all"
# $HOME/EVE/wine/bin/
wine explorer "%USERPROFILE%\AppData\Local\eve-online"

#"%USERPROFILE%\AppData\Local\eve-online\eve-online.exe" "%u"

# ps aux | grep eve-online | awk '{print $2}' | xargs -I{} kill -9 {}
