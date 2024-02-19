#!/bin/bash

source bin/configuration.sh

echo "RELEASE_VERSION=${RELEASE_VERSION}"

source modules/logging-tools.sh
source modules/initialize_sbcl_compile.sh
source modules/ensure-build-container.sh
source modules/get_signed_source.sh
source modules/get_default_xc_host.sh
source modules/release-extract.sh
source modules/build.sh
#source modules/run-tests.sh
#source modules/run-ansi-tests.sh
source modules/sbcl-install.sh
