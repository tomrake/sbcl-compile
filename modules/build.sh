#!/usr/bash

# make the build.
# Check that few items have been defined and then build.

#######################################################################

### This is an msys2 specific item

### See sbcl source:  INSTALL 2.3 Troubleshooting "GNU Make not found"

export GNUMAKE="c:/devel/msys64/ucrt64/bin/mingw32-make.exe"

#######################################################################

## This is where the directory where the project is to be built in.
export BUILD_LOG=build-log.txt

export TEST_LOG=test-log.txt

export ANSI_TEST_LOG=ansi-test-log.txt

# Not having make.sh in the MAKE_LOCATION is an error

if [ !  -f "${MAKE_LOCATION}/make.sh" ] ; then
    echo "Could not locate make.sh in make location: ${MAKE_LOCATION}"
    exit 1
fi

# Not having an XC_HOT is an error

if [ ! -f "${XC_HOST}" ] ; then
    echo "XC_HOST:$XC_HOST is not defined."
    exit 1
fi
echo "XC_HOST=${XC_HOST}"
echo "XC_HOST_OPTIONS=${XC_HOST_OPTIONS}"
BOOT_CONFIG="--xc-host=${XC_HOST} ${XC_HOST_OPTIONS}"
echo "BOOT_CONFIG=${BOOT_CONFIG}"

# build because For release source orthe  git source  MAKE_LOCATION should be correctly set. 


cd "${MAKE_LOCATION}"
echo "### DATE: `date +"%F_%T"` UNAME: `uname` BUILD OPTIONS:  sh make.sh ${BOOT_CONFIG}" ${COMPILE_BUILD_OPTIONS} > "${BUILD_INFO}/${BUILD_LOG}" 
sh make.sh "${BOOT_CONFIG}" ${COMPILE_BUILD_OPTIONS} | tee -a "${BUILD_INFO}/${BUILD_LOG}"


cd "${SBCL_COMPILE_SYSTEM}"
