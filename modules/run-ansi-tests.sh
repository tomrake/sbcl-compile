#!/bin/bash

cd "${MAKE_LOCATION}/tests"
echo "#### DATE: `date +"%F_%T"` RUNNING UNAME: `uname` ansi-tests.sh in ${BUILD_LOCATION}/sbcl-${RELEASE_VERSION}/tests" > "${BUILD_INFO}/${ANSI_TEST_LOG}"
sh ansi-tests.sh | tee -a "${BUILD_INFO}/${ANSI_TEST_LOG}"

cd "${SBCL_COMPILE_SYSTEM}"
