rc3 NOWHERE map of FraMa
========================

This is the map of the shared assembly of CCC [Frankfurt] and CCC [Mannheim].

Usage
-----

Execute automapping (Ctrl+M) after changing the map. (adds collison, fixes and finishes several things)

Only edit the `.tmx` maps and `.tsx` tilesets.

Edit source `.png`s if a `.png` has a `.kra` of the same name next to it.

All generated `.png`s and the `.json` map files can be generated with:

```
make all
```

Lint the map like
```
make lint LINT=/tmp/binwalint/dist/walint
```


What else?
----------

Find out more about/of the [LPC] assets we used. [¹] [²]

See the rc3 [howto]. [💾]

Find last years assembly [here].


[Frankfurt]: https://ccc-ffm.de/
[Mannheim]: https://www.ccc-mannheim.de/
[LPC]: https://lpc.opengameart.org/
[¹]: https://opengameart.org/content/lpc-collection
[²]: https://opengameart.org/content/lpcontemporary
[howto]: https://howto.rc3.world/
[💾]: https://web.archive.org/web/*/https://howto.rc3.world/
[here]: tree/2020/
