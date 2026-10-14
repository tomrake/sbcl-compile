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

echo "The module extract-build.sh is still used"
exit 1

echo "XC_HOST=${XC_HOST}"
echo "XC_HOST_OPTIONS=${XC_HOST_OPTIONS}"
BOOT_CONFIG="--xc-host=${XC_HOST} ${XC_HOST_OPTIONS}"
echo "BOOT_CONFIG=${BOOT_CONFIG}"
cd ${RELEASE_VERSION}
mkdir "${BUILD_LOCATION}"
tar -xf sbcl-${RELEASE_VERSION}-source.tar.bz2 -C "${BUILD_LOCATION}"
cd "${BUILD_LOCATION}/sbcl-${RELEASE_VERSION}"
echo "### UNAME: `uname` BUILD OPTIONS:  sh make.sh ${BOOT_CONFIG}" ${COMPILE_BUILD_OPTIONS} > "${BUILD_LOG}" 
sh make.sh "${BOOT_CONFIG}" ${COMPILE_BUILD_OPTIONS} | tee -a "${BUILD_LOG}"


