
//DOCUMENTATION PAGE FOR CRAFTTWEAKER AND ENDERIO: https://github.com/Shadows-of-Fire/EnderTweaker/blob/master/Documentation.md

print("~~~ Begin EnderIO Init ~~~");

//Made Energetic Alloy Harder to craft.
mods.tconstruct.Alloy.removeRecipe(<liquid:energetic_alloy>);
mods.tconstruct.Alloy.addRecipe(<liquid:energetic_alloy> * 72, [<liquid:redstone> * 50, <liquid:glowstone> * 125, <liquid:electrum> * 72]);
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_ingot:1>);
mods.enderio.AlloySmelter.addRecipe(<enderio:item_alloy_ingot:1>, [<ore:dustRedstone>, <ore:ingotElectrum>, <ore:dustGlowstone>], 10000);

//Remove power gen options
val enderIOGenerators =
[
	<enderio:block_combustion_generator>,
	<enderio:block_enhanced_combustion_generator>,
	<enderio:block_stirling_generator>,
	<enderio:block_simple_stirling_generator>,
	<enderio:block_decoration3:2>,
	<enderio:block_decoration2:10>,
	<enderio:block_lava_generator>
] as crafttweaker.item.IItemStack[];

for generator in enderIOGenerators
{
	scripts.helpers.unstageAndHide(generator);
}

//Hide some JEI categories
val enderIOCategories =
[
	"Painter",
	"CombustionGenerator",
	"StirlingGenerator",
	"LavaGenerator"
] as string[];

for category in enderIOCategories
{
	mods.jei.JEI.hideCategory(category);
}

//Remove Dark Steel Crafting Recipes
mods.tconstruct.Alloy.removeRecipe(<liquid:dark_steel>);
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_ingot:6>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<ore:ingotSteel>.firstItem, <ore:dustObsidian>.firstItem * 4);
mods.thermalexpansion.InductionSmelter.removeRecipe(<ore:dustSteel>.firstItem, <ore:dustObsidian>.firstItem * 4);

//remove endercore slabs to bricks recipes
val slabstoblocks =
[
"endercore:slabwooddarkoak_to_planks",
"endercore:slabwoodbirch_to_planks",
"endercore:slabsandstone_to_sandstone",
"endercore:slabwoodacacia_to_planks",
"endercore:slabquartz_to_quartz_block",
"endercore:slabstonebricks_to_stonebrick",
"endercore:slabwoodoak_to_planks",
"endercore:slabwoodjungle_to_planks",
"endercore:slabstone_to_stone",
"endercore:slabbricks_to_brick_block",
"endercore:slabnetherbrick_to_nether_brick",
"endercore:slabwoodspruce_to_planks",
"endercore:slabcobblestone_to_cobblestone"
] as string[];

for recipe in slabstoblocks
{
	recipes.removeByRecipeName(recipe);
}

//remove dyes
val dyes =
[
<enderio:item_material:48>,
<enderio:item_material:49>,
<enderio:item_material:50>,
<enderio:item_material:51>,
<enderio:item_material:67>,
<enderio:item_material:52>
] as crafttweaker.item.IIngredient[];

for dye in dyes
{
	mods.jei.JEI.removeAndHide(dye);
}

//Add Conductive/Redstone Alloy Dust crafting
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:dustConductiveIron>.firstItem), <ore:dustConductiveIron>.firstItem, [<ore:dustIron>, <ore:dustRedstone>]); //Conductive Iron Dust
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:dustRedstoneAlloy>.firstItem), <ore:dustRedstoneAlloy>.firstItem, [<ore:dustIron>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>]); //Redstone Alloy Dust

print("### EnderIO Init Complete ###");
