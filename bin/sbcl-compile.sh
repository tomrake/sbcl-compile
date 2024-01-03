#!/bin/bash


export BOOTING_COMPILER="${PWD}/booting/sbcl/sbcl.exe"
export BOOTING_COMPILER_OPTIONS="--no-userinit --no-sysinit" 
#### NOTE
## This is msys2/ucrt64 specific
##
### See sbcl source:  INSTALL 2.3 Troubleshooting "GNU Make not found"
export COMPILE_BUILD_OPTIONS="--fancy"

export GNUMAKE="c:/devel/msys64/ucrt64/bin/mingw32-make.exe"
## The release version we reference
export RELEASE_VERSION="2.4.0"
## The public signature of the signer   
export SIGNING_KEY=D6839CA0A67F74D9DFB70922EBD595A9100D63CD
## The current signer
export SIGNER=crhodes
## Where the GPG keys are stored
export KEY_BASE=./.gnupg
## THe signed files
export SIGNING_FILE=${SIGNER}.asc

export BUILD_LOG=build-log.txt

export TEST_LOG=test-log.txt

export ANSI_TEST_LOG=ansi-test-log.txt

sh bin/get_signed_source.sh
sh bin/extract-build.sh
sh bin/run-tests.sh
sh bin/run-ansi-tests.sh
