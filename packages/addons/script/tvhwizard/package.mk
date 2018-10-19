# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="tvhwizard"
PKG_VERSION="2.1.0"
PKG_VERSION_NUMBER="2.1.0"
PKG_REV=""
PKG_SHA256="1f78a2be2205cbf875ef0b4c790e0e223eebf3a43e49da23aeeb23d98e15ae87"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://addons.tnds82.xyz"
PKG_URL="https://github.com/tnds82/script.tvhwizard/archive/$PKG_VERSION_NUMBER.tar.gz"
PKG_DEPENDS_TARGET=""
PKG_SECTION="script"
PKG_SHORTDESC="script.tvhwizard"
PKG_LONGDESC="script.tvhwizard"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="dummy"

PKG_TOOLCHAIN="manual"

make_target() {
  $SED -e "s|@OS_VERSION@|$OS_VERSION|g" \
       -e "s|@PKG_VERSION_NUMBER@|$PKG_VERSION_NUMBER|g" \
       -e "s|@PKG_VERSION@|$PKG_VERSION|g" \
       -i addon.xml
}

makeinstall_target() {
  : # nothing to do here
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID
   cp -PR $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID
}
