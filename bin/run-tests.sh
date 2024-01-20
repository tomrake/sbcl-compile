#!/bin/bash

cd "${MAKE_LOCATION}/tests" 

echo "#### RUNNING UNAME: `uname` run-tests.sh in ${BUILD_LOCATION}/sbcl-${RELEASE_VERSION}/tests" > "${TEST_LOG}"
sh run-tests.sh | tee -a "${TEST_LOG}"

cd "${SBCL_COMPILE_SYSTEM}"
