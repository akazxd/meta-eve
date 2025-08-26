pkgname=meta-eve
pkgver=2025.02
pkgrel=1
pkgdesc="The #1 Space MMO"
arch=('any')
url="https://www.eveonline.com/"
license=('custom:unknown')

# depends=( 'alsa-lib' 'alsa-plugins' 'giflib' 'gnutls' 'gst-plugins-base-libs' 'gtk3' 'libgphoto2' 'libldap' 'libva' 'libxcomposite' 'samba' 'mpg123' 'openal' 'opencl-icd-loader' 'sdl2' 'v4l-utils' 'vulkan-driver' 'vulkan-mesa-layers' 'vulkan-icd-loader' 'vulkan-radeon' 'vulkan-tools' 'wine' 'winetricks' 'vkbasalt' 'reshade-shaders-git')

depends=('vulkan-radeon' 'vkbasalt' 'reshade-shaders-git' 'gamemode' 'winetricks' 'vkd3d-proton-mingw-git' 'dxvk-mingw' 'ntsync-dkms' 'ntsync-header' 'mangohud')

optdepends=(vopono scx-scheds wine-tkg-staging-ntsync-git)
source=('https://launcher.ccpgames.com/eve-online/release/win32/x64/eve-online-latest+Setup.exe')
cksums=(SKIP)

__prepare(){
    sed -i.bak "s|_EXT_CONFIG_PATH=~/.config/frogminer/wine-tkg.cfg|_EXT_CONFIG_PATH=$srcdir/wine-tkg.cfg|" $srcdir/wine-tkg-git/wine-tkg-git/wine-tkg-profiles/advanced-customization.cfg
    cd wine-tkg-git/wine-tkg-git
    makepkg -si --asdeps
}

package() {
    true
}
