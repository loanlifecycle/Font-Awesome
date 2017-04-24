#!/usr/bin/env bash

src="$HOME/Font-Awesome/src"
tmp="tmp"
components="$CIRCLE_ARTIFACTS/components"
pattern_fonts="\/\* import fonts \*\/"
pattern_url="url\(['\"](\.\.\/?)*((\/[[:alnum:]_\.\-]+)+)([\?#]+[[:alnum:]=&#_\.\-]+)?['\"]\)"
fa="$HOME/Font-Awesome"
fa_dist="$fa/dist/assets/font-awesome"
fa_styles="$fa_dist/css"
fa_archive="font-awesome.zip"
fa_rsrc="font_awesome.resource"
fa_fonts="font-awesome-font.css"
fa_cmp="Define_Font_Awesome_Fonts.component"
fa_url="url(\"{\!URLFOR(\$Resource.font_awesome, \'\2\')}\4\")"

mkdir "tmp"
mkdir $components
cp "$fa_dist/$fa_archive" "$components/$fa_rsrc"
sed -E "s/$pattern_url/$fa_url/g" "$fa_styles/$fa_fonts" | sed -E "s/&/&amp;/g" > "$tmp/$fa_fonts"
sed -E "/$pattern_fonts/r $tmp/$fa_fonts" "$components/$fa_cmp" > "$tmp/$fa_cmp"
sed -E "/$pattern_fonts/d" "$tmp/$fa_cmp" > "$components/$fa_cmp"