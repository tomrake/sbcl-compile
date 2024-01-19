#!/usr/bash
# BUILD_LOCATIONS should be SOME_WHERE/$sbcl-${RELEASE_VERSION}
# SOME_WHERE=${BUILD_NAME}
# BUILD_LOCATION=${BUILD_NAME}/sbcl-${RELEASE_VERSION}
# cd ${SOME_WHERE}
if [ ! -d "${BUILD_LOCATION}" ] ; then
    echo  "Can't extract release source into ${BUILD_LOCATION}."
    exit 1
else
    echo "BUILD_LOCATION: ${BUILD_LOCATION}"
fi
COMPRESSED_SOURCE="${SBCL_COMPILE_RELEASES}/${RELEASE_VERSION}/sbcl-${RELEASE_VERSION}-source.tar.bz2"

if [ ! -f "${COMPRESSED_SOURCE}" ] ; then
    echo "Cannot find compressed release source: ${COMPRESSED_SOURCE}"
    exit 1
else
    echo "COMPRESSED_SOURCE: ${COMPRESSED_SOURCE}"
fi

tar -xf "${COMPRESSED_SOURCE}" -C "${BUILD_LOCATION}"

export MAKE_LOCATION="${BUILD_LOCATION}/sbcl-${RELEASE_VERSION}"
