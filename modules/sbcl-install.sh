#!/bin/bash

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


if [ ! -d "${INSTALL_LOCATION}" ] ; then
    echo "Install location is not found: ${INSTALL_LOCATION}"
    exit 1
fi
mkdir "${INSTALL_LOCATION}/${RELEASE_VERSION}"
INSTALL_ROOT="${INSTALL_LOCATION}/${RELEASE_VERSION}/${BUILD_NAME}"
mkdir "${INSTALL_ROOT}"

cd "${MAKE_LOCATION}"
sh install.sh --prefix="${INSTALL_ROOT}"

cd "${SBCL_COMPILE_SYSTEM}"

