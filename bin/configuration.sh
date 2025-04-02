#######################################################################

#### Update 2.4.7
#### README/UPDATE

# This Update is the result of the release of sbcl 2.4.6  source

# This project is to cover a few concerns about sbcl releases.

# 1) sbcl.org did not release current MSI installers for Windows.
# 2) The MSI installers historically released were not signed my the sbcl team.
# 3) Compile from git version of source - to contribute Windows platform code back to the team.

# Reason 1 is largely moot because the team is currently building and posting MSI version.
# Reason 2 the team is not signing MSI releases so this still exists.
# Reason 3 is still my failure to complete and debug the git compile code on windows.



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

#### This determined the version of the sbcl.org windows version to use.
export MSI_VERSION="2.5.0"

#### This specified a MSYS2 compiled version of sbcl to use.
#export LEGACY_MSYS2_VERSION=


#### This is sbcl release version to build
export RELEASE_VERSION="2.5.3"

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


#### XC_HOST defines the cross compiler to use.
##   When XC_HOST is not set the last released Windows version is downloaded and used.
##
#export XC_HOST="c:/Users/Public/Lispers/sbcl/installed/2.4.1/2.4.1-fancy/bin/sbcl.exe"
#export XC_HOST_OPTIONS="--no-userinit --no-sysinit"

export COMPILE_BUILD_OPTIONS="--fancy"

## The release version we reference
## change this to compile a release


## The build name for the build
## Change to what ever you want to call it.
## In my use case this the standard version I build
export BUILD_NAME="${RELEASE_VERSION}-fancy"

## Various make.sh options should also be changed.
## TBD - Add variable for those options.

#######################################################################


## The install location
## This is where I want want to have sbcl installed.

export INSTALL_LOCATION="c:/Users/Public/Lispers/sbcl/installed"

