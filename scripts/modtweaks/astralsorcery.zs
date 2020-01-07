print("~~~ Begin Astral Sorcery Init ~~~");

//Change Recipe for Astral Tome
recipes.removeByRecipeName("astralsorcery:shaped/journal");
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/journal");
recipes.addShapeless("astral_journal", <astralsorcery:itemjournal>, [<minecraft:book>,<ore:gemAquamarine>]);

//Change Recipe for the Astral Wand
recipes.removeByRecipeName("astralsorcery:shaped/tool_basicwand");
recipes.addShaped("resonating_wand", <astralsorcery:itemwand>.withTag({astralsorcery: {}}), [[null, <ore:enderpearl>, <ore:plateAquamarine>], [null, <ore:stoneMarble>, <ore:enderpearl>], [<ore:stickWood>, null, null]]);
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/tool_basicwand");
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("internal/altar/tool_basicwand", <astralsorcery:itemwand>.withTag({astralsorcery: {}}), 200, 60,
[
 null, <ore:gemAquamarine>, <ore:enderpearl>,
 null, <ore:blockMarble>, <ore:gemAquamarine>,
 <ore:stickWood>, null, null
]);

//Change Glass Lens Recipe
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/glasslens");
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("internal/altar/glasslens", <astralsorcery:itemcraftingcomponent:3>, 200, 40,
[
 null, <ore:blockGlass>, null,
 <ore:blockGlass>, <ore:dustAquamarine>, <ore:blockGlass>,
 null, <ore:blockGlass>, null
]);

//Change Grindstone Recipe
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/grindstone");
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("internal/altar/grindstone", <astralsorcery:blockmachine:1>, 200, 60,
[
 null, null, null,
 null, <ore:gearQuartz>, <ore:plateWood>,
 <ore:stickWood>, <ore:obsidian>, <ore:plateWood>
]);

//Change Sextant Recipe
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/sextant");
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("internal/altar/sextant", <astralsorcery:itemsextant>.withTag({astralsorcery: {}}), 200, 40,
[
 null, <astralsorcery:itemcraftingcomponent:3>, null,
 <ore:ingotGold>, <astralsorcery:itemcraftingcomponent:3>, <ore:ingotGold>,
 <ore:plateWood>, <ore:plateWood>, <ore:plateWood>
]);

//Change Hand Telescope Recipe
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/handtelescope");
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("internal/altar/handtelescope", <astralsorcery:itemsextant>.withTag({astralsorcery: {}}), 200, 40,
[
 null, <ore:plateWood>, <astralsorcery:itemcraftingcomponent:3>,
 <ore:plateWood>, <ore:plateGold>, <ore:plateWood>,
 <ore:stickWood>, <ore:plateWood>, null
]);

//Change Attunement Relay Recipe
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/attunementrelay");
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("internal/altar/attunementrelay", <astralsorcery:blockattunementrelay>, 200, 40,
[
 null, null, null,
 <ore:plateGold>, <astralsorcery:itemcraftingcomponent:3>, <ore:plateGold>,
 <ore:plankWood>, <ore:stoneMarble>, <ore:plankWood>
]);

//Change Lightwell Recipe
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/lightwell");
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("internal/altar/lightwell", <astralsorcery:blockwell>, 200, 80,
[
  <astralsorcery:blockmarble:4>, <ore:blockglowstone>, <astralsorcery:blockmarble:4>,
  <astralsorcery:blockmarble:4>, mods.astralsorcery.Utils.getCrystalORIngredient(false, false), <astralsorcery:blockmarble:4>,
  <astralsorcery:blockmarble:6>, <ore:plateAquamarine>, <astralsorcery:blockmarble:6>
]);

//Change Cave Illuminator Recipe
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/illuminator");
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("internal/altar/illuminator", <astralsorcery:blockworldilluminator>, 200, 80,
[
 <astralsorcery:itemusabledust>, <ore:blockglowstone>, <astralsorcery:itemusabledust>,
 <ore:blockglowstone>, mods.astralsorcery.Utils.getCrystalORIngredient(false, false), <ore:blockglowstone>,
 <astralsorcery:itemusabledust>, <ore:blockglowstone>, <astralsorcery:itemusabledust>
]);

print("### Astral Sorcery Init Complete ###");
