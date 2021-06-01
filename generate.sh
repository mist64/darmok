OUT=darmok

rm -rf $OUT
mkdir $OUT
cat darmok.txt | grep -v "^#" | while IFS=":" read -r key value; do
	echo $key
	value=$(echo $value | sed -e "s/^ *//")
	mkdir $OUT/$key
	meme-gen template.png $OUT/${key}/${key}.jpg "$value"
	cat index.html | 
		sed -e "s/KEY/$key/" |
		sed -e "s/ALT/$value/" > $OUT/${key}/index.html

	echo "<a href=\"$key\">" >> $OUT/index.html
	echo "<img src=\"$key/${key}.jpg\" alt=\"$value\" width=\"160\">" >> $OUT/index.html
	echo "</a>" >> $OUT/index.html
done
