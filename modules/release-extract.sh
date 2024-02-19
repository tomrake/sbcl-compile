#!/usr/bash

# This expands the released source into the build location.
# The MAKE_LOCATION is defined from the BUILD_LOCATION and the RELEASE_VERSION.

# No defined location to build  is an error
if [ ! -d "${BUILD_LOCATION}" ] ; then
    echo  "Can't extract release source into ${BUILD_LOCATION}."
    exit 1
else
    echo "BUILD_LOCATION: ${BUILD_LOCATION}"
fi
COMPRESSED_SOURCE="${SBCL_COMPILE_RELEASES}/${RELEASE_VERSION}/sbcl-${RELEASE_VERSION}-source.tar.bz2"

# No defined file to be expanded is an error.
if [ ! -f "${COMPRESSED_SOURCE}" ] ; then
    echo "Cannot find compressed release source: ${COMPRESSED_SOURCE}"
    exit 1
else
    echo "COMPRESSED_SOURCE: ${COMPRESSED_SOURCE}"
fi

tar -xf "${COMPRESSED_SOURCE}" -C "${BUILD_LOCATION}"

export MAKE_LOCATION="${BUILD_LOCATION}/sbcl-${RELEASE_VERSION}"

cd "${SBCL_COMPILE_SYSTEM}"
