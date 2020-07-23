#!/bin/bash -

# strict error handling
set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o nounset   # set -u : exit the script if you try to use an uninitialized variable
set -o errexit   # set -e : exit the script if any statement returns a non-true return value

baseDir="$(pwd)"
outDir="$(realpath "$1")"
bookDir="$2"

echo "Now obtaining newest version of book and dropping it into '$outDir/$bookDir'."
cd "$outDir"
dest="$outDir/$bookDir"
mkdir -p "$dest"
cd "$dest"

wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 0 --continue --random-wait --no-check-certificate http://thomasweise.github.io/aitoa/aitoa.pdf
wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 0 --continue --random-wait --no-check-certificate http://thomasweise.github.io/aitoa/aitoa.html
wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 0 --continue --random-wait --no-check-certificate http://thomasweise.github.io/aitoa/aitoa.epub
wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 0 --continue --random-wait --no-check-certificate http://thomasweise.github.io/aitoa/aitoa.azw3
wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 0 --continue --random-wait --no-check-certificate http://thomasweise.github.io/aitoa/index.html

echo "Done obtaining newest version of book."
cd "$baseDir"
