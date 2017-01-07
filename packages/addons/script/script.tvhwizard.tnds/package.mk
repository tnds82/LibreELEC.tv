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

PKG_NAME="script.tvhwizard.tnds"
PKG_VERSION="1.0.9"
PKG_REV="101"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.tnds82.xyz"
PKG_URL="https://github.com/tnds82/script.tvhwizard.tnds/archive/$PKG_VERSION.tar.gz"
PKG_SECTION=""
PKG_SHORTDESC="Tvh Wizard by Tnds: Configuration of TvHeadend 4.2 and OSCam in LibreELEC"
PKG_LONGDESC="Tvh Wizard by Tnds ($PKG_VERSION): Use this addon to configure TvHeadend 4.2 and OSCam only from LibreELEC interface with list of updated and organized channels (DVB-C, DVB-S "Hispasat") and the respective Picons. Create user administrator and / or client with password. Add DVBapi client"
PKG_AUTORECONF="no"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Tvh Wizard by Tnds"
PKG_ADDON_TYPE="dummy"
PKG_MAINTAINER="Tnds82 (tnds82)"


make_target() {
  : # nothing to do here
}

makeinstall_target() {
  : # nothing to do here
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID
  rm -r $PKG_BUILD/README.md; rm -r $PKG_BUILD/resources/fanart.png
  cp -PR $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID
}
