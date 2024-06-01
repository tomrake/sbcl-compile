#!/bin/bash

echo "Git build is now specified on the configruation. Use do-compile."
exit 1

source bin/configuration.sh

echo "RELEASE_VERSION=${RELEASE_VERSION}"

source modules/logging-tools.sh
source modules/initialize_sbcl_compile.sh
source modules/ensure-build-container.sh
source modules/ensure_xc_host.sh
source modules/build.sh
source modules/run-tests.sh
source modules/run-ansi-tests.sh

