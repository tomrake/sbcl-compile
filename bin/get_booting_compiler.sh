#! /bin/bash

# use that last windows release
FILEURL=https://master.dl.sourceforge.net/project/sbcl/sbcl/2.3.2/sbcl-2.3.2-x86-64-windows-binary.msi?viasf=1
FILE="sbcl-2.3.2-x86-64-windows-binary.msi"
mkdir "booting"
cd "booting"
if [ !  -f $FILE ] ;  then    
    curl "${FILEURL}" --output "$FILE"
fi
msiextract  "$FILE"
# The lisp for compilation is at booting/sbcl/sbcl.exe
mv "PFiles/Steel Bank Common Lisp" ./sbcl
