#! /bin/bash

#### Configuration/Customiztion

## These are slowly changing configuration values
RELEASE_SIGNER_ID="${RELEASE_SIGNER_ID:=D6839CA0A67F74D9DFB70922EBD595A9100D63CD}"
## The current signer
RELEASE_SIGNER="${RELASE_SIGNER:=crhodes}"

if [ ! -d ${SBCL_COMPILE_GNUPG} ] ; then
    echo "sbcl_compile gmupg ${SBCL_COMPILE_GNUPG} not found"
    exit 1
fi


#### Derive file names, urls and create directory for downloads 
SIGNED_MESSAGE_FILE=${RELEASE_SIGNER}.asc
SIGNED_MESSAGE_URL=https://master.dl.sourceforge.net/project/sbcl/sbcl/${RELEASE_VERSION}/sbcl-${RELEASE_VERSION}-${SIGNED_MESSAGE_FILE}?viasf=1
FILE_SHA256_LIST=credentials
if [ ! -d "${SBCL_COMPILE_RELEASES}" ] ; then
    echo "sbcl_compile directory releases ${SBCL_COMPILE_RELEASES} not found"
    exit 1
fi
mkdir ${SBCL_COMPILE_RELEASES}/${RELEASE_VERSION}
cd ${SBCL_COMPILE_RELEASES}/${RELEASE_VERSION}

#### Ensure we have the keys for the release signer

# GET THE PUBLIC KEYS OF THE RELEASE_SIGNER
gpg --homedir "${SBCL_COMPILE_GNUPG}" --list-keys "${RELEASE_SIGNER_ID}" || gpg --homedir "${SBCL_COMPILE_GNUPG}" --recv-keys "${RELEASE_SIGNER_ID}"


#### Ensure we have a message from the release signer.
if [ ! -f "${SIGNED_MESSAGE_FILE}" ] ; then
    curl ${SIGNED_MESSAGE_URL} --output "${SIGNED_MESSAGE_FILE}"
fi

#### Decypt the message from release signer

# THE FILE_SHA256_LIST ARE LIST OF SHA256 OF TAR FILES AND FILE NAME OF THE TAR FILES
gpg --homedir "${SBCL_COMPILE_GNUPG}"  --decrypt "${SIGNED_MESSAGE_FILE}" > "${FILE_SHA256_LIST}"
cat "${FILE_SHA256_LIST}"


# BY CONVENTSION WE KNOW THERE ARE THREE FILES.
# EACH FILE IS BZ2 COMPRESSED TAR
# WE GET EACH BZ2 FILE AND EXPAND IT

# ONE FOR THE SOURCES

FILEURL=https://master.dl.sourceforge.net/project/sbcl/sbcl/${RELEASE_VERSION}/sbcl-${RELEASE_VERSION}-source.tar.bz2?viasf=1
FILE="sbcl-${RELEASE_VERSION}-source.tar.bz2"
if [ ! -f $FILE ] ; then
    curl "${FILEURL}" --output "$FILE"
fi
bunzip2 -k  "$FILE"

# TWO FOR THE DOCUMENATATION-HTML

FILEURL=https://master.dl.sourceforge.net/project/sbcl/sbcl/${RELEASE_VERSION}/sbcl-${RELEASE_VERSION}-documentation-html.tar.bz2?viasf=1
FILE="sbcl-${RELEASE_VERSION}-documentation-html.tar.bz"
if [ ! -f $FILE ] ; then
    curl "${FILEURL}" --output "$FILE"
fi
bunzip2 -k "$FILE"

# THREE FOR THE LINUX-BINARY

FILEURL=https://master.dl.sourceforge.net/project/sbcl/sbcl/${RELEASE_VERSION}/sbcl-${RELEASE_VERSION}-x86-64-linux-binary.tar.bz2?viasf=1
FILE="sbcl-${RELEASE_VERSION}-x86-64-linux-binary.tar.bz2"
if [ ! -f $FILE ] ; then
    curl "${FILEURL}" --output "$FILE"
fi
bunzip2 -k "$FILE"


#### Check that each .tar file has the same sha256 as specified by the signer.

# BY CONVENTION EACH LINE IN THE FILE_SHA256_LIST  HAS THE TEXT sbcl
# WE CHECK THE SHA256 FOR EACH TAR FILE.


cat "${FILE_SHA256_LIST}"|grep sbcl| sha256sum -c > signature-check.txt
echo "Files marked 'OK' agree with the signed credentials."
cat signature-check.txt

#### CLEANUP the .tar files.

rm *.tar
