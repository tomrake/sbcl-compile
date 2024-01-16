
Configuration of sbcl_compile installation


#### Where the user portion oo SBCL_COMPILE data is located
export SBCL_COMPILE_USER="${PWD}"
#### Where the system potion of SBCL_COMPILE data is located
export SBCL_COMPILE_SYSTEM="${PWD}"

export SBCL_COMPILE_GIT_SOURCE="${SBCL_COMPIOE_USER}/gitsource"
export SBCL_COMPILE_RELEASES="${SBCL_COMPILE_USER}/releases"
export SBCL_COMPILE_BUILDS="${SBCL_COMPILE_USER}/builds"
export SBCL_COMPILE_GNUPG="${SBCL_COMPILE_USER}/.gnupg"
export SBCL_COMPILE_BOOTING="${SBCL_COMPILE_USER}/booting"

#### NOTE
## This is msys2/ucrt64 specific
##
### See sbcl source:  INSTALL 2.3 Troubleshooting "GNU Make not found"
export COMPILE_BUILD_OPTIONS="--fancy"

## The release version we reference

export RELEASE_VERSION="2.3.8"
####  Use defaults for the get_signed_source.sh
## The public signature of the signer   
#export RELEASE_SIGNER_ID=D6839CA0A67F74D9DFB70922EBD595A9100D63CD
## The current signer
#export RELEASE_SIGNER=crhodes
export BUILD_NAME="test-build"
