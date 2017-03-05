#!/bin/bash

rm -rf target/

>&2 echo "S802.arm"
PROJECT=S802 SYSTEM=S82 ARCH=arm make image -j8
PROJECT=S802 SYSTEM=M8 ARCH=arm make image -j8
PROJECT=S802 SYSTEM=T8 ARCH=arm make image -j8
PROJECT=S802 SYSTEM=MXIII-1G ARCH=arm make image -j8
>&2 echo "S805.arm"
PROJECT=S805 SYSTEM=HD18Q ARCH=arm make image -j8

rm target/*.kernel
rm target/*.system

