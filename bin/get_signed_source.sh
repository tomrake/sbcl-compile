#! /bin/bash

signing_file_url=https://master.dl.sourceforge.net/project/sbcl/sbcl/${RELEASE_VERSION}/sbcl-${RELEASE_VERSION}-${SIGNING_FILE}?viasf=1
CREDENTIALS=credentials
mkdir ${RELEASE_VERSION}
cd ${RELEASE_VERSION}
# GET THE PUBLIC KEYS OF THE SIGNER
gpg --homedir "${KEY_BASE}" --list-keys "${SIGNING_KEY}" || gpg --homedir "${KEY_BASE}" --recv-keys "${SIGNING_KEY}"
# GET A ENCRYPTED MESSAGE FROM THE SERVER
if [ ! -f "${SIGNING_FILE}" ] ; then
    curl ${signing_file_url} --output "${SIGNING_FILE}"
fi
# THE CREDENTIALS ARE LIST OF SHA256 OF TAR FILES AND FILE NAME OF THE TAR FILES
gpg --homedir "${KEY_BASE}"  --decrypt "${SIGNING_FILE}" > "${CREDENTIALS}"
cat "${CREDENTIALS}"
# BY CONVENTSION WE KNOW THERE ARE THREE FILES.
# EACH FILE IS BZ2 COMPRESSED TAR
# WE GET EACH BZ2 FILE AND EXPAND IT

# 1 FOR THE SOURCES

FILEURL=https://master.dl.sourceforge.net/project/sbcl/sbcl/${RELEASE_VERSION}/sbcl-${RELEASE_VERSION}-source.tar.bz2?viasf=1
FILE="sbcl-${RELEASE_VERSION}-source.tar.bz2"
if [ ! -f $FILE ] ; then
    curl "${FILEURL}" --output "$FILE"
fi
bunzip2 -k  "$FILE"

# 2 FOR THE DOCUMENATATION-HTML

FILEURL=https://master.dl.sourceforge.net/project/sbcl/sbcl/${RELEASE_VERSION}/sbcl-${RELEASE_VERSION}-documentation-html.tar.bz2?viasf=1
FILE="sbcl-${RELEASE_VERSION}-documentation-html.tar.bz"
if [ ! -f $FILE ] ; then
    curl "${FILEURL}" --output "$FILE"
fi
bunzip2 -k "$FILE"

# 3 FOR THE LINUX-BINARY

FILEURL=https://master.dl.sourceforge.net/project/sbcl/sbcl/${RELEASE_VERSION}/sbcl-${RELEASE_VERSION}-x86-64-linux-binary.tar.bz2?viasf=1
FILE="sbcl-${RELEASE_VERSION}-x86-64-linux-binary.tar.bz2"
if [ ! -f $FILE ] ; then
    curl "${FILEURL}" --output "$FILE"
fi
bunzip2 -k "$FILE"

# BY CONVENTION EACH LINE IN THE CREDENTAIL FILE HAS THE TEXT sbcl
# WE CHECK THE SHA256 FOR EACH TAR FILE.


cat "${CREDENTIALS}"|grep sbcl| sha256sum -c > signature-check.txt
echo "Files marked 'OK' agree with the signed credentials."
cat signature-check.txt

# AT THIS POINT WE DO NOT NEED THE TAR FILES AS WE CAN EXPANDS FROM THE BZ2 FILES

rm *.tar
