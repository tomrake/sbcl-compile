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

# This module creates the need directories for sbcl-compile.


mkdir "${SBCL_COMPILE_USER}"
mkdir "${SBCL_COMPILE_GIT_SOURCE}"
mkdir "${SBCL_COMPILE_RELEASES}"
mkdir "${SBCL_COMPILE_BUILDS}"
mkdir "${SBCL_COMPILE_GNUPG}"
mkdir "${DEFAULT_SBCL_XC_HOST}"
