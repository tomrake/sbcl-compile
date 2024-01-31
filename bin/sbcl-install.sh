#!/bin/bash

if [ ! -d "${INSTALL_LOCATION}" ] ; then
    echo "Install location is not found: ${INSTALL_LOCATION}"
    exit 1
fi
mkdir "${INSTALL_LOCATION}/${RELEASE_VERSION}"
INSTALL_ROOT="${INSTALL_LOCATION}/${RELEASE_VERSION}/${BUILD_NAME}"
mkdir "${INSTALL_ROOT}"

cd "${MAKE_LOCATION}"
sh install.sh --prefix="${INSTALL_ROOT}"

cd "${SBCL_COMPILE_SYSTEM}"

