#! /bin/bash

if [ ! -d  "${SBCL_COMPILE_BUILDS}" ] ; then
    echo "sbcl_compile builds ${SBCL_COMPILE_BUILDS} is not found"
    exit 1
else
    echo "VALID SBCL_COMPILE_BUILDS: ${SBCL_COMPILE_BUILDS}"
fi

if [ -z "${BUILD_NAME}" ] ; then
    echo "The build name ${BUILD_NAME} is empty"
    exit 1
else
    echo "VALID BUILD_NAME: ${BUILD_NAME}"
fi

export BUILD_LOCATION="${SBCL_COMPILE_BUILDS}/${BUILD_NAME}"
echo "**** Definition of BUILD_LOCATION: ${BUILD_LOCATION}"   
mkdir "${BUILD_LOCATION}"
