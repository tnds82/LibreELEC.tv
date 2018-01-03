#!/usr/bin/env python
################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-2017 Team LibreELEC
#      Copyright (C) 2017 Tnds82 (tndsrepo@gmail.com)
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

from urlparse import urlparse
import xbmc
import xbmcaddon
import xbmcgui
import xml.etree.ElementTree as etree

REPO_LE = 'repository.libreelec.tv'
REPO_TNDS = 'http://tnds82.xyz/tnds_addons/'

try:
  addon = xbmcaddon.Addon()
  strings = addon.getLocalizedString

  xml_le = xbmcaddon.Addon(REPO_LE).getAddonInfo('path') + '/addon.xml'
  path = urlparse(etree.parse(xml_le).iter(tag='datadir').next().text).path.strip('/').split('/')
  vpa = path[-3] + '/' +  path[-2] + '/' +  path[-1] + '/'
  new = REPO_TNDS + vpa
  
  xml_tnds = addon.getAddonInfo('path') + '/addon.xml'
  xml = etree.parse(xml_tnds)
  old = xml.iter(tag='datadir').next()
  xbmc.executebuiltin('UpdateAddonRepos')
  if old.text == new:
    addon.setSetting('vpa', vpa)
  else:
    addon.setSetting('vpa', strings(30020))
    old.text = new
    xml.iter(tag='info').next().text = new + 'addons.xml'
    xml.iter(tag='checksum').next().text = new + 'addons.xml.md5'
    xml.write(xml_tnds)
    if xbmcgui.Dialog().yesno(addon.getAddonInfo('name'),
                              strings(30010),
                              strings(30011),
                              nolabel=strings(30012),
                              yeslabel=strings(30013)) == False:
      xbmc.executebuiltin('Reboot')

except:
  addon.setSetting('vpa', strings(30021))
