#!/bin/bash

source bin/configuration.sh

echo "RELEASE_VERSION=${RELEASE_VERSION}"

sh bin/get_signed_source.sh
sh bin/extract-build.sh
sh bin/run-tests.sh
sh bin/run-ansi-tests.sh
