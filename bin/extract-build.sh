#!/usr/bash

cd ${RELEASE_VERSION}
tar -j sbcl-${RELEASE_VERSION}-source.tar.bz2
cd sbcl-${RELEASE_VERSION}-source
sh make.sh "${BOOTING_COMPILER" "${SBCL_BUILD_OPTIONS}"
