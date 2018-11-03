# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="tvhwizard"
PKG_VERSION="2.0.89a"
PKG_VERSION_NUMBER="2.0.9a"
PKG_REV=""
PKG_SHA256="c3a1ca6a4b78c0ca026bf29ef39f8cf48dd4e6afc61fb4fcbe2b8f56c6a2884e"
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
