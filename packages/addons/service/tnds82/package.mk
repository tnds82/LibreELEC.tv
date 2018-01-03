################################################################################
#      This file is part of LibreELEC - https://LibreELEC.tv
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

PKG_NAME="tnds82"
PKG_REV="2"
PKG_SITE="http://tnds82.xyz"
PKG_SECTION="service"
PKG_AUTORECONF="no"
PKG_ADDON_NAME="Tnds82 Add-ons"
PKG_SHORTDESC="$PKG_ADDON_NAME: add-on repository"
PKG_LONGDESC="$PKG_ADDON_NAME: add-on repository, provides Tvhwizard, Tvheadend42, OSCam, Plex Media Server, Lamp, 3rd Party Repositorys."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="tnds.service"
PKG_MAINTAINER="Tnds82 (tnds82)"

make_target() {
  : # nothing to do here
}

makeinstall_target() {
  : # nothing to do here
}

addon() {
  : # nothing to do here
}
