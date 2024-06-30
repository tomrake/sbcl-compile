#! /bin/bash

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
	curl "${FILEURL}" --output "${FILE}"
	msiextract  "${FILE}"
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
