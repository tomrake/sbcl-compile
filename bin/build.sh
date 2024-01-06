#!/usr/bash
echo "BOOTING_COMPILER=${BOOTING_COMPILER}"
echo "BOOTING_COMPILER_OPTIONS=${BOOTING_COMPILER_OPTIONS}"
BOOT_CONFIG="--xc-host=${BOOTING_COMPILER} ${BOOTING_COMPILER_OPTIONS}"
echo "BOOT_CONFIG=${BOOT_CONFIG}"
# SBCL_BUILD_LOCATION is set uniformly to location in the build-space where the build make.sh for sbcl is located.
cd "${SBCL_BUILD_LOCATION}"
echo "### UNAME: `uname` BUILD OPTIONS:  sh make.sh ${BOOT_CONFIG}" ${COMPILE_BUILD_OPTIONS} > "${BUILD_LOG}" 
sh make.sh "${BOOT_CONFIG}" ${COMPILE_BUILD_OPTIONS} | tee -a "${BUILD_LOG}"


