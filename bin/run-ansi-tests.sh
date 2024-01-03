#!/bin/bash

cd "${BUILD_LOCATION}/sbcl-${RELEASE_VERSION}/tests" 
sh ansi-tests.sh | tee "${ANSI_TEST_LOG}"
