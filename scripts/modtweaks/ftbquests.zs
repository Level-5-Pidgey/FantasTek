print("~~~ Begin FTBQuests Init ~~~");

//Change recipe for FTBQuests utility blocks.
recipes.removeShaped(<ftbquests:screen>, [[<ore:stone>, <ore:stone>, <ore:stone>], [<ore:stone>, <ftbquests:book>, <ore:stone>], [<ore:stone>, <ore:stone>, <ore:stone>]]);
recipes.removeShaped(<ftbquests:progress_screen>, [[<ftbquests:screen>, <ftbquests:screen>, <ftbquests:screen>], [<ftbquests:screen>, <ftbquests:book>, <ftbquests:screen>], [<ftbquests:screen>, <ftbquests:screen>, <ftbquests:screen>]]);

print("### FTBQuests Init Complete ###");
