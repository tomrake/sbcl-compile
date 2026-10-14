#! /bin/bash

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
echo `logging " ensure-build-container.sh"` >> "${BUILD_INFO}/building.log.txt"
cp "${SBCL_COMPILE_SYSTEM}/bin/configuration.sh" "${BUILD_INFO}/`datestamp`-configuration.sh" 
