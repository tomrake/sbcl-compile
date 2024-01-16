#! /bin/bash

# use that last windows release
FILEURL=https://master.dl.sourceforge.net/project/sbcl/sbcl/2.3.2/sbcl-2.3.2-x86-64-windows-binary.msi?viasf=1
FILE="sbcl-2.3.2-x86-64-windows-binary.msi"
cd "${SBCL_COMPILE_BOOTING}"
if [ !  -f $FILE ] ;  then    
    curl "${FILEURL}" --output "$FILE"
    msiextract  "$FILE"
    mv "PFiles/Steel Bank Common Lisp" ./sbcl    
fi
if [ -f "${SBCL_COMPILE_BOOTING}/sbcl/sbcl.exe" ] ; then
    export XC_HOST="${SBCL_COMPILE_BOOTING}/sbcl/sbcl.exe"
    export XC_HOST_OPTIONS="--no-userinit --no-sysinit" 
fi
