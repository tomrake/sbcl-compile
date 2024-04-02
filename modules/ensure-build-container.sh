#! /bin/bash

if [ ! -d  "${SBCL_COMPILE_BUILDS}" ] ; then
    echo "sbcl_compile builds ${SBCL_COMPILE_BUILDS} is not found"
    exit 1
else
    echo "VALID SBCL_COMPILE_BUILDS: ${SBCL_COMPILE_BUILDS}"
fi

if [ -z "${BUILD_NAME}" ] ; then
    echo "The build name ${BUILD_NAME} is empty"
    exit 1
else
    echo "VALID BUILD_NAME: ${BUILD_NAME}"
fi

# CREATE BUILD_LOCATION
export BUILD_LOCATION="${SBCL_COMPILE_BUILDS}/${BUILD_NAME}"
echo "**** Definition of BUILD_LOCATION: ${BUILD_LOCATION}"   
mkdir "${BUILD_LOCATION}"

# CREATE BUILD_INFO
export BUILD_INFO="${BUILD_LOCATION}/info"
mkdir "${BUILD_INFO}"


# BEGIN INFO LOG
echo `logging " ensure-build-container.sh"` >> "${BUILD_INFO}/building.log.txt"
cp "${SBCL_COMPILE_SYSTEM}/bin/configuration.sh" "${BUILD_INFO}/`datestamp`-configuration.sh" 

#### This is the beggining of the source location split.
#### The file "${BUILD_LOCATION}/BUILD_TYPE"  should be created which contains either 'git' or 'release'
#### Correct resolution of the split is the specification of the ${MAKE_LOCATION} which is written to
#### "${BUILD_LOCATION}/MAKE_LOCATION"  once the source has been correctly downloaded or cloned.

if -f "${BUILD_LOCATION}/BUILD_TYPE}" ; then
    READ_BUILD_TYPE=$("<${BUILD_LOCATION}/BUILD_TYPE")
    case ${READ_BUILD_TYPE} in
	git)
	    if [ "${CONFIG_BUILD_TYPE}" != "git"  ] ; then
		echo "Attempt to use git built type in a ${CONFIG_BUILD_TYPE} build container"
		exit
	    fi
	    ;;
	release)
 	    if [ "${CONFIG_BUILD_TYPE}" != "release"  ] ; then
		echo "Attempt to use release built type in a ${CONFIG_BUILD_TYPE} build container"
		exit
	    fi
	    ;;
	*)
	    .
	    ;;
    esac
		      
fi


if [ ${CONFIG_BUILD_TYPE} = "git" ] ; then
    echo "git" > "${BUILD_LOCATION}/BUILD_TYPE"
    cd "${SBCL_COMPILE_SYSTEM}"
    source modules/get_git_source.sh
    source modules/git-extract.sh
elif [ "${CONFIG_BUILD_TYPE}" = "release" ] ; then
    echo "release" > "${BUILD_LOCATION}/BUILD_TYPE"
    cd "${SBCL_COMPILE_SYSTEM}"
    source modules/get_signed_source.sh
    source modules/release-extract.sh
else
    echo "Unknown build type ${CONFIG_BUILD_TYPE}"
    exit 1
fi




