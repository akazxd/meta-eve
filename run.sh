#!/bin/bash

which wine

if [ -z "${WINEPREFIX}" ]; then
    export WINEPREFIX=$HOME/.wine
fi


if [ "$#" -eq 0 ]; then
    wineserver -k 15; sleep 3;
fi
gamemoderun env -S "$(grep -E '^\s*[^#].+' $HOME/makepkg/meta-eve/env.conf | xargs -0)" wine start "%USERPROFILE%\AppData\Local\eve-online\eve-online.exe" "$@"

# sudo sysctl kernel.split_lock_mitigate=0
# sudo scx_lavd
# ps aux | grep eve-online | awk '{print $2}' | xargs -I{} kill -9 {}
# ps aux | grep "wine...?" | awk '{print $2}' | xargs -I{} kill -9 {}
