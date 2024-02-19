#!/bin/bash

cd "${MAKE_LOCATION}/tests" 

echo `logging " run-tests.sh in ${BUILD_LOCATION}/sbcl-${RELEASE_VERSION}/tests"` > "${BUILD_INFO}/${TEST_LOG}"
sh run-tests.sh | tee -a "${BUILD_INFO}/${TEST_LOG}"

cd "${SBCL_COMPILE_SYSTEM}"
