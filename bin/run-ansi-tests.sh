#!/bin/bash

cd "${MAKE_LOCATION}/tests"
echo "#### RUNNING UNAME: `uname` ansi-tests.sh in ${BUILD_LOCATION}/sbcl-${RELEASE_VERSION}/tests" > "${ANSI_TEST_LOG}"
sh ansi-tests.sh | tee -a "${ANSI_TEST_LOG}"

cd "${SBCL_COMPILE_SYSTEM}"
