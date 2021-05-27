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
		
done
