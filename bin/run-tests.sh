#!/bin/bash

cd "${BUILD_LOCATION}/sbcl-${RELEASE_VERSION}/tests" 

sh run-tests.sh | tee "${TEST_LOG}"
