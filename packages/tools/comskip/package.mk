################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="comskip"
PKG_VERSION="b9b50f"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="LGPLv2.1+"
PKG_SITE="https://github.com/erikkaashoek/Comskip"
PKG_URL="https://github.com/erikkaashoek/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain argtable2 ffmpeg"
PKG_PRIORITY="optional"
PKG_SECTION="multimedia"
PKG_SHORTDESC="comskip"
PKG_LONGDESC="comskip"

PKG_SOURCE_DIR="Comskip*"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

post_unpack () {
  sed -i '/^.*mtune.*$/d' $PKG_BUILD/Makefile.am
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config/comskip
  cp -R $PKG_DIR/config/* $INSTALL/usr/config/comskip
}
