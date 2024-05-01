#!/bin/bash

source bin/configuration.sh

echo "RELEASE_VERSION=${RELEASE_VERSION}"

source modules/logging-tools.sh
source modules/initialize_sbcl_compile.sh
# Before any building work check if there is an install location.
if [ ! -d "${INSTALL_LOCATION}" ] ; then
    echo "Install location is not found: ${INSTALL_LOCATION}"
    exit 1
fi
source modules/ensure-build-container.sh
source modules/ensure_xc_host.sh
source modules/build.sh
#source modules/run-tests.sh
#source modules/run-ansi-tests.sh
source modules/sbcl-install.sh
