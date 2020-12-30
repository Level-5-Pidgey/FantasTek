
//DOCUMENTATION PAGE FOR CRAFTTWEAKER AND ENDERIO: https://github.com/Shadows-of-Fire/EnderTweaker/blob/master/Documentation.md

print("~~~ Begin EnderIO Init ~~~");

//Made Energetic Alloy Harder to craft.
mods.tconstruct.Alloy.removeRecipe(<liquid:energetic_alloy>);
mods.tconstruct.Alloy.addRecipe(<liquid:energetic_alloy> * 72, [<liquid:redstone> * 50, <liquid:glowstone> * 125, <liquid:electrum> * 72]);
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_ingot:1>);
mods.enderio.AlloySmelter.addRecipe(<enderio:item_alloy_ingot:1>, [<ore:dustRedstone>, <ore:ingotElectrum>, <ore:dustGlowstone>], 5000);

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

//Remove Dyes
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

//Remove EnderIO recipes
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

//Remove Slice 'N Splice recipes
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

//Remove all Endergy conduits that use Infinity Reagent
recipes.remove(<enderio:item_endergy_conduit:*>);

//Remove Grainy Capacitor
scripts.helpers.unstageAndHide(<enderio:item_capacitor_grainy>);

//Add Alloy Dust crafting
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:dustConductiveIron>.firstItem), <ore:dustConductiveIron>.firstItem, [<ore:dustIron>, <ore:dustRedstone>]); //Conductive Iron Dust
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:dustRedstoneAlloy>.firstItem), <ore:dustRedstoneAlloy>.firstItem, [<ore:dustIron>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>]); //Redstone Alloy Dust
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:dustPulsatingIron>.firstItem), <ore:dustPulsatingIron>.firstItem, [<ore:dustIron>, <ore:dustEnder>]); //Pulsating Iron Dust

//Change Crude Steel Crafting
//Tinkers Melting
mods.tconstruct.Casting.addTableRecipe(<ore:plateCrudeSteel>.firstItem, <tconstruct:cast_custom:3>, <liquid:crude_steel>, 144 * 4, false);
mods.tconstruct.Casting.addTableRecipe(<ore:gearCrudeSteel>.firstItem, <tconstruct:cast_custom:4>, <liquid:crude_steel>, 144 * 4, false);
//Machines
mods.enderio.AlloySmelter.removeRecipe(<ore:ingotCrudeSteel>.firstItem);
scripts.helpers.addAlloySmeltingRecipe(<ore:ingotCrudeSteel>.firstItem * 2, <ore:ingotIron>.firstItem, <contenttweaker:coke_dust>, 3000);

//Crafting
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:plateCrudeSteel>.firstItem), <ore:plateCrudeSteel>.firstItem, [<embers:tinker_hammer>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>]);
recipes.addShaped(scripts.helpers.createRecipeName(<ore:gearCrudeSteel>.firstItem), <ore:gearCrudeSteel>.firstItem, [[null, <ore:ingotCrudeSteel>, null], [<ore:ingotCrudeSteel>, null, <ore:ingotCrudeSteel>], [null, <ore:ingotCrudeSteel>, null]]);

//Change Redstone Alloy (EnderIO Ver) Crafting
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_ingot:3>);
mods.enderio.AlloySmelter.addRecipe(<enderio:item_alloy_ingot:3>, [<ore:ingotIron>, <ore:dustRedstone> * 8], 1500);

//Shaped Mod Crafting Recipes
val enderioRecipes_CRAFTINGTABLE = {
	//
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in enderioRecipes_CRAFTINGTABLE {
	if (recipes.getRecipesFor(key.withAmount(1)).length == 0) {
        recipes.remove(key.withAmount(1));
    }

	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

val enderioRecipes_EXTENDEDCRAFTING = {
	<enderio:block_simple_furnace> : [[<ore:ingotIron>, <minecraft:furnace>, <ore:ingotIron>], [<ore:bricksStone>, scripts.helpers.FrameTiers[0], <ore:bricksStone>], [<ore:bricksStone>, <magneticraft:crafting:2>, <ore:bricksStone>]],
	<enderio:block_simple_wired_charger> : [[<ore:bricksStone>, <ore:ingotElectrotineAlloy>, <ore:bricksStone>], [<magneticraft:battery_item_low>, scripts.helpers.FrameTiers[0], <magneticraft:battery_item_low>], [<ore:bricksStone>, <ore:ingotRedstoneAlloy>, <ore:bricksStone>]],
	<enderio:block_solar_panel> * 3 : [[<enderio:item_material:3>, <enderio:item_material:3>, <enderio:item_material:3>], [<ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>]],
	<enderio:item_material> : [[<ore:plateCrudeSteel>, <ore:ingotElectrotineAlloy>, <ore:plateCrudeSteel>], [<ore:ingotElectrotineAlloy>, null, <ore:ingotElectrotineAlloy>], [<ore:plateCrudeSteel>, <ore:ingotElectrotineAlloy>, <ore:plateCrudeSteel>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in enderioRecipes_EXTENDEDCRAFTING {
	if (recipes.getRecipesFor(key.withAmount(1)).length == 0) {
        recipes.remove(key.withAmount(1));
    }

	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

//Change Photovoltaic Plate Recipe Process
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_material:3>);
furnace.addRecipe(<enderio:item_material:3>, <enderio:item_material:38>);

//Carpenter Simple Machine Chassis
mods.forestry.Carpenter.addRecipe(<enderio:item_material>, [[<ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>],[<ore:ingotCrudeSteel>, <ore:ingotElectrotineAlloy>, <ore:ingotCrudeSteel>],[<ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>]], 60, <liquid:water> * 1000);
mods.forestry.Carpenter.addRecipe(<enderio:item_material>, [[null, <ore:plateSteel>, null],[<ore:plateSteel>, <ore:ingotElectrotineAlloy>, <ore:plateSteel>],[null, <ore:plateSteel>, null]], 30, <liquid:water> * 500);

print("### EnderIO Init Complete ###");
