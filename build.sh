#!/bin/bash

rm -rf target/

>&2 echo "S802.arm"
PROJECT=S802 DEVICE=S82 ARCH=arm make image -j9
PROJECT=S802 DEVICE=M8 ARCH=arm make image -j9
PROJECT=S802 DEVICE=T8 ARCH=arm make image -j9
PROJECT=S802 DEVICE=MXIII-1G ARCH=arm make image -j9
>&2 echo "S805.arm"
PROJECT=S805 DEVICE=HD18Q ARCH=arm make image -j9
PROJECT=S805 DEVICE=M201C ARCH=arm make image -j9
PROJECT=S805 DEVICE=MK808B-Plus ARCH=arm make image -j9
PROJECT=S805 DEVICE=MXQ ARCH=arm make image -j9

rm target/*.kernel
rm target/*.system

for f in target/*; do
  md5sum $f > $f.md5
  sha256sum $f > $f.sha256
done

for f in target/*; do
  dir=`echo $f | sed -e 's/target\/LibreELEC-\(.*\)-\(.*\)-devel-\(.*\)/\1/'`
  mkdir -p target/$dir
  mv $f target/$dir/
done

