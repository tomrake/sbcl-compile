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

# This code was modified to have the MSI_VERSION set from configuration.

# This code fetches the last sbcl released compiler for windows,
# And sets the XC_HOST and XC_HOST options to match.

# use that last windows release
FILEURL=https://master.dl.sourceforge.net/project/sbcl/sbcl/${MSI_VERSION}/sbcl-${MSI_VERSION}-x86-64-windows-binary.msi?viasf=1
FILE="sbcl-${MSI_VERSION}-x86-64-windows-binary.msi"
if [  -z "${XC_HOST}" ] ; then
    echo  "Looking for default MSI in ${DEFAULT_SBCL_XC_HOST}"
    cd "${DEFAULT_SBCL_XC_HOST}"
    if [ !  -f ${FILE} ] ;  then
	echo "Not Found, Downloading default MSI ${FILE}"
	curl -L "${FILEURL}" --output "${FILE}"
	msiextract  "${FILE}"
	mkdir "./backup-stuff"
	mv "./sbcl" "./backup-stuff/sbcl_$(date +%Y%m%d%H%M%S)_$RANDOM/"
	mv "PFiles/Steel Bank Common Lisp" ./sbcl
    else
	echo "Default found ${FILE} in ${DEFAULT_SBCL_XC_HOST}"
    fi
    if [ -f "${DEFAULT_SBCL_XC_HOST}/sbcl/sbcl.exe" ] ; then
	echo "Found MSI Version exporting to XC_HOST"
	export XC_HOST="${DEFAULT_SBCL_XC_HOST}/sbcl/sbcl.exe"
	export XC_HOST_OPTIONS="--no-userinit --no-sysinit"
    else
	echo "A MSI version was not found at ${DEFAULT_SBCL_XC_HOST}/sbcl/sbcl.exe"
	exit 1
    fi
else
    echo "Using XC_HOST=${XC_HOST}"    
fi

if [ ! -f "${XC_HOST}" ] ; then
    echo "XC_HOST:${XC_HOST} is not a file."
    exit 1
fi
cd "${SBCL_COMPILE_SYSTEM}"
