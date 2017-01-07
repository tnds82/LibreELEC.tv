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

PKG_NAME="plexmediaserver"
PKG_VERSION="1.3.3.3148"
PKG_VERSION_NUMBER="b38628e"
PKG_REV="100"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://plex.tv"
PKG_SECTION="service.multimedia"
PKG_SHORTDESC="Plex Media Server: Connects your Plex clients with all of your local and online media"
PKG_LONGDESC="Plex Media Server ($PKG_VERSION): organizes video, music and photos from personal media libraries and streams them to smart televisions, streaming boxes and mobile devices."
PKG_AUTORECONF="no"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Plex Media Server"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="Tnds82 (tnds82)"

case $ARCH in
  x86_64)
    PKG_URL="https://downloads.plex.tv/plex-media-server/$PKG_VERSION-$PKG_VERSION_NUMBER/$PKG_NAME-$PKG_VERSION-$PKG_VERSION_NUMBER.x86_64.rpm"
    ;;
  arm)
    PKG_URL="https://downloads.plex.tv/plex-media-server/$PKG_VERSION-$PKG_VERSION_NUMBER/PlexMediaServer-$PKG_VERSION-$PKG_VERSION_NUMBER-arm7.spk"
    ;;
esac

unpack() {
  mkdir -p $PKG_BUILD
  mkdir -p $PKG_BUILD/lib
}

make_target() {
  : # nop
}

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID

case $ARCH in
  x86_64)
    rpm2cpio $ROOT/$SOURCES/$PKG_NAME/$PKG_SOURCE_NAME | cpio -di
    rm -r $ROOT/etc
    rm -r $ROOT/lib
    cp -PR $ROOT/usr/lib/plexmediaserver/* $PKG_BUILD/lib
    rm -r $ROOT/usr
    ;;
  arm)
    mkdir -p $ROOT/$SOURCES/$PKG_NAME/PKG_REV
    tar -xf $ROOT/$SOURCES/$PKG_NAME/$PKG_SOURCE_NAME -C $ROOT/$SOURCES/$PKG_NAME/PKG_REV/
    tar -xf $ROOT/$SOURCES/$PKG_NAME/PKG_REV/package.tgz -C $PKG_BUILD/lib
    rm -r $PKG_BUILD/lib/dsm_config
    rm -r $ROOT/$SOURCES/$PKG_NAME/PKG_REV/
    ;;
esac

  cp -PR $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID
}
