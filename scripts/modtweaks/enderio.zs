
//DOCUMENTATION PAGE FOR CRAFTTWEAKER AND ENDERIO: https://github.com/Shadows-of-Fire/EnderTweaker/blob/master/Documentation.md

print("~~~ Begin EnderIO Init ~~~");

//Made Energetic Alloy Harder to craft.
mods.tconstruct.Alloy.removeRecipe(<liquid:energetic_alloy>);
mods.tconstruct.Alloy.addRecipe(<liquid:energetic_alloy> * 72, [<liquid:redstone> * 50, <liquid:glowstone> * 125, <liquid:electrum> * 72]);
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_ingot:1>);
mods.enderio.AlloySmelter.addRecipe(<enderio:item_alloy_ingot:1>, [<ore:dustRedstone>, <ore:ingotElectrum>, <ore:dustGlowstone>], 5000);
mods.advancedrocketry.ArcFurnace.addRecipe(<enderio:item_alloy_ingot:1>, 600, 8, <ore:ingotElectrum>.firstItem, <ore:dustRedstone>.firstItem, <ore:dustGlowstone>.firstItem, <ore:sand>.firstItem);

//Create Vibrant Alloy in an Arc Furnace
mods.advancedrocketry.ArcFurnace.addRecipe(<enderio:item_alloy_ingot:2>, 600, 16, <enderio:item_alloy_ingot:1>, <ore:enderpearl>.firstItem, <ore:sand>.firstItem);

//Remove power gen options
val enderIOGenerators =
[
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
	"StirlingGenerator",
	"LavaGenerator"
] as string[];

for category in enderIOCategories
{
	mods.jei.JEI.hideCategory(category);
}

//Change Dark Steel Crafting Recipes
mods.tconstruct.Alloy.removeRecipe(<liquid:dark_steel>);
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_ingot:6>);
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_ingot:6>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<ore:ingotSteel>.firstItem, <ore:dustObsidian>.firstItem * 4);
mods.thermalexpansion.InductionSmelter.removeRecipe(<ore:dustSteel>.firstItem, <ore:dustObsidian>.firstItem * 4);
scripts.helpers.addInjectionRecipe(<enderio:item_alloy_ingot:6>, <ore:ingotSteel>, <liquid:liquid_nightmares> * 100, 5000, 3);

//Change End Steel Crafting Recipes
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_ingot:8>);
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_ingot:8>);
scripts.helpers.addAlloySmeltingRecipe(<enderio:item_alloy_ingot:8> * 4, <enderio:item_alloy_ingot:6> * 4, <nuclearcraft:compound:8>, 15000, 2);
mods.enderio.AlloySmelter.addRecipe(<enderio:item_alloy_ingot:8> * 4, [<enderio:item_alloy_ingot:6> * 4, <ore:endstone> * 8, <ore:shulkerShell>], 17000);
scripts.mmhelper.IndustrialMixerFactoryRecipe(scripts.helpers.createRecipeName(<enderio:item_alloy_ingot:8>), 12500, 40, <liquid:end_steel> * 4000, null, <liquid:dark_steel> * 4000, null, null, null, <ore:endstone>.firstItem * 8, <minecraft:shulker_shell>, null);

//Change Soularium Crafting Recipes
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_ingot:7>);
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_ingot:7>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<ore:ingotGold>.firstItem, <minecraft:soul_sand>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<ore:dustGold>.firstItem, <minecraft:soul_sand>);
scripts.helpers.addAlloySmeltingRecipe(<enderio:item_alloy_ingot:7>, <ore:ingotNetherite>.firstItem, <minecraft:soul_sand>, 7000, 2);
scripts.helpers.addInjectionRecipe(<enderio:item_alloy_ingot:7>, <minecraft:soul_sand>, <liquid:netherite> * 144, 5000, 2);

//Change Energetic Steel Crafting Recipes
mods.tconstruct.Alloy.removeRecipe(<liquid:energetic_silver>);
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_endergy_ingot:5>);
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:5>);
mods.enderio.AlloySmelter.addRecipe(<enderio:item_alloy_endergy_ingot:5> * 4, [<ore:itemSilicon>, <ore:ingotSilver> * 4, <ore:ingotAluminium>], 12000);

//Change Crystalline Alloy Ingot Recipe
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_endergy_ingot:1>);
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:1>);
scripts.helpers.addAlloySmeltingRecipe(<enderio:item_alloy_endergy_ingot:1>, <enderio:item_alloy_endergy_ingot:6>, <enderio:item_material:36>, 12000, 2);
scripts.helpers.addAlloySmeltingRecipe(<enderio:item_alloy_endergy_ingot:1>, <enderio:item_alloy_ingot:2>, <enderio:item_material:36>, 12000, 2);

