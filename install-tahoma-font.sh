#!/bin/bash
# Install Tahoma Font (to support creations of some narrow-minded web
# developers)

cab_name=IELPKTH.CAB
cab_url=http://download.microsoft.com/download/ie6sp1/finrel/6_sp1/W98NT42KMeXP/EN-US/$cab_name
output_dir=/tmp/tahoma-font
font_dir=~/.fonts

mkdir $font_dir
mkdir $output_dir
cd $output_dir

if wget $cab_url; then
  cabextract $cab_name

  if mv *.ttf $font_dir; then
    if fc-cache -fv; then
      rm -rf $output_dir
      echo "Tahoma font is now installed"
    else
      echo "Could not rebuild font cache"
      exit -1
    fi
  else
    echo "Could not copy the font to $font_dir"
    exit -1
  fi
else
  echo "Could not download Tahoma font"
  exit -1
fi
