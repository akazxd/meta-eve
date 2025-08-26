#!/bin/sh

export SUDO_ASKPASS=/usr/bin/ksshaskpass
part=/run/media/$USER/D

mountpoint -q $part || sudo -A  mount --mkdir -o uid=1000,gid=1000 /dev/nvme0n1p3  $part

mountpoint -q $part && XKB_DEFAULT_LAYOUT=de DXVK_CONFIG_FILE=~/makepkg/meta-eve/dxvk.conf DISPLAY= gamemoderun gamescope -f -W 1920 -H 1200 -w 1920 -h 1200  --expose-wayland --backend sdl -o 5 -- ~/makepkg/meta-eve/run.sh
#env -S "$(grep -E '^\s*[^#].+' $HOME/makepkg/meta-eve/env.conf | xargs -0)" wineconsole
# --prefer-vk-device 1002:1681 # amdgpu
# --prefer-vk-device 10de:25e0 # nvidia
