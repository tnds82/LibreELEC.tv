#!/bin/bash

rm -rf target/

>&2 echo "S802.arm"
PROJECT=S802 DEVICE=S82 ARCH=arm make image -j8
PROJECT=S802 DEVICE=M8 ARCH=arm make image -j8
PROJECT=S802 DEVICE=T8 ARCH=arm make image -j8
PROJECT=S802 DEVICE=MXIII-1G ARCH=arm make image -j8
>&2 echo "S805.arm"
PROJECT=S805 DEVICE=HD18Q ARCH=arm make image -j8

rm target/*.kernel
rm target/*.system

