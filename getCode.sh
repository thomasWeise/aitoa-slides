#!/bin/bash -

# strict error handling
set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o nounset   # set -u : exit the script if you try to use an uninitialized variable
set -o errexit   # set -e : exit the script if any statement returns a non-true return value

baseDir="$(pwd)"
outDir="$(realpath "$1")"
codeDir="$2"

echo "Now obtaining newest version of code and dropping it into '$outDir/$codeDir'."
cd "$outDir"
git clone --depth=1 https://github.com/thomasWeise/aitoa-code.git/
mv aitoa-code "$codeDir"
rm -rf code/.git
echo "Done obtaining newest version of code."
cd "$baseDir"
