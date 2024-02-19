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

# CREATE BUILD_LOCATION
export BUILD_LOCATION="${SBCL_COMPILE_BUILDS}/${BUILD_NAME}"
echo "**** Definition of BUILD_LOCATION: ${BUILD_LOCATION}"   
mkdir "${BUILD_LOCATION}"

# CREATE BUILD_INFO
export BUILD_INFO="${BUILD_LOCATION}/info"
mkdir "${BUILD_INFO}"


# BEGIN INFO LOG
echo "#### DATE: `date +"%F_%T"` UNAME: `uname` LOG: ensure-build-container.sh" >> "${BUILD_INFO}/building.log.txt"
cp "${SBCL_COMPILE_SYSTEM}/bin/configuration.sh" "${BUILD_INFO}/`date +"%F_%T"`configuration.sh" 
