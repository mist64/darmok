rm -rf web
mkdir web
while IFS=":" read -r key value; do
	echo $key
	mkdir web/$key
	meme-gen template.png web/${key}/${key}.jpg "$value"
done < darmok.txt