//Change Crystalline Pink Slime Ingot Recipe
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_endergy_ingot:4>);
scripts.helpers.addAlloySmeltingRecipe(<enderio:item_alloy_endergy_ingot:4> * 2, <industrialforegoing:pink_slime_ingot>, <enderio:item_alloy_endergy_ingot:1>, 30000, 2);

//Change Melodic Alloy Ingot Recipe
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_endergy_ingot:2>);
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:2>);
scripts.helpers.addAlloySmeltingRecipe(<enderio:item_alloy_endergy_ingot:2>, <enderio:item_alloy_endergy_ingot:1>, <minecraft:chorus_fruit_popped>, 25000, 3);

//Change Stellar Alloy Ingot Recipe
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_endergy_ingot:3>);
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:3> * 2);
scripts.helpers.addAlloySmeltingRecipe(<enderio:item_alloy_endergy_ingot:3> * 4, <enderio:item_alloy_endergy_ingot:2> * 4, <minecraft:nether_star>, 100000, 2);

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

//Remove and Hide some items
val enderIOHideItems =
[
	<enderio:item_material:48>,
	<enderio:item_material:49>,
	<enderio:item_material:50>,
	<enderio:item_material:51>,
	<enderio:item_material:67>,
	<enderio:item_material:52>,
	<enderio:item_material:75>,
	<enderio:block_inventory_panel>,
	<enderio:block_inventory_panel_sensor>,
	<enderio:block_inventory_chest_tiny>,
	<enderio:block_inventory_chest_small>,
	<enderio:block_inventory_chest_medium>,
	<enderio:block_inventory_chest_big>,
	<enderio:block_inventory_chest_large>,
	<enderio:block_inventory_chest_huge>,
	<enderio:block_inventory_chest_enormous>,
	<enderio:block_inventory_chest_warehouse>,
	<enderio:block_inventory_chest_warehouse13>,
	<enderio:item_inventory_remote>,
	<enderio:item_inventory_remote>.withTag({"enderio:energy": 60000, "enderio:famount": 2000}),
	<enderio:item_inventory_remote:1>,
	<enderio:item_inventory_remote:1>.withTag({"enderio:energy": 120000, "enderio:famount": 1000}),
	<enderio:item_inventory_remote:2>,
	<enderio:item_inventory_remote:2>.withTag({"enderio:energy": 150000, "enderio:famount": 1500}),
	<enderio:item_data_conduit>,
	<enderio:item_material:22>,
	<enderio:block_decoration3:1>,
	<enderio:block_simple_alloy_smelter>,
	<enderio:item_capacitor_grainy>
] as crafttweaker.item.IItemStack[];

for item in enderIOHideItems
{
	scripts.helpers.unstageAndHide(item);
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

//Add Alloy Dust crafting
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:dustConductiveIron>.firstItem), <ore:dustConductiveIron>.firstItem, [<ore:dustIron>, <ore:dustRedstone>]); //Conductive Iron Dust
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:dustRedstoneAlloy>.firstItem), <ore:dustRedstoneAlloy>.firstItem, [<ore:dustIron>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>]); //Redstone Alloy Dust
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:dustPulsatingIron>.firstItem), <ore:dustPulsatingIron>.firstItem, [<ore:dustIron>, <ore:dustEnder>]); //Pulsating Iron Dust

//Change Crude Steel Crafting
//Tinkers Melting
mods.tconstruct.Casting.addTableRecipe(<ore:plateCrudeSteel>.firstItem, <tconstruct:cast_custom:3>, <liquid:crude_steel>, 144 * 2, false);
mods.tconstruct.Casting.addTableRecipe(<ore:gearCrudeSteel>.firstItem, <tconstruct:cast_custom:4>, <liquid:crude_steel>, 144 * 4, false);
//Machines
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<ore:ingotCrudeSteel>.firstItem);
mods.enderio.AlloySmelter.removeRecipe(<ore:ingotCrudeSteel>.firstItem);
scripts.helpers.addAlloySmeltingRecipe(<ore:ingotCrudeSteel>.firstItem * 2, <ore:ingotIron>.firstItem, <contenttweaker:coke_dust>, 3000, 1);

//Crafting
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:plateCrudeSteel>.firstItem), <ore:plateCrudeSteel>.firstItem * 2, [<embers:tinker_hammer>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>]);
recipes.addShaped(scripts.helpers.createRecipeName(<ore:gearCrudeSteel>.firstItem), <ore:gearCrudeSteel>.firstItem, [[null, <ore:ingotCrudeSteel>, null], [<ore:ingotCrudeSteel>, <ore:ingotIron>, <ore:ingotCrudeSteel>], [null, <ore:ingotCrudeSteel>, null]]);

