OUT=www

rm -rf $OUT
mkdir $OUT

echo "<html>" > $OUT/index.html
echo "<head>" >> $OUT/index.html
echo "<meta property=\"og:title\" content=\"darmok.com\" />" >> $OUT/index.html
echo "<meta property=\"og:image\" content=\"darmok/darmok.jpg\" />" >> $OUT/index.html
echo "</head>" >> $OUT/index.html
echo "<body>" >> $OUT/index.html


cat darmok.txt | grep -v "^#" | while IFS=":" read -r key value link; do
	value=$(echo $value | sed -e "s/^ *//")
	link=$(echo $link | sed -e "s/^ *//")
	link=${link//\//\\\/}
	orig=$( (cd orig; ls ${key}.*) )
	orig_extension="${orig##*.}"

	echo $key

	mkdir $OUT/$key
	meme-gen template.png $OUT/${key}/${key}.jpg "$value"
	cp orig/$orig $OUT/$key/orig.$orig_extension
	cat index.html | 
		sed -e "s/KEY/$key/" |
		sed -e "s/EXTENSION/$orig_extension/" |
		sed -e "s/ALT/$value/" |
		sed -e "s/LINK/$link/g" > $OUT/${key}/index.html

	echo "<a href=\"$key\">" >> $OUT/index.html
	#echo "<img src=\"$key/${key}.jpg\" alt=\"$value\" width=\"160\">" >> $OUT/index.html
	echo "<img src=\"$key/orig.${orig_extension}\" alt=\"$value\" width=\"160\">" >> $OUT/index.html
	echo "</a>" >> $OUT/index.html
done

echo "<hr>" >> $OUT/index.html
echo "<p align=\"right\">Anything missing? <a href=\"mailto:admin@darmok.com\">admin@darmok.com</a></p>" >> $OUT/index.html
echo "</body>" >> $OUT/index.html
echo "</html>" >> $OUT/index.html