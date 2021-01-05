print("~~~ Begin FTBQuests Init ~~~");

//Change recipe for FTBQuests utility blocks.
recipes.removeShaped(<ftbquests:screen>, [[<ore:stone>, <ore:stone>, <ore:stone>], [<ore:stone>, <ftbquests:book>, <ore:stone>], [<ore:stone>, <ore:stone>, <ore:stone>]]);
recipes.removeShaped(<ftbquests:progress_screen>, [[<ftbquests:screen>, <ftbquests:screen>, <ftbquests:screen>], [<ftbquests:screen>, <ftbquests:book>, <ftbquests:screen>], [<ftbquests:screen>, <ftbquests:screen>, <ftbquests:screen>]]);

//Add Recipes for Screens
recipes.addShaped(scripts.helpers.createRecipeName(<ftbquests:screen>), <ftbquests:screen>, [[<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>], [<ore:ingotIron>, <ore:ingotPulsatingIron>, <ore:ingotIron>], [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>]]);
recipes.addShaped(scripts.helpers.createRecipeName(<ftbquests:progress_screen>), <ftbquests:progress_screen>, [[null, <ore:nuggetPulsatingIron>, null], [<ore:nuggetPulsatingIron>, <ftbquests:screen>, <ore:nuggetPulsatingIron>], [null, <ore:nuggetPulsatingIron>, null]]);

//Change Book Recipe
recipes.remove(<ftbquests:book>);
recipes.addShaped(scripts.helpers.createRecipeName(<ftbquests:book>), <ftbquests:book>, [[<ore:nuggetIron>, <ore:nuggetIron>, null], [<ore:nuggetIron>, <ore:gemLapis>, <ore:nuggetIron>], [null, <ore:nuggetIron>, null]]);

print("### FTBQuests Init Complete ###");
