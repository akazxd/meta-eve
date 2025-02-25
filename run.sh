#!/bin/bash

export PATH="$HOME/makepkg/meta-eve/wine-10/bin:$PATH"
which wine

if [ -z "${WINEPREFIX}" ]; then
    export WINEPREFIX=$HOME/EVE/eve-online
fi

# wine vars
export WINEARCH=win64
export STAGING_SHARED_MEMORY=1 WINEFSYNC_FUTEX2=1 WINEFSYNC=1 WINEDEBUG="-all"
export FREETYPE_PROPERTIES="truetype:interpreter-version=35"

# radv vars
export VK_DRIVER_FILES='/usr/share/vulkan/icd.d/radeon_icd.x86_64.json'
export RADV_PERFTEST='aco,cswave32,dccmsaa,gewave32,pswave32,rtwave64,sam' RADV_TEX_ANISO=4

# nvidia vars
# export VK_DRIVER_FILES='/usr/share/vulkan/icd.d/nvidia_icd.json'
# export __GL_LOG_MAX_ANISO=4 __GL_SHOW_GRAPHICS_OSD=1 MESA_GLSL_CACHE_MAX_SIZE=512 __NV_PRIME_RENDER_OFFLOAD=1 __GL_SYNC_TO_VBLANK=0

# vkd3d vars
export VKD3D_CONFIG=force_host_cached VKD3D_DEBUG=none VKD3D_FRAME_RATE=60 VK_MESA_image_alignment_control=1
export VKD3D_SWAPCHAIN_LATENCY_FRAMES=2 RADV_DEBUG=novrsflatshading VKD3D_CONFIG=no_upload_hvv VKD3D_CONFIG=no_staggered_submit

# dxvk vars
export DXVK_STATE_CACHE=1 DXVK_SHADER_OPTIMIZE=1 WINE_DISABLE_WRITE_WATCH=1 DXVK_FRAME_RATE=60 DXVK_HUD="compiler" DXVK_LOG_LEVEL=none
export DXVK_CONFIG_FILE="$HOME/makepkg/meta-eve/dxvk.conf"

# extra vars
export LD_BIND_NOW=1 ENABLE_VKBASALT=1 VKBASALT_LOG_LEVEL=error MANGOHUD=1

if [ "$#" -eq 0 ]; then
    wineserver -k 15; sleep 3;
fi
gamemoderun wine64 start "%USERPROFILE%\AppData\Local\eve-online\eve-online.exe" "$@"

# sudo scx_lavd
# ps aux | grep eve-online | awk '{print $2}' | xargs -I{} kill -9 {}
# ps aux | grep "wine...?" | awk '{print $2}' | xargs -I{} kill -9 {}
