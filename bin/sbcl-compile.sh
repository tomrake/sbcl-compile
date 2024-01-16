#!/bin/bash

source bin/configuration.sh

echo "RELEASE_VERSION=${RELEASE_VERSION}"

sh bin/initialize_sbcl_compile.sh
sh bin/get_signed_source.sh
sh bin/get_booting_compiler.sh
sh bin/ensure-build-container.sh
sh bin/release-extract.sh
sh bin/build.sh
#sh bin/run-tests.sh
#sh bin/run-ansi-tests.sh
