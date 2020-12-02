print("~~~ Begin Astral Sorcery Init ~~~");

//Change Recipe for Astral Tome
recipes.removeByRecipeName("astralsorcery:shaped/journal");
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/journal");
recipes.addShapeless("astral_journal", <astralsorcery:itemjournal>, [<ore:book>, <ore:blockMarble>, <ore:nuggetPrismarine> | <ore:crystalsPrismarine>]);

//Change Recipe for the Astral Wand
recipes.removeByRecipeName("astralsorcery:shaped/tool_basicwand");
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<astralsorcery:itemwand>.withTag({astralsorcery: {}})), scripts.staging.stages.AstralSorcery1.stage, <astralsorcery:itemwand>.withTag({astralsorcery: {}}), [[null, <ore:enderpearl>, <ore:plateAquamarine>], [null, <ore:stoneMarble>, <ore:enderpearl>], [<ore:stickWood>, null, null]]);
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
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("internal/altar/handtelescope", <astralsorcery:itemhandtelescope>.withTag({astralsorcery: {}}), 200, 40,
[
 null, <ore:plateWood>, <astralsorcery:itemcraftingcomponent:3>,
 <ore:plateWood>, <ore:ingotGold>, <ore:plateWood>,
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

//Change Illumination Powder Recipe
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/illuminationpowder");
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("internal/altar/illuminationpowder", <astralsorcery:itemusabledust> * 16, 200, 40,
[
 null, <ore:dustGlowstone>, null,
 <ore:dustGlowstone>, <ore:dustAquamarine>, <ore:dustGlowstone>,
 null, <ore:dustGlowstone>, null
]);

//Change Nocturnal Powder Recipe
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/nocturnalpowder");
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("internal/altar/nocturnalpowder", <astralsorcery:itemusabledust:1> * 16, 200, 40,
[
 null, <ore:dustAsh>, null,
 <ore:dustAsh>, <ore:dustAquamarine>, <ore:dustAsh>,
 null, <ore:dustAsh>, null
]);

//Change Cave Illuminator Recipe
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/illuminator");
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("internal/altar/illuminator", <astralsorcery:blockworldilluminator>, 200, 80,
[
 <astralsorcery:itemusabledust>, <ore:blockGlowstone>, <astralsorcery:itemusabledust>,
 <ore:blockGlowstone>, mods.astralsorcery.Utils.getCrystalORIngredient(false, false), <ore:blockGlowstone>,
 <astralsorcery:itemusabledust>, <ore:blockGlowstone>, <astralsorcery:itemusabledust>
]);

//Melting Elemental Crystals into Liquids
mods.astralsorcery.Lightwell.addLiquefaction(<contenttweaker:astral_crystal_fire>, <liquid:elemental_water_fire>, 0.8, 4, 13910553);
mods.astralsorcery.Lightwell.addLiquefaction(<contenttweaker:astral_crystal_water>, <liquid:elemental_water_water>, 0.8, 4, 7274449);
mods.astralsorcery.Lightwell.addLiquefaction(<contenttweaker:astral_crystal_air>, <liquid:elemental_water_air>, 0.8, 4, 15459018);
mods.astralsorcery.Lightwell.addLiquefaction(<contenttweaker:astral_crystal_earth>, <liquid:elemental_water_earth>, 0.8, 4, 8577869);

print("### Astral Sorcery Init Complete ###");
