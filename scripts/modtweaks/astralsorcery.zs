print("~~~ Begin Astral Sorcery Init ~~~");

//Change Recipe for Astral Tome
recipes.removeByRecipeName("astralsorcery:shaped/journal");
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/journal");
recipes.addShapeless("astral_journal", <astralsorcery:itemjournal>, [<minecraft:book>,<ore:gemAquamarine>]);

//Change Recipe for the Astral Wand
recipes.removeByRecipeName("astralsorcery:shaped/tool_basicwand");
mods.recipestages.Recipes.addShaped("resonating_wand", scripts.staging.stages.AstralSorcery1.stage, <astralsorcery:itemwand>.withTag({astralsorcery: {}}), [[null, <ore:enderpearl>, <ore:plateAquamarine>], [null, <ore:stoneMarble>, <ore:enderpearl>], [<ore:stickWood>, null, null]]);
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

//Astral Sorcery -- Add sooty marble chiselability
mods.chisel.Carving.addGroup("sootyMarble");
val sootyMarbles =
[
	<astralsorcery:blockblackmarble>,
	<astralsorcery:blockblackmarble:1>,
	<astralsorcery:blockblackmarble:2>,
	<astralsorcery:blockblackmarble:3>,
	<astralsorcery:blockblackmarble:4>,
	<astralsorcery:blockblackmarble:5>,
	<astralsorcery:blockblackmarble:6>
] as crafttweaker.item.IItemStack[];

for item in sootyMarbles {
	mods.chisel.Carving.addVariation("sootyMarble", item);
}

//Add elemental crystal crafting
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("elemental_crystal_air", <contenttweaker:astral_crystal_air>, 200, 80,
[
 null, scripts.helpers.T1MagicAirIngredients[0], null,
 scripts.helpers.T1MagicAirIngredients[3], mods.astralsorcery.Utils.getCrystalORIngredient(false, false), scripts.helpers.T1MagicAirIngredients[1],
 null, scripts.helpers.T1MagicAirIngredients[2], null
]); //Air
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("elemental_crystal_fire", <contenttweaker:astral_crystal_fire>, 200, 80,
[
 null, scripts.helpers.T1MagicFireIngredients[0], null,
 scripts.helpers.T1MagicFireIngredients[3], mods.astralsorcery.Utils.getCrystalORIngredient(false, false), scripts.helpers.T1MagicFireIngredients[1],
 null, scripts.helpers.T1MagicFireIngredients[2], null
]); //Fire
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("elemental_crystal_water", <contenttweaker:astral_crystal_water>, 200, 80,
[
 null, scripts.helpers.T1MagicWaterIngredients[0], null,
 scripts.helpers.T1MagicWaterIngredients[3], mods.astralsorcery.Utils.getCrystalORIngredient(false, false), scripts.helpers.T1MagicWaterIngredients[1],
 null, scripts.helpers.T1MagicWaterIngredients[2], null
]); //Water
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("elemental_crystal_earth", <contenttweaker:astral_crystal_earth>, 200, 80,
[
 null, scripts.helpers.T1MagicEarthIngredients[0], null,
 scripts.helpers.T1MagicEarthIngredients[3], mods.astralsorcery.Utils.getCrystalORIngredient(false, false), scripts.helpers.T1MagicEarthIngredients[1],
 null, scripts.helpers.T1MagicEarthIngredients[2], null
]); //Earth

print("### Astral Sorcery Init Complete ###");
