OUT=www

rm -rf $OUT
mkdir $OUT

echo "<html>" > $OUT/index.html
echo "<head>" >> $OUT/index.html
echo "<title>darmok.com: Memes in the Tamarian Language</title>" >> $OUT/index.html
echo "<meta property=\"og:title\" content=\"darmok.com\" />" >> $OUT/index.html
echo "<meta property=\"og:image\" content=\"darmok/darmok.jpg\" />" >> $OUT/index.html
echo "<meta name=\"viewport\" content=\"width=380\">" >> $OUT/index.html
# https://github.com/simonwhitaker/github-fork-ribbon-css
echo "<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/github-fork-ribbon-css/0.2.3/gh-fork-ribbon.min.css\" />" >> $OUT/index.html
echo "</head>" >> $OUT/index.html
echo "<body>" >> $OUT/index.html
echo "<a class=\"github-fork-ribbon\" href=\"https://github.com/mist64/darmok\" data-ribbon=\"Fork me on GitHub\" title=\"Fork me on GitHub\">Fork me on GitHub</a>" >> $OUT/index.html
echo "<p align=\"center\">" >> $OUT/index.html


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
	echo "<img onmouseover=\"this.src='${key}/${key}.jpg';\" onmouseout=\"this.src='$key/orig.${orig_extension}';\" src=\"$key/orig.${orig_extension}\" alt=\"$value\" width=\"160\" style=\"vertical-align: top;\">" >> $OUT/index.html
	echo "</a>" >> $OUT/index.html
done

echo "</p>" >> $OUT/index.html
echo "<hr>" >> $OUT/index.html
echo "<p align=\"center\">Anything missing? <a href=\"mailto:admin@darmok.com\">admin@darmok.com</a> or <a href=\"https://github.com/mist64/darmok\">github.com/mist64/darmok</a></p>" >> $OUT/index.html
echo "</body>" >> $OUT/index.html
echo "</html>" >> $OUT/index.html