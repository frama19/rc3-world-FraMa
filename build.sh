#!/usr/bin/sh

# needs:
# - tiled
# - krita
# - optipng

# convert tmx to json with embedded tielset
for tmx in *.tmx; do
        json="$(basename "$(echo "$tmx")" .tmx).json"
        echo "Export $tmx to $json"
        tiled --export-map --minimize --embed-tilesets "$tmx" "$json"
done

for kra in pics/*.kra; do
        png="pics/$(basename "$(echo "$kra")" .kra).png"
        echo "Export $kra to $png..."
        krita --export --export-filename "$png" "$kra"
        optipng -o7 -zm1-9 "$png"
done

echo "Conversion completed."