//Change Redstone Alloy (EnderIO Ver) Crafting
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_ingot:3>);
mods.enderio.AlloySmelter.addRecipe(<enderio:item_alloy_ingot:3>, [<ore:ingotIron>, <ore:dustRedstone> * 8], 1500);

//Shaped Mod Crafting Recipes
val enderioRecipes_CRAFTINGTABLE = {
	<enderio:item_yeta_wrench> : [[<ore:ingotIron>, null, <ore:ingotIron>], [null, <ore:gearPulsatingIron>, null], [null, <ore:ingotIron>, null]],
	<enderio:item_data_conduit> * 16 : [[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], [<ore:itemSilicon>, <ore:itemSilicon>, <ore:itemSilicon>], [<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]],
	<enderio:item_material:22> * 3 : [[<ore:gravel>, <ore:gravel>, <ore:gravel>], [<ore:sand>, <ore:sand>, <ore:sand>], [<ore:itemClay>, <ore:itemClay>, <ore:itemClay>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in enderioRecipes_CRAFTINGTABLE {
	if (recipes.getRecipesFor(key.withAmount(1)).length == 0) {
        recipes.remove(key.withAmount(1));
    }

	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

val enderioRecipes_EXTENDEDCRAFTING = {
	<enderio:block_simple_furnace> : [[<ore:ingotIron>, <minecraft:furnace>, <ore:ingotIron>], [<ore:bricksStone>, scripts.helpers.FrameTiers[0], <ore:bricksStone>], [<ore:bricksStone>, scripts.helpers.MotorTiers[0], <ore:bricksStone>]],
	<enderio:block_simple_wired_charger> : [[<ore:bricksStone>, <ore:ingotElectrotineAlloy>, <ore:bricksStone>], [<magneticraft:battery_item_low>, scripts.helpers.FrameTiers[0], <magneticraft:battery_item_low>], [<ore:bricksStone>, <ore:ingotRedstoneAlloy>, <ore:bricksStone>]],
	<enderio:block_solar_panel> * 3 : [[<enderio:item_material:3>, <enderio:item_material:3>, <enderio:item_material:3>], [<ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>]],
	<enderio:item_material> : [[<ore:plateCrudeSteel>, <ore:ingotElectrotineAlloy>, <ore:plateCrudeSteel>], [<ore:ingotElectrotineAlloy>, null, <ore:ingotElectrotineAlloy>], [<ore:plateCrudeSteel>, <ore:ingotElectrotineAlloy>, <ore:plateCrudeSteel>]],
	<enderio:block_zombie_generator> : [[<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>], [<ore:blockGlassColorless>, <minecraft:skull:2>, <ore:blockGlassColorless>], [<ore:blockGlassColorless>, scripts.helpers.CircuitTiers[0], <ore:blockGlassColorless>]],
	<enderio:block_vat> : [[scripts.helpers.CircuitTiers[0], <minecraft:cauldron>, scripts.helpers.CircuitTiers[0]], [<magneticraft:small_tank>, scripts.helpers.FrameTiers[0], <magneticraft:small_tank>], [<ore:gearRedstoneAlloy>, <minecraft:furnace>, <ore:gearRedstoneAlloy>]],
	<enderio:block_weather_obelisk> : [[null, <minecraft:fireworks>, null], [<ore:platePulsatingIron>, scripts.helpers.FrameTiers[0], <ore:platePulsatingIron>], [<ore:gearDiamond>, scripts.helpers.CircuitTiers[1], <ore:gearDiamond>]],
	<enderio:item_inventory_remote> : [[<ore:ingotIron>, null, <ore:ingotIron>], [scripts.helpers.CircuitTiers[0], <enderio:block_inventory_panel>, scripts.helpers.CircuitTiers[0]], [<ore:ingotIron>, <ore:gearPulsatingIron>, <ore:ingotIron>]],
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
mods.forestry.Carpenter.addRecipe(<enderio:item_material>, [[<ore:ingotCrudeSteel>, <ore:ingotElectrotineAlloy>, <ore:ingotCrudeSteel>],[<ore:ingotElectrotineAlloy>, null, <ore:ingotElectrotineAlloy>],[<ore:ingotCrudeSteel>, <ore:ingotElectrotineAlloy>, <ore:ingotCrudeSteel>]], 400, <liquid:water> * 1000);
mods.forestry.Carpenter.addRecipe(<enderio:item_material> * 2, [[<ore:ingotSteel>, <ore:ingotSteel>, <ore:ingotSteel>],[<ore:ingotSteel>, <ore:ingotElectrotineAlloy>, <ore:ingotSteel>],[<ore:ingotSteel>, <ore:ingotSteel>, <ore:ingotSteel>]], 400, <liquid:water> * 1000);

//Remove Rocket Fuel Crafting
mods.enderio.Vat.removeRecipe(<liquid:rocket_fuel>);

//Basic Conduits Crafting Recipes
val enderioRecipes_BASICCONDUITS = {
	<enderio:item_endergy_conduit> : <ore:plateCrudeSteel>,
	<enderio:item_endergy_conduit:1> : <ore:plateIron>,
	<enderio:item_endergy_conduit:2> : <ore:plateAluminium>,
	<enderio:item_endergy_conduit:3> : <ore:plateGold>,
	<enderio:item_endergy_conduit:4> : <ore:plateCopper>,
	<enderio:item_endergy_conduit:5> : <ore:plateSilver>,
	<enderio:item_item_conduit> : <extendedcrafting:material:37>,
	<enderio:item_liquid_conduit> : <ore:fusedGlass>,
	<enderio:item_liquid_conduit:1> : <ore:fusedQuartz>,
	<enderio:item_power_conduit> : <ore:plateRedstoneAlloy>,
	<enderio:item_redstone_conduit> : <ore:ingotRedstoneAlloy>,
	<enderio:item_me_conduit> : <ore:gemFluix>,
	<enderio:item_me_conduit:1> : <enderio:item_me_conduit>,
} as crafttweaker.item.IIngredient[crafttweaker.item.IItemStack];

for conduit, material in enderioRecipes_BASICCONDUITS {
    recipes.remove(conduit.withAmount(1));
	mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(conduit), scripts.helpers.stages.progression2.stage, conduit * 16, [[<industrialforegoing:plastic>, <industrialforegoing:plastic>, <industrialforegoing:plastic>], [material, <ore:blockGlass>, material], [<industrialforegoing:plastic>, <industrialforegoing:plastic>, <industrialforegoing:plastic>]]);
}

//Change Composite Binder Creation
furnace.remove(<enderio:item_material:4> * 2, <enderio:item_material:22>);
scripts.helpers.CreateAssemblyRecipe(<enderio:item_material:4> * 16, [<industrialforegoing:plastic>, <industrialforegoing:plastic>, <industrialforegoing:plastic>, null, <ore:blockGlass>, null, <industrialforegoing:plastic>, <industrialforegoing:plastic>, <industrialforegoing:plastic>], 20, 3500);

//Advanced Conduits Crafting Recipes
val enderioRecipes_ADVANCEDCONDUITS = {
	<enderio:item_power_conduit:1> : <liquid:energetic_alloy>,
	<enderio:item_power_conduit:2> : <liquid:vibrant_alloy>,
	<enderio:item_liquid_conduit:2> : <liquid:end_steel>,
	<enderio:item_endergy_conduit:6> : <liquid:electrum>,
	<enderio:item_endergy_conduit:7> : <liquid:energetic_silver>,
	<enderio:item_endergy_conduit:8> : <liquid:crystalline_alloy>,
	<enderio:item_endergy_conduit:9> : <liquid:crystalline_pink_slime>,
	<enderio:item_endergy_conduit:10> : <liquid:melodic_alloy>,
	<enderio:item_endergy_conduit:11> : <liquid:stellar_alloy>,
	<enderio:item_gas_conduit> : <liquid:black_iron>,
	<enderio:item_gas_conduit:1> : <liquid:steel>,
	<enderio:item_gas_conduit:2> : <liquid:diamond>,
} as crafttweaker.liquid.ILiquidStack[crafttweaker.item.IItemStack];

for conduit, liquid in enderioRecipes_ADVANCEDCONDUITS {
    recipes.remove(conduit.withAmount(1));
	if(liquid.name != "diamond")
	{
		scripts.helpers.addInjectionRecipe(conduit, <enderio:item_material:4>, liquid * 144, 1000, 3);
	}
	else
	{
		scripts.helpers.addInjectionRecipe(conduit, <enderio:item_material:4>, liquid * 666, 1000, 3);
	}
}

//Change Other Machine Chassis Recipes
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_material:54>); //Enhanced Machine Chassis
//TODO add me back in Stage 3!
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_material:1>); //Industrial Machine Chassis
mods.thermalexpansion.InductionSmelter.removeRecipe(<enderio:item_material>, <enderio:item_material:51>);
mods.extendedcrafting.EnderCrafting.addShaped(<enderio:item_material:1>, [[<ore:ingotDarkSteel>, <ore:ingotDarkSteel>, <ore:ingotDarkSteel>], [<ore:ingotDarkSteel>, scripts.helpers.CircuitTiers[2], <ore:ingotDarkSteel>], [<ore:ingotDarkSteel>, <ore:ingotDarkSteel>, <ore:ingotDarkSteel>]], 90);
recipes.remove(<enderio:item_material:55>); //Soulless Machine Chassis
mods.enderio.AlloySmelter.removeRecipe(<ore:itemSoulMachineChassi>.firstItem); //Soul Machine Chassis
mods.thermalexpansion.InductionSmelter.removeRecipe(<enderio:item_material>, <enderio:item_material:52>);
mods.extendedcrafting.EnderCrafting.addShaped(<enderio:item_material:53>, [[<ore:ingotSoularium>, <ore:ingotSoularium>, <ore:ingotSoularium>], [<ore:ingotSoularium>, scripts.helpers.CircuitTiers[2], <ore:ingotSoularium>], [<ore:ingotSoularium>, <ore:ingotSoularium>, <ore:ingotSoularium>]], 90);
recipes.remove(<enderio:item_material:66>); //End Steel Chassis
mods.extendedcrafting.EnderCrafting.addShaped(<enderio:item_material:66>, [[<enderio:block_end_iron_bars>, <ore:ingotEndSteel>, <enderio:block_end_iron_bars>], [<ore:ingotEndSteel>, scripts.helpers.CircuitTiers[2], <ore:ingotEndSteel>], [<enderio:block_end_iron_bars>, <ore:ingotEndSteel>, <enderio:block_end_iron_bars>]], 90);

//Change Enderio Tools and Armor Recipes
val enderioRecipes_ASSEMBLY = {
	<enderio:item_end_steel_helmet> : [<ore:plateEndSteel>, <enderio:item_material:56>, <ore:plateEndSteel>, <ore:ingotTough>, <enderio:item_dark_steel_helmet>, <ore:ingotTough>, <ore:plateEndSteel>, scripts.helpers.CircuitTiers[3], <ore:plateEndSteel>],
	<enderio:item_end_steel_chestplate> : [<ore:plateEndSteel>, <enderio:item_material:56>, <ore:plateEndSteel>, <ore:ingotTough>, <enderio:item_dark_steel_chestplate>, <ore:ingotTough>, <ore:plateEndSteel>, scripts.helpers.CircuitTiers[3], <ore:plateEndSteel>],
	<enderio:item_end_steel_leggings> : [<ore:plateEndSteel>, <enderio:item_material:56>, <ore:plateEndSteel>, <ore:ingotTough>, <enderio:item_dark_steel_leggings>, <ore:ingotTough>, <ore:plateEndSteel>, scripts.helpers.CircuitTiers[3], <ore:plateEndSteel>],
	<enderio:item_end_steel_boots> : [<ore:plateEndSteel>, <enderio:item_material:56>, <ore:plateEndSteel>, <ore:ingotTough>, <enderio:item_dark_steel_boots>, <ore:ingotTough>, <ore:plateEndSteel>, scripts.helpers.CircuitTiers[3], <ore:plateEndSteel>],
	<enderio:item_end_steel_shield> : [<ore:plateEndSteel>, <enderio:item_material:56>, <ore:plateEndSteel>, <ore:ingotTough>, <enderio:item_dark_steel_shield>, <ore:ingotTough>, <ore:plateEndSteel>, scripts.helpers.CircuitTiers[3], <ore:plateEndSteel>],
	<enderio:item_end_steel_sword> : [<ore:plateEndSteel>, <enderio:item_material:56>, <ore:plateEndSteel>, <ore:ingotTough>, <enderio:item_dark_steel_sword>, <ore:ingotTough>, <ore:plateEndSteel>, scripts.helpers.CircuitTiers[3], <ore:plateEndSteel>],
	<enderio:item_end_steel_pickaxe> : [<ore:plateEndSteel>, <enderio:item_material:56>, <ore:plateEndSteel>, <ore:ingotTough>, <enderio:item_dark_steel_pickaxe>, <ore:ingotTough>, <ore:plateEndSteel>, scripts.helpers.CircuitTiers[3], <ore:plateEndSteel>],
	<enderio:item_end_steel_axe> : [<ore:plateEndSteel>, <enderio:item_material:56>, <ore:plateEndSteel>, <ore:ingotTough>, <enderio:item_dark_steel_axe>, <ore:ingotTough>, <ore:plateEndSteel>, scripts.helpers.CircuitTiers[3], <ore:plateEndSteel>],
	<enderio:item_end_steel_bow> : [<ore:plateEndSteel>, <enderio:item_material:56>, <ore:plateEndSteel>, <ore:ingotTough>, <enderio:item_dark_steel_bow>, <ore:ingotTough>, <ore:plateEndSteel>, scripts.helpers.CircuitTiers[3], <ore:plateEndSteel>],
	<enderio:item_dark_steel_helmet> : [<ore:plateDarkSteel>, <thermalfoundation:material:640>, <ore:plateDarkSteel>, <ore:stickAluminium>, <futuremc:netherite_helmet>, <ore:stickAluminium>, <ore:plateDarkSteel>, scripts.helpers.CircuitTiers[1], <ore:plateDarkSteel>],
	<enderio:item_dark_steel_chestplate> : [<ore:plateDarkSteel>, <thermalfoundation:material:640>, <ore:plateDarkSteel>, <ore:stickAluminium>, <futuremc:netherite_chestplate>, <ore:stickAluminium>, <ore:plateDarkSteel>, scripts.helpers.CircuitTiers[1], <ore:plateDarkSteel>],
	<enderio:item_dark_steel_leggings> : [<ore:plateDarkSteel>, <thermalfoundation:material:640>, <ore:plateDarkSteel>, <ore:stickAluminium>, <futuremc:netherite_leggings>, <ore:stickAluminium>, <ore:plateDarkSteel>, scripts.helpers.CircuitTiers[1], <ore:plateDarkSteel>],
	<enderio:item_dark_steel_boots> : [<ore:plateDarkSteel>, <thermalfoundation:material:640>, <ore:plateDarkSteel>, <ore:stickAluminium>, <futuremc:netherite_boots>, <ore:stickAluminium>, <ore:plateDarkSteel>, scripts.helpers.CircuitTiers[1], <ore:plateDarkSteel>],
	<enderio:item_dark_steel_shield> : [<ore:plateDarkSteel>, <thermalfoundation:material:640>, <ore:plateDarkSteel>, <ore:stickAluminium>, <thermalfoundation:tool.shield_diamond>, <ore:stickAluminium>, <ore:plateDarkSteel>, scripts.helpers.CircuitTiers[1], <ore:plateDarkSteel>],
	<enderio:item_dark_steel_pickaxe> : [<ore:plateDarkSteel>, <thermalfoundation:material:640>, <ore:plateDarkSteel>, <ore:stickAluminium>, <futuremc:netherite_pickaxe>, <ore:stickAluminium>, <ore:plateDarkSteel>, scripts.helpers.CircuitTiers[1], <ore:plateDarkSteel>],
	<enderio:item_dark_steel_axe> : [<ore:plateDarkSteel>, <thermalfoundation:material:640>, <ore:plateDarkSteel>, <ore:stickAluminium>, <futuremc:netherite_axe>, <ore:stickAluminium>, <ore:plateDarkSteel>, scripts.helpers.CircuitTiers[1], <ore:plateDarkSteel>],
	<enderio:item_dark_steel_bow> : [<ore:plateDarkSteel>, <thermalfoundation:material:640>, <ore:plateDarkSteel>, <ore:stickAluminium>, <thermalfoundation:tool.bow_diamond>, <ore:stickAluminium>, <ore:plateDarkSteel>, scripts.helpers.CircuitTiers[1], <ore:plateDarkSteel>],
	<enderio:item_dark_steel_shears> : [<ore:ingotDarkSteel>, <thermalfoundation:material:640>, <ore:ingotDarkSteel>, <ore:stickAluminium>, <thermalfoundation:tool.shears_diamond>, <ore:stickAluminium>, <ore:ingotDarkSteel>, scripts.helpers.CircuitTiers[1], <ore:ingotDarkSteel>],
	<enderio:item_dark_steel_treetap> : [<ore:ingotDarkSteel>, <thermalfoundation:material:640>, <ore:ingotDarkSteel>, <ore:stickAluminium>, <magneticraft:iron_pipe>, <ore:stickAluminium>, <ore:ingotDarkSteel>, scripts.helpers.CircuitTiers[1], <ore:ingotDarkSteel>],
	<enderio:item_dark_steel_crook> : [<ore:ingotDarkSteel>, <thermalfoundation:material:640>, <ore:ingotDarkSteel>, <ore:stickAluminium>, <inspirations:stone_crook>, <ore:stickAluminium>, <ore:ingotDarkSteel>, scripts.helpers.CircuitTiers[1], <ore:ingotDarkSteel>],
	<enderio:item_dark_steel_hand> : [<ore:ingotDarkSteel>, <thermalfoundation:material:640>, <ore:ingotDarkSteel>, <ore:stickAluminium>, <futuremc:netherite_hoe>, <ore:stickAluminium>, <ore:ingotDarkSteel>, scripts.helpers.CircuitTiers[1], <ore:ingotDarkSteel>],
	<enderio:item_dark_steel_sword> : [<ore:plateDarkSteel>, <thermalfoundation:material:640>, <ore:plateDarkSteel>, <ore:stickAluminium>, <futuremc:netherite_sword>, <ore:stickAluminium>, <ore:plateDarkSteel>, scripts.helpers.CircuitTiers[1], <ore:plateDarkSteel>],
} as crafttweaker.item.IIngredient[][crafttweaker.item.IItemStack];

for key, value in enderioRecipes_ASSEMBLY {
  recipes.removeShaped(key.withAmount(1));
  scripts.helpers.CreateAssemblyRecipe(key, value, 60, 4000);
}

//Blank EnderIO Item Upgrade
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_dark_steel_upgrade>);
scripts.helpers.CreateAssemblyRecipe(<enderio:item_dark_steel_upgrade>, [<ore:ingotDarkSteel>, <ore:plateSilver>, <ore:ingotDarkSteel>, <ore:ingotDarkSteel>, scripts.helpers.CircuitTiers[2], <ore:ingotDarkSteel>, <ore:ingotDarkSteel>, <ore:plateSilver>, <ore:ingotDarkSteel>], 80, 25000);

//Enderio Tool and Armour Upgrades
val enderioRecipes_ASSEMBLY_UPGRADES = {
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:anvil"}) : [<enderio:item_dark_steel_upgrade>, <ore:nuggetDarkSteel>, <ore:nuggetDarkSteel>, <ore:stickTin>, <ore:stickTin>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:anvil1"}) : [<enderio:item_dark_steel_upgrade>, <ore:ingotDarkSteel>, <ore:ingotDarkSteel>, <ore:ingotTin>, <ore:ingotTin>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:anvil2"}) : [<enderio:item_dark_steel_upgrade>, <ore:blockDarkSteel>, <ore:blockDarkSteel>, <ore:plateTin>, <ore:plateTin>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:apiarist_armor_chest"}) : [<enderio:item_dark_steel_upgrade>, <forestry:apiarist_chest>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:apiarist_armor_feet"}) : [<enderio:item_dark_steel_upgrade>, <forestry:apiarist_boots>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:apiarist_armor_head"}) : [<enderio:item_dark_steel_upgrade>, <forestry:apiarist_helmet>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:apiarist_armor_legs"}) : [<enderio:item_dark_steel_upgrade>, <forestry:apiarist_legs>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:carpet"}) : [<enderio:item_dark_steel_upgrade>, <enderio:block_dark_iron_bars>, <enderio:block_dark_iron_bars>, <minecraft:carpet:*>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:depth"}) : [<enderio:item_dark_steel_upgrade>, <ore:blockConstructionAlloy>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:direct"}) : [<enderio:item_dark_steel_upgrade>, <ore:plateVibrantAlloy>, <magneticraft:crafting:4>, <ore:plateVibrantAlloy>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:elytra"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:elytra>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:energyupgrade"}) : [<enderio:item_dark_steel_upgrade>, scripts.helpers.BatteryTiers[1]],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:energyupgrade1"}) : [<enderio:item_dark_steel_upgrade>, scripts.helpers.BatteryTiers[1], scripts.helpers.CircuitTiers[1], scripts.helpers.BatteryTiers[1]],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:energyupgrade2"}) : [<enderio:item_dark_steel_upgrade>, scripts.helpers.BatteryTiers[2]],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:energyupgrade3"}) : [<enderio:item_dark_steel_upgrade>, scripts.helpers.BatteryTiers[2], scripts.helpers.CircuitTiers[2], scripts.helpers.BatteryTiers[2]],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:energyupgrade4"}) : [<enderio:item_dark_steel_upgrade>, <ore:ingotStellarAlloy>, scripts.helpers.BatteryTiers[2], scripts.helpers.CircuitTiers[4], scripts.helpers.BatteryTiers[2], <ore:ingotStellarAlloy>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:glide"}) : [<enderio:item_dark_steel_upgrade>, <enderio:item_material:7>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:gogglesofrevealing"}) : [<enderio:item_dark_steel_upgrade>, <thaumcraft:goggles>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:hoe"}) : [<enderio:item_dark_steel_upgrade>, <thermalfoundation:tool.hoe_steel>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:inv"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:shulker_shell>, scripts.helpers.CircuitTiers[1], <minecraft:shulker_shell>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:inv1"}) : [<enderio:item_dark_steel_upgrade>, <ore:blockMelodicAlloy>, scripts.helpers.CircuitTiers[2], <minecraft:shulker_shell>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:inv2"}) : [<enderio:item_dark_steel_upgrade>, <ore:blockStellarAlloy>, scripts.helpers.CircuitTiers[3], <minecraft:shulker_shell>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:jumpboost1"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:sticky_piston>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:jumpboost2"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:sticky_piston>, <ore:dustAerotheum>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:jumpboost3"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:sticky_piston>, <ore:dustAerotheum>, <openblocks:hang_glider>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:naturalist_eye"}) : [<enderio:item_dark_steel_upgrade>, <forestry:naturalist_helmet>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:nightvision"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:golden_carrot>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:padding"}) : [<enderio:item_dark_steel_upgrade>, <extrautils2:soundmuffler>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiomachines:solar"}) : [<enderio:item_dark_steel_upgrade>, <enderio:block_solar_panel>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiomachines:solar1"}) : [<enderio:item_dark_steel_upgrade>, <enderio:block_solar_panel:1>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiomachines:solar2"}) : [<enderio:item_dark_steel_upgrade>, <enderio:block_solar_panel:2>, scripts.helpers.CircuitTiers[1]],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiomachines:solar3"}) : [<enderio:item_dark_steel_upgrade>, <enderio:block_solar_panel:3>, scripts.helpers.CircuitTiers[2]],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:sounddetector"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:noteblock>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:speedboost1"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:sugar>, scripts.helpers.CircuitTiers[1], <ore:gearVibrantAlloy>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:speedboost2"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:sugar>, scripts.helpers.CircuitTiers[2], <ore:gearDarkSteel>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:speedboost3"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:sugar>, scripts.helpers.CircuitTiers[3], <ore:gearEndSteel>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:spoon"}) : [<enderio:item_dark_steel_upgrade>, <thermalfoundation:tool.shovel_steel>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:step_assist"}) : [<enderio:item_dark_steel_upgrade>, <ore:ingotBrick>, <ore:ingotBrick>, <ore:ingotBrick>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:swim"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:waterlily>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:thaumaturge_robes_chest"}) : [<enderio:item_dark_steel_upgrade>, <thaumcraft:cloth_chest>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:thaumaturge_robes_feet"}) : [<enderio:item_dark_steel_upgrade>, <thaumcraft:cloth_boots>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:thaumaturge_robes_legs"}) : [<enderio:item_dark_steel_upgrade>, <thaumcraft:cloth_legs>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:tnt"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:tnt>, <ore:gearGold>],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:tnt1"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:tnt>, <minecraft:tnt>, <ore:gearDiamond>, scripts.helpers.CircuitTiers[1]],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:tnt2"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:tnt>, <minecraft:tnt>, <minecraft:tnt>, <ore:gearManyullyn>, scripts.helpers.CircuitTiers[2]],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:tnt3"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:tnt>, <minecraft:tnt>, <minecraft:tnt>, <minecraft:tnt>, <ore:gearSoularium>, scripts.helpers.CircuitTiers[3]],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:tnt4"}) : [<enderio:item_dark_steel_upgrade>, <minecraft:tnt>, <minecraft:tnt>, <minecraft:tnt>, <minecraft:tnt>, <minecraft:tnt>, <ore:gearEndSteel>, scripts.helpers.CircuitTiers[4]],
	<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:travel"}) : [<enderio:item_dark_steel_upgrade>, scripts.helpers.CircuitTiers[2], <xreliquary:wraith_node>],
} as crafttweaker.item.IIngredient[][crafttweaker.item.IItemStack];

