#! /bin/bash

# This code fetches the last sbcl released compiler for windows,
# And sets the XC_HOST and XC_HOST options to match.

# use that last windows release
FILEURL=https://master.dl.sourceforge.net/project/sbcl/sbcl/2.3.2/sbcl-2.3.2-x86-64-windows-binary.msi?viasf=1
FILE="sbcl-2.3.2-x86-64-windows-binary.msi"
cd "${DEFAULT_SBCL_XC_HOST}"
if [ !  -f $FILE ] ;  then    
    curl "${FILEURL}" --output "$FILE"
    msiextract  "$FILE"
    mv "PFiles/Steel Bank Common Lisp" ./sbcl    
fi
if [ -f "${DEFAULT_SBCL_XC_HOST}/sbcl/sbcl.exe" ] ; then
    export XC_HOST="${DEFAULT_SBCL_XC_HOST}/sbcl/sbcl.exe"
    export XC_HOST_OPTIONS="--no-userinit --no-sysinit" 
fi
cd "${SBCL_COMPILE_SYSTEM}"
