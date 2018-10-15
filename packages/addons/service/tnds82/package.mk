PKG_NAME="tnds82"
PKG_REV="4"
PKG_SITE="https://addons.tnds82.xyz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Tnds82 Add-ons"
PKG_ADDON_TYPE="tnds.service"
PKG_MAINTAINER="Tnds82 (tnds82)"
PKG_SHORTDESC="$PKG_ADDON_NAME: add-on repository"
PKG_LONGDESC="$PKG_ADDON_NAME: add-on repository, provides Tvhwizard, Tvheadend42, OSCam, Plex Media Server, Lamp, 3rd Party Repositorys."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_TOOLCHAIN="manual"

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID"
}