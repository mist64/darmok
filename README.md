# Darmok.com

This repository contains everything that is necessary to create [darmok.com](http://darmok.com), a website that serves some common memes in the Tamarian language:

* The original GIF/JPG files
* The rules that map memes to the Tamarian language
* The script to generate the website
* A script to upload the data to the web server using FTP

## Dependencies

### meme-rs

(for creating the images)

	git clone https://github.com/nbaztec/meme-rs
	cd meme-rs
	sudo make install

### ncftp

(for uploading uploading to the webserver)

	brew install ncftp

## Create Website

	./generate.sh

## Upload Website

	./upload.sh

This requires a file ~/bin/darmok.txt containing the FTP data in the following format:

	host <hostname>
	user <username>
	pass <password>

## Author

Michael Steil, <mist64@mac.com>, [pagetable.com](http://www.pagetable.com)

## License

2-clause BSD

## Contributing

Contributions are highly appreciated:

* additional memes
* prettier website

## References

* [Neil Shyminsky on Twitter](https://twitter.com/neilshyminsky/status/1302322781091229700)
* [Chris Taylor: Engage! A brief history of 'TNG' memes](https://mashable.com/feature/star-trek-memes-the-next-generation/)
* [Wikipedia: Tamarian use of language](https://en.wikipedia.org/wiki/Darmok#Tamarian_use_of_language)
* [KnowYourMeme](https://knowyourmeme.com/types/reaction?sort=views&status=all)
* [imgflip](https://imgflip.com/memetemplates)
