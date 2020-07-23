#!/bin/bash -

# strict error handling
set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o nounset   # set -u : exit the script if you try to use an uninitialized variable
set -o errexit   # set -e : exit the script if any statement returns a non-true return value

echo "$(date): Welcome to the Slide Maker Script."

baseDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "$(date): Base directory is '$baseDir'."

cd "$baseDir"

sharedDir="$(realpath "$baseDir/_shared_")"
echo "$(date): Shared directory is '$sharedDir'."

outDir="$(realpath "$baseDir/out")"
echo "$(date): Output directory is '$outDir': new cleaning up."

codeDir="code"
slidesDir="slides"
bookDir="book"

mkdir -p "$outDir" || true
rm -rf "$outDir"/* || true
"$baseDir/getCode.sh" "$outDir" "$codeDir"
mkdir -p "$outDir/$slidesDir"

for slideDir in */ ; do
  slideDir="$(realpath "$slideDir")"
   
  if [ "$slideDir" == "$sharedDir" ]; then
    continue;
  fi   
  if [ "$slideDir" == "$outDir" ]; then
    continue;
  fi  
  
  "$baseDir/makeOne.sh" "$slideDir" "$outDir/$slidesDir"
  
  cd "$baseDir"   
done

./getBook.sh "$outDir" "$bookDir"

cd "$outDir"

archive="optimization_algorithms.tar.xz"
echo "$(date): Now compressing everything to '$archive'."
rm -f "$archive" || true
tar -c "$slidesDir" "$bookDir" "$codeDir" | xz -v -9e -c > "$archive"
echo "$(date): Done compressing all slides to '$archive'."

echo "Cleaning up."
rm -rf "$codeDir"
rm -rf "$bookDir"
mv "$outDir/$slidesDir"/*.pdf "$outDir"
rm -rf "$outDir/$slidesDir"

"$baseDir/makeIndex.sh" "$baseDir" "$outDir"

cd "$baseDir"

echo "All done."



