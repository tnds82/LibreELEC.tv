# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="plexmediaserver"
PKG_VERSION="1.13.9.5456"
PKG_VERSION_NUMBER="ecd600442"
PKG_REV="108"
PKG_ARCH="x86_64 arm"
PKG_LICENSE="GPL"
PKG_SITE="http://plex.tv"
PKG_SECTION="service"
PKG_SHORTDESC="Plex Media Server: Connects your Plex clients with all of your local and online media"
PKG_LONGDESC="Plex Media Server ($PKG_VERSION): organizes video, music and photos from personal media libraries and streams them to smart televisions, streaming boxes and mobile devices."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Plex Media Server"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="Tnds82 (tnds82)"

PKG_TOOLCHAIN="manual"

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

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID

case $ARCH in
  x86_64)
    rpm2cpio $SOURCES/$PKG_NAME/$PKG_SOURCE_NAME | bsdtar -xf -
    sudo rm -r $ROOT/etc
    sudo rm -r $ROOT/lib
    sudo cp -PR $ROOT/usr/lib/plexmediaserver/* $PKG_BUILD/lib
    sudo rm -r $ROOT/usr
    ;;
  arm)
    mkdir -p $SOURCES/$PKG_NAME/PKG_REV
    tar -xf $SOURCES/$PKG_NAME/$PKG_SOURCE_NAME -C $SOURCES/$PKG_NAME/PKG_REV/
    tar -xf $SOURCES/$PKG_NAME/PKG_REV/package.tgz -C $PKG_BUILD/lib
    sudo rm -r $PKG_BUILD/lib/dsm_config
    sudo rm -r $SOURCES/$PKG_NAME/PKG_REV/
    ;;
esac

  cp -PR $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID
}
