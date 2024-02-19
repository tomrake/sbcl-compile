#######################################################################

#### The directory layout of sbcl-build

#### Where the user portion oo SBCL_COMPILE data is located
export SBCL_COMPILE_USER="${PWD}"
#### Where the system potion of SBCL_COMPILE data is located
#### Many scripts depends on the current directory being reset to this location.
export SBCL_COMPILE_SYSTEM="${PWD}"

export SBCL_COMPILE_GIT_SOURCE="${SBCL_COMPILE_USER}/gitsource"
export SBCL_COMPILE_RELEASES="${SBCL_COMPILE_USER}/releases"
export SBCL_COMPILE_BUILDS="${SBCL_COMPILE_USER}/builds"
export SBCL_COMPILE_GNUPG="${SBCL_COMPILE_USER}/.gnupg"
export DEFAULT_SBCL_XC_HOST="${SBCL_COMPILE_USER}/default-xc-host"

#######################################################################

#### You need either a release version or git source version


#### The Released Source options


export RELEASE_VERSION="2.4.1"

#### The Release signing details
####  Use defaults for the get_signed_source.sh
## The public signature of the signer   
#export RELEASE_SIGNER_ID=D6839CA0A67F74D9DFB70922EBD595A9100D63CD
## The current signer
#export RELEASE_SIGNER=crhodes

#### The Git Source Options

## TBD - Set the source repo and branch to use.


#######################################################################

#### Building details



export COMPILE_BUILD_OPTIONS="--fancy"

## The release version we reference
## change this to compile a release


## The build name for the build
## Change to what ever you want to call it.
export BUILD_NAME="2.4.1-fancy"

## Various make.sh options should also be changed.
## TBD - Add variable for those options.

#######################################################################


## The install location
## This is where you want to have sbcl installed.

export INSTALL_LOCATION="c:/Users/Public/Lispers/sbcl/installed"

