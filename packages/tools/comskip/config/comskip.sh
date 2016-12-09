#!/bin/sh
INI_FILE="/storage/.config/comskip/comskip.ini"

if [ -f "$PWD/comskip.ini" ]; then
  INI_FILE="$PWD/comskip.ini"
fi

nice -n 10 comskip --ini=$INI_FILE "$@"
