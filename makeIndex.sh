#!/bin/bash -

# strict error handling
set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o nounset   # set -u : exit the script if you try to use an uninitialized variable
set -o errexit   # set -e : exit the script if any statement returns a non-true return value

baseDir="$(realpath "$1")"
outDir="$(realpath "$2")"

echo "Now making index.html from '$baseDir/README.md' to '$outDir/index.html'."

echo "<html><head><title>Optimization Algorithms</title></head><body>" > "$outDir/index.html"
perl "$baseDir/_shared_/markdown.pl" "$baseDir/README.md" >> "$outDir/index.html"
echo "</body></html>" >> "$outDir/index.html"

echo "Done making index.html."
