#!/usr/bash
#### The location of the booting compiler



export GNUMAKE="c:/devel/msys64/ucrt64/bin/mingw32-make.exe"

## This is where the directory where the project is to be built in.
export BUILD_LOG=build-log.txt

export TEST_LOG=test-log.txt

export ANSI_TEST_LOG=ansi-test-log.txt

if [ ! -f "${XC_HOST}" ] ; then
    echo "XC_HOST:$XC_HOST is not defined."
    exit 1
fi
echo "XC_HOST=${XC_HOST}"
echo "XC_HOST_OPTIONS=${XC_HOST_OPTIONS}"
BOOT_CONFIG="--xc-host=${XC_HOST} ${XC_HOST_OPTIONS}"
echo "BOOT_CONFIG=${BOOT_CONFIG}"
# SBCL_BUILD_LOCATION is set uniformly to location in the build-space where the build make.sh for sbcl is located.
if [ ! -d "${BUILD_LOCATION}" ] ; then
    echo "build location ${BUILD_LOCATION} is not a directory."
    exit 1
fi
cd "${BUILD_LOCATION}"
echo "### UNAME: `uname` BUILD OPTIONS:  sh make.sh ${BOOT_CONFIG}" ${COMPILE_BUILD_OPTIONS} > "${BUILD_LOG}" 
sh make.sh "${BOOT_CONFIG}" ${COMPILE_BUILD_OPTIONS} | tee -a "${BUILD_LOG}"


