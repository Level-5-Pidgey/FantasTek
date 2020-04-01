
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

print("### EnderIO Init Complete ###");
