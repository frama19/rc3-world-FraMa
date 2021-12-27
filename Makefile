TILED=tiled
KRITA=krita
OPNG=optipng
#XMLStarlet
XML=xml
# https://git.cccv.de/hub/walint/
# precompiled binaries at https://git.cccv.de/hub/walint/-/jobs
LINT=walint
TMX=$(patsubst %.tmx,%.json,$(wildcard *.tmx))
KRA=$(patsubst %.kra,%.png,$(wildcard pics/*.kra))

.PHONY: all lint
all: $(TMX) $(KRA) LICENSE.md

%.json: %.tmx tilesets/*.tsx
	$(TILED) --export-map --embed-tilesets "$<" "$@"

%.png: %.kra %/*.png
	$(KRITA) --export --export-filename "$@" "$<"
	$(OPNG) -o7 -zm1-9 "$@"

LICENSE.md: *.tmx tilesets/*.tsx
	-echo "*This file got generated*" > $@
	-echo  >> $@
	find . -maxdepth 1 -name "*.tmx" -exec xml sel -T -t -m '//property[@name="mapCopyright"]' -v . -n -n {} \; >> $@
	find tilesets -name "*.tsx" -exec xml sel -T -t -m '//property[@name="tilesetCopyright"]' -v . -n -n {} \; >> $@
	cat LICENSE.links.md >> $@

lint:
	$(LINT) --config-file=lintconfig.json