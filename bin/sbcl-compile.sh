#!/bin/bash

source bin/configuration.sh

echo "RELEASE_VERSION=${RELEASE_VERSION}"

source bin/initialize_sbcl_compile.sh
source bin/ensure-build-container.sh
source bin/get_signed_source.sh
source bin/get_booting_compiler.sh
source bin/release-extract.sh
source bin/build.sh
#sh bin/run-tests.sh
#sh bin/run-ansi-tests.sh
