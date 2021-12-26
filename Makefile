TILED=tiled
KRITA=krita
OPNG=optipng
#XMLStarlet
XML=xml

all: main.json pics/scifi_space_rpg_tiles_lpcized_mate_frama.png LICENSE.md

%.json: %.tmx tilesets/*.tsx
	$(TILED) --export-map --embed-tilesets "$<" "$@"

%.png: %.kra %/*.png
	$(KRITA) --export --export-filename "$@" "$<"
	$(OPNG) -o7 -zm1-9 "$@"

LICENSE.md: *.tmx tilesets/*.tsx
	echo "*This file is generated*" > $@
	echo  >> $@
	find . -maxdepth 1 -name "*.tmx" -exec xml sel -T -t -m '//property[@name="mapCopyright"]' -v . -n -n {} \; >> $@
	find tilesets -name "*.tsx" -exec xml sel -T -t -m '//property[@name="tilesetCopyright"]' -v . -n -n {} \; >> $@
	cat LICENSE.links.md >> $@