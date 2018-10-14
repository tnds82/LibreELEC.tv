# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="minisatip"
PKG_VERSION="49b40ef3d7ee53da7a529883e7235adbc766ec84"
PKG_VERSION_NUMBER="0.7.16"
PKG_SHA256="e0540d8b2312dfb9408a4bab87510292803b8243ab8d3038fc4c91c111cb6af5"
PKG_REV="105"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/catalinii/minisatip"
PKG_URL="https://github.com/catalinii/minisatip/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain dvb-apps libdvbcsa libxml2"
PKG_SECTION="service"
PKG_SHORTDESC="minisatip: a Sat>IP streaming server for Linux"
PKG_LONGDESC="minisatip ( $PKG_VERSION_NUMBER ) : is a Sat>IP streaming server for Linux supporting DVB-C, DVB-S/S2 and DVB-T/T2"
PKG_AUTORECONF="yes"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Minisatip"
PKG_ADDON_TYPE="xbmc.service"

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-shared \
                           --disable-netceiver \
                           --disable-dvbca \
                           --with-xml2=/home/tnds/builds/tnds9/build.LibreELEC-Generic.x86_64-9.0-devel/libxml2-2.9.8"

pre_configure_target() {
  # minisatip fails to build in subdirs
  cd $PKG_BUILD
  rm -rf .$TARGET_NAME
}

pre_make_target() {
  #  export LIBS=""
  LDFLAGS="$LDFLAGS -lpthread -lcrypto"
}

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $PKG_BUILD/minisatip $ADDON_BUILD/$PKG_ADDON_ID/bin
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/webif
    cp -PR $PKG_BUILD/html/* $ADDON_BUILD/$PKG_ADDON_ID/webif
}
