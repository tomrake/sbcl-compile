#!/bin/bash

export RELEASE_VERSION="2.4.0"
export BOOTING_COMPILER="--xc-host=${PWD}/booting/PFiles/Steel Bank Common Lisp/sbcl.exe"
#### NOTE
## This is msys2/ucrt64 specific
##
### See sbcl source:  INSTALL 2.3 Troubleshooting "GNU Make not found"
export GNUMAKE="c:/devel/msys64/ucrt64/bin/mingw32-make.exe"
