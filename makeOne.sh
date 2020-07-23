#!/bin/bash -

# strict error handling
set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o nounset   # set -u : exit the script if you try to use an uninitialized variable
set -o errexit   # set -e : exit the script if any statement returns a non-true return value

inDir="$(realpath "$1")"
outDir="$(realpath "$2")"

echo "$(date): Input folder is '$inDir'."

doc="${inDir%%.*}"
doc="${doc%/}"
doc="$(basename "$doc")"

echo "$(date): Document name is '$doc'."
if [ -f "$inDir/$doc.tex" ]; then
  cd "$inDir"

  meta=""
  oldMeta="old"
  cycle=0

# Repeat compiling the document until the aux and bbl files etc. do no longer change.
# This allows us to do as few compilations as possible.
  while [ "$oldMeta" != "$meta" ] ; do
    cycle="$((cycle+1))"
    oldMeta="$meta"
        
    set +o errexit
    pdflatex -halt-on-error -interaction=nonstopmode -no-shell-escape "$doc"
    retVal=$?
    set -o errexit
    if(("$retVal" != 0)) ; then
      echo "Error: pdflatex returned '$retVal' when compiling '$doc.tex'. Now exiting."
      exit "$retVal"
    fi

# Apply BibTeX where necessary.
    for fullAuxFile in *.aux; do
      auxFileName=${fullAuxFile%%.*}
      if [ -f "$fullAuxFile" ]; then
        if grep -q "\\citation{" "$fullAuxFile"; then
          echo "File '$fullAuxFile' contains citations, so we applying 'bibtex' to it."
          bibtex "$auxFileName"
          echo "Finished applying 'bibtex' to '$fullAuxFile'."
        else
          echo "File '$fullAuxFile' does not contain any citation, so we do not apply 'bibtex'."
        fi
      fi
    done

# Loading the contents of all aux and bbl files and other meta files into one string.
    meta="$(cat *.aux *.bbl *.blg *.nav *.toc *.snm 2>&1 || true)"
    echo "Finished build cycle $cycle."

    if (("$cycle" > 200)) ; then
      echo "Something odd is happening: We have performed $cycle cycles. That's too many. Let's quit."
      break
    fi
  done

  echo "$(date): Done compiling document '$doc', now cleaning up."

  rm *.aux || true
  rm *.bbl || true
  rm *.blg || true
  rm "$doc.dvi" || true
  rm "$doc.ent" || true
  rm "$doc.idx" || true
  rm "$doc.loa" || true
  rm "$doc.lof" || true
  rm "$doc.log" || true
  rm "$doc.lot" || true
  rm "$doc.nav" || true
  rm "$doc.out" || true
  rm "$doc.out.ps" || true
  rm "$doc.ps" || true
  rm "$doc.snm" || true
  rm "$doc.spl" || true
  rm "$doc.synctex" || true
  rm "$doc.synctex.gz" || true
  rm "$doc.toc" || true
  rm "$doc.upa" || true
  rm "$doc.upb" || true
  rm "$doc.vrb" || true
  rm "$doc.xcp" || true
  rm "texput.upa" || true

  echo "$(date): Done cleaning up, now filtering '$doc.pdf' to '$outDir' in order to include all fonts and to make sure that the pdf is maximally compliant with whatever."

  gs -q \
   -dPrinted=false \
   -dEmbedAllFonts=true \
   -dSubsetFonts=true \
   -dCompressFonts=true \
   -dOptimize=true \
   -dPreserveCopyPage=false \
   -dPreserveEPSInfo=false \
   -dPreserveHalftoneInfo=false \
   -dPreserveOPIComments=false \
   -dPreserveOverprintSettings=false \
   -dPreserveSeparation=false \
   -dPreserveDeviceN=false \
   -dMaxBitmap=2147483647 \
   -dDownsampleMonoImages=false \
   -dDownsampleGrayImages=false \
   -dDownsampleColorImages=false \
   -dDetectDuplicateImages=true \
   -dAutoFilterColorImages=false \
   -dAutoFilterGrayImages=false \
   -dColorImageFilter=/FlateEncode \
   -dGrayImageFilter=/FlateEncode \
   -dColorConversionStrategy=/LeaveColorUnchanged \
   -dHaveTransparency=true \
   -dFastWebView=false \
   -dNOPAUSE \
   -dQUIET \
   -dBATCH \
   -dSAFER \
   -sDEVICE=pdfwrite \
   -dAutoRotatePages=/PageByPage \
   -sOutputFile="$outDir/$doc.pdf" \
   "$doc.pdf" \
   -c "<</NeverEmbed [ ]>> setdistillerparams"
   
  rm "$doc.pdf"
else
  echo"$(date): File '$inDir/$doc.tex' does not exist!"
  exit 1
fi
