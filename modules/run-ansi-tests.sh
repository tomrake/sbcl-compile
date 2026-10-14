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

cd "${MAKE_LOCATION}/tests"
echo `logging " ansi-tests.sh in ${BUILD_LOCATION}/sbcl-${RELEASE_VERSION}/tests"` > "${BUILD_INFO}/${ANSI_TEST_LOG}"
sh ansi-tests.sh | tee -a "${BUILD_INFO}/${ANSI_TEST_LOG}"

cd "${SBCL_COMPILE_SYSTEM}"
