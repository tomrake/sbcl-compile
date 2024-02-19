#!/bin/bash

cd "${MAKE_LOCATION}/tests" 

echo "#### DATE: `date +"%F_%T"` RUNNING UNAME: `uname` run-tests.sh in ${BUILD_LOCATION}/sbcl-${RELEASE_VERSION}/tests" > "${BUILD_INFO}/${TEST_LOG}"
sh run-tests.sh | tee -a "${BUILD_INFO}/${TEST_LOG}"

cd "${SBCL_COMPILE_SYSTEM}"
