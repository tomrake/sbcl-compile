#!/bin/bash

cd ${RELEASE_VERSION}/sbcl-${RELEASE_VERSION}/tests 
sh ansi-tests.sh | tee "${ANSI_TEST_LOG}"
