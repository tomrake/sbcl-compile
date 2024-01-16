#! /bin/bash

if [ ! -d  "${SBCL_COMPILE_BUILDS}" ] ; then
    echo "sbcl_compile builds ${SBCL_COMPILE_BUILDS} is not found"
    exit 1
fi

if [ -z "${BUILD_NAME}" ] ; then
    echo "The build name ${BUILD_NAME} is empty"
    exit 1
fi
export BUILD_LOCATION="${SBCL_COMPILE_BUILDS}/${BUILD_NAME}"
   
mkdir "${BUILD_LOCATION}"
