################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="libretro-hatari"
PKG_VERSION="e99678b"
PKG_SHA256="a1d4d5aad156147455b9eb70307d8bb471a65f157c1140d94593477146882479"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/hatari"
PKG_URL="https://github.com/libretro/hatari/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="hatari-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION="emulation"
PKG_SHORTDESC="game.libretro.hatari: hatari for Kodi"
PKG_LONGDESC="game.libretro.hatari: hatari for Kodi"
PKG_AUTORECONF="no"
PKG_IS_ADDON="no"
PKG_USE_CMAKE="no"

PKG_LIBNAME="hatari_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="HATARI_LIB"

configure_target(){
  :
}

make_target() {
  cd $PKG_BUILD
  make -f Makefile.libretro
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}