for key, value in enderioRecipes_ASSEMBLY_UPGRADES {
  recipes.remove(key.withAmount(1));
  scripts.helpers.CreateAssemblyRecipe(key, value, 200, 100000);
}

//Extended Crafting Recipes (T2 Table)
val magneticraft_EXTENDEDCRAFTING_T2 = {
	//null
	//								:	[[null, null, null],
	//									[null, null, null],
	//  								[null, null, null],
	//									[null, null, null]],
	<enderio:block_alloy_smelter>
									:	[[<ore:plateCrystallineAlloy>, null, <ore:plateCrystallineAlloy>],
										[<ore:plateCrystallineAlloy>, <enderio:item_material:1>, <ore:plateCrystallineAlloy>],
	  									[<ore:gearCrystallineAlloy>, scripts.helpers.MotorTiers[2], <ore:gearCrystallineAlloy>],
										[null, <tconstruct:materials:2>, <ore:ingotBrickNether>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in magneticraft_EXTENDEDCRAFTING_T2 {
	recipes.remove(key.withAmount(1));
	scripts.helpers.createAdvancedCraftingRecipe(key, value, value[3][0], value[3][1], value[3][2], "", true);
}

//Upgrade NC Alloy Furnace to EnderIO Alloy Furnace
mods.extendedcrafting.TableCrafting.addShaped(0, <enderio:block_alloy_smelter>, [
	[<ore:plateCrystallineAlloy>, <ore:plateCrystallineAlloy>, <ore:plateCrystallineAlloy>],
	[<ore:plateCrystallineAlloy>, <nuclearcraft:alloy_furnace_idle>, <ore:plateCrystallineAlloy>],
	[<ore:plateCrystallineAlloy>, scripts.helpers.MotorTiers[2], <ore:plateCrystallineAlloy>]
]);

//Remove useless enderium base
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_material:39>);
mods.enderio.AlloySmelter.removeRecipe(<ore:ingotEnderium>.firstItem * 2);

//Machine Tier Tooltips
<enderio:block_alloy_smelter>.addTooltip(scripts.helpers.createTierTooltip("Alloy Furnace Tier ", 3, false, "."));

print("### EnderIO Init Complete ###");
