#!/usr/bash

echo "The module extract-build.sh is still used"
exit 1

echo "XC_HOST=${XC_HOST}"
echo "XC_HOST_OPTIONS=${XC_HOST_OPTIONS}"
BOOT_CONFIG="--xc-host=${XC_HOST} ${XC_HOST_OPTIONS}"
echo "BOOT_CONFIG=${BOOT_CONFIG}"
cd ${RELEASE_VERSION}
mkdir "${BUILD_LOCATION}"
tar -xf sbcl-${RELEASE_VERSION}-source.tar.bz2 -C "${BUILD_LOCATION}"
cd "${BUILD_LOCATION}/sbcl-${RELEASE_VERSION}"
echo "### UNAME: `uname` BUILD OPTIONS:  sh make.sh ${BOOT_CONFIG}" ${COMPILE_BUILD_OPTIONS} > "${BUILD_LOG}" 
sh make.sh "${BOOT_CONFIG}" ${COMPILE_BUILD_OPTIONS} | tee -a "${BUILD_LOG}"


