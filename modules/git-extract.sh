#!/usr/bash

# This expands the released source into the build location.
# The MAKE_LOCATION is defined from the BUILD_LOCATION and git branch specification.

# No defined location to build  is an error
if [ ! -d "${BUILD_LOCATION}" ] ; then
    echo  "Can't extract git source into ${BUILD_LOCATION}."
    exit 1
else
    echo "BUILD_LOCATION: ${BUILD_LOCATION}"
fi

echo "git-extract.sh needs to finished"
exit 1

export MAKE_LOCATION="${BUILD_LOCATION}/GITDIRECTORY"

cd "${SBCL_COMPILE_SYSTEM}"
