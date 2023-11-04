#! /bin/bash
KEY_BASE=./.gnupg
CHRODES=D6839CA0A67F74D9DFB70922EBD595A9100D63CD
signing_file_url=https://master.dl.sourceforge.net/project/sbcl/sbcl/2.3.10/sbcl-2.3.10-crhodes.asc?viasf=1
SIGNING_FILE=chrodes.asc
CREDENTIALS=credentials
# GET KEYS FROM A SERVER
gpg --homedir "${KEY_BASE}" --list-keys "${CHRODES}" || gpg --homedir "${KEY_BASE}" --recv-keys "${CHRODES}"
# GET THE CRYPTED MESSAGE
curl ${signing_file_url} --output "${SIGNING_FILE}"
# DECRYPT THE MESSAGE
gpg --homedir "${KEY_BASE}" --decrypt "${SIGNING_FILE}" > "${CREDENTIALS}"
cat "${CREDENTIALS}"
# IT IS THREE (sha256 tar) lines
echo "Have three files"
FILEURL=https://master.dl.sourceforge.net/project/sbcl/sbcl/2.3.10/sbcl-2.3.10-source.tar.bz2?viasf=1
FILE="sbcl-2.3.10-source.tar.bz2"
curl "${FILEURL}" --output "$FILE"
bunzip2 -k  "$FILE"

FILEURL=https://master.dl.sourceforge.net/project/sbcl/sbcl/2.3.10/sbcl-2.3.10-documentation-html.tar.bz2?viasf=1
FILE="sbcl-2.3.10-documentation-html.tar.bz"
curl "${FILEURL}" --output "$FILE"
bunzip2 -k "$FILE"

FILEURL=https://master.dl.sourceforge.net/project/sbcl/sbcl/2.3.10/sbcl-2.3.10-x86-64-linux-binary.tar.bz2?viasf=1
FILE="sbcl-2.3.10-x86-64-linux-binary.tar.bz2"
curl "${FILEURL}" --output "$FILE"
bunzip2 -k "$FILE"
echo "Check the last three lines in credentials"
tail -n 3 "${CREDENTIALS}"| sha256sum -c


