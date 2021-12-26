TILED=tiled
KRITA=krita
OPNG=optipng

all: main.json pics/scifi_space_rpg_tiles_lpcized_mate_frama.png

%.json: %.tmx tilesets/*.tsx
	$(TILED) --export-map --embed-tilesets "$<" "$@"

%.png: %.kra %/*.png
	$(KRITA) --export --export-filename "$@" "$<"
	$(OPNG) -o7 -zm1-9 "$@"