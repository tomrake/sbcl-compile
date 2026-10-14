#!/usr/bash

# Copywrite 2020-2026 by Thomas W. Rake, and is distributed under GPLv3.

# This file is part of SBCL-Commpile.
#
# SBCL-Compile is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#
# SBCL-Compile is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with Foobar. If not, see <https://www.gnu.org/licenses/>.
#


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
