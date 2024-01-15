#! /bin/bash

#### Configuration/Customiztion

## These are slowly changing configuration values
RELEASE_SIGNER_ID="${RELEASE_SIGNER_ID}:=}D6839CA0A67F74D9DFB70922EBD595A9100D63CD"
## The current signer
RELEASE_SIGNER="${RELASE_SIGNER}:=crhodes"
## Where the GPG keys are stored
export GNUPG_STORE="${GUNPG_STORE}:=./.gnupg"


#### Derive file names, urls and create directory for downloads 
SIGNED_MESSAGE_FILE=${RELEASE_SIGNER}.asc
SIGNED_MESSAGE_URL=https://master.dl.sourceforge.net/project/sbcl/sbcl/${RELEASE_VERSION}/sbcl-${RELEASE_VERSION}-${SIGNED_MESSAGE_FILE}?viasf=1
FILE_SHA256_LIST=credentials
mkdir ${RELEASE_VERSION}
cd ${RELEASE_VERSION}

#### Ensure we have the keys for the release signer

# GET THE PUBLIC KEYS OF THE RELEASE_SIGNER
gpg --homedir "${GNUPG_STORE}" --list-keys "${RELEASE_SIGNER_ID}" || gpg --homedir "${GNUPG_STORE}" --recv-keys "${RELEASE_SIGNER_ID}"


#### Ensure we have a message from the release signer.
if [ ! -f "${SIGNED_MESSAGE_FILE}" ] ; then
    curl ${SIGNED_MESSAGE_URL} --output "${SIGNED_MESSAGE_FILE}"
fi

#### Decypt the message from release signer

# THE FILE_SHA256_LIST ARE LIST OF SHA256 OF TAR FILES AND FILE NAME OF THE TAR FILES
gpg --homedir "${GNUPG_STORE}"  --decrypt "${SIGNED_MESSAGE_FILE}" > "${FILE_SHA256_LIST}"
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
