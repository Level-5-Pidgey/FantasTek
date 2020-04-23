
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
<enderio:item_material:52>,
<enderio:item_material:75>
] as crafttweaker.item.IItemStack[];

for dye in dyes
{
	scripts.helpers.unstageAndHide(dye);
}

val recipesToRemove=
[
<enderio:item_capacitor_silver>,
<enderio:item_capacitor_energetic_silver>,
<enderio:block_decoration3:3>,
<enderio:block_decoration2:15>,
<enderio:item_inventory_charger_simple>,
<enderio:block_tele_pad>,
<enderio:block_electric_light>,
<enderio:block_solar_panel:2>,
<enderio:block_solar_panel:1>,
<enderio:block_wireless_charger>,
<enderio:block_cap_bank:1>,
<enderio:item_capacitor_vivid>,
<enderio:block_cap_bank:2>,
<enderio:block_normal_wireless_charger>,
<enderio:block_solar_panel:3>,
<enderio:item_capacitor_crystalline>,
<enderio:block_cap_bank:3>,
<enderio:item_capacitor_stellar>,
<enderio:item_capacitor_melodic>,
<enderio:block_dialing_device>,
<enderio:block_weather_obelisk>,
<enderio:block_transceiver>,
<enderio:block_enhanced_wireless_charger>,
<enderio:block_zombie_generator>
] as crafttweaker.item.IItemStack[];

for item in recipesToRemove
{
	recipes.remove(item);
}

//remove slice n splice recipes
val snsToRemove=
[
<enderio:item_capacitor_totemic>,
<enderio:block_enderman_skull:2>,
<enderio:item_material:40>
] as crafttweaker.item.IItemStack[];

for sns in snsToRemove
{
	mods.enderio.SliceNSplice.removeRecipe(sns);
}

//remove all endergy conduits that use Infinity Reagent
recipes.remove(<enderio:item_endergy_conduit:*>);

//remove grainy capacitor
scripts.helpers.unstageAndHide(<enderio:item_capacitor_grainy>);

//Add Conductive/Redstone Alloy Dust crafting
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:dustConductiveIron>.firstItem), <ore:dustConductiveIron>.firstItem, [<ore:dustIron>, <ore:dustRedstone>]); //Conductive Iron Dust
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:dustRedstoneAlloy>.firstItem), <ore:dustRedstoneAlloy>.firstItem, [<ore:dustIron>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>]); //Redstone Alloy Dust
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:dustPulsatingIron>.firstItem), <ore:dustPulsatingIron>.firstItem, [<ore:dustIron>, <ore:dustEnder>]); //Pulsating Iron Dust

//Change Crude Steel Crafting
//Tinkers Melting
mods.tconstruct.Casting.addTableRecipe(<ore:plateSteel>.firstItem, <tconstruct:cast_custom:3>, <liquid:crude_steel>, 144 * 4, false);
mods.tconstruct.Casting.addTableRecipe(<ore:gearSteel>.firstItem, <tconstruct:cast_custom:4>, <liquid:crude_steel>, 144 * 4, false);
//Machines
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_endergy_ingot>);
mods.enderio.AlloySmelter.addRecipe(<ore:ingotCrudeSteel>.firstItem * 2, [<ore:ingotIron>, <contenttweaker:coke_dust>], 4500);
//Crafting
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:plateSteel>.firstItem), <ore:plateSteel>.firstItem, [<embers:tinker_hammer>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>]);
recipes.addShaped(scripts.helpers.createRecipeName(<ore:gearSteel>.firstItem), <ore:gearSteel>.firstItem, [[null, <ore:ingotCrudeSteel>, null], [<ore:ingotCrudeSteel>, null, <ore:ingotCrudeSteel>], [null, <ore:ingotCrudeSteel>, null]]);


print("### EnderIO Init Complete ###");
