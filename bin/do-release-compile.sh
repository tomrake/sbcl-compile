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
source bin/configuration.sh

echo "RELEASE_VERSION=${RELEASE_VERSION}"

source modules/logging-tools.sh
source modules/initialize_sbcl_compile.sh
source modules/ensure-build-container.sh
source modules/get_signed_source.sh
source modules/release-extract.sh
source modules/ensure_xc_host.sh
source modules/build.sh
source modules/run-tests.sh
source modules/run-ansi-tests.sh

