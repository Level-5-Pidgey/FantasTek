import mods.industrialforegoing.FluidSievingMachine;

print("~~~ Begin Industrial Foregoing Init ~~~");

//Remove Ore Washing Factory
mods.jei.JEI.hideCategory("ORE_WASHER");
scripts.helpers.unstageAndHide(<industrialforegoing:ore_washer>);

//Extended Crafting Recipes (T2 Table)
val industrialforegoing_EXTENDEDCRAFTING_T2 = {
	 <industrialforegoing:water_resources_collector>
	 								:	[[null, <minecraft:fishing_rod>, null],
										[<ore:barsIron>, scripts.helpers.FrameTiers[0], <ore:barsIron>],
										[<ore:gearIron>, <ore:dustRedstone>, <ore:gearIron>],
	 									[<thermalfoundation:bait:1>, <ore:plateSilver>, <thermalfoundation:bait:1>]],
	 <industrialforegoing:tree_fluid_extractor>
	 								:	[[<ore:stone>, scripts.helpers.MotorTiers[0], <ore:stone>],
										[<ore:stone>, scripts.helpers.FrameTiers[1], <ore:stone>],
										[<ore:stone>, <ore:gearSteel>, <ore:stone>],
	 									[null, null, <ore:ingotSteel>]],
	 <industrialforegoing:latex_processing_unit>
	 								:	[[<ore:ingotIron>, scripts.helpers.MotorTiers[0], <ore:ingotIron>],
										[null, scripts.helpers.FrameTiers[1], null],
										[<ore:ingotIron>, <ore:gearRedstoneAlloy>, <ore:ingotIron>],
	 									[null, <ore:ingotNickel>, <ore:plateNickel>]],
	<industrialforegoing:petrified_fuel_generator>
									:	[[<ore:ingotAluminium>, <minecraft:furnace>, <ore:ingotAluminium>],
										[null, scripts.helpers.FrameTiers[0], null],
										[<ore:ingotAluminium>, <ore:gearCopper>, <ore:ingotAluminium>],
										[null, <ore:ingotElectrum>, <ore:ingotElectrum>]],
	<industrialforegoing:enchantment_refiner>
									:	[[<ore:blockGlass>, <ore:enderpearl>, <ore:blockGlass>],
										[<ore:book>, scripts.helpers.FrameTiers[0], <ore:book>],
										[<ore:blockGlass>, <ore:gearDiamond>, <ore:blockGlass>],
										[null, <ore:ingotGold>, <ore:book>]],
	<industrialforegoing:enchantment_extractor>
									:	[[<ore:ingotAluminium>, <ore:obsidian>, <ore:ingotAluminium>],
										[<ore:book>, scripts.helpers.FrameTiers[1], <ore:book>],
										[<ore:gemDiamond>, <ore:gearGold>, <ore:gemDiamond>],
										[null, <ore:ingotAluminium>, <ore:gearGold>]],
	<industrialforegoing:enchantment_aplicator>
									:	[[<ore:ingotAluminium>, <ore:ingotAluminium>, <ore:ingotAluminium>],
										[<ore:ingotAluminium>, scripts.helpers.FrameTiers[1], <ore:ingotAluminium>],
										[<ore:ingotAluminium>, <minecraft:anvil>, <ore:ingotAluminium>],
										[null, <ore:ingotAluminium>, <ore:gearGold>]],
	<industrialforegoing:potion_enervator>
									:	[[null, <minecraft:brewing_stand>, null],
										[<ore:gearGold>, scripts.helpers.FrameTiers[1], <ore:gearGold>],
										[<ore:dustRedstone>, <ore:gearGold>, <ore:dustRedstone>],
										[null, <ore:ingotBrickNether>, <ore:ingotBrickNether>]],
	<industrialforegoing:animal_independence_selector>
									:	[[<ore:blockGlass>, <ore:gemDiamond>, <ore:blockGlass>],
										[<ore:cropWheat>, scripts.helpers.FrameTiers[1], <ore:cropWheat>],
										[<ore:blockGlass>, <ore:gemDiamond>, <ore:blockGlass>],
										[null, <ore:ingotInvar>, <ore:ingotInvar>]],
	<industrialforegoing:animal_stock_increaser>
									:	[[<ore:blockGlass>, <minecraft:golden_carrot>, <ore:blockGlass>],
										[<minecraft:golden_carrot>, scripts.helpers.FrameTiers[1], <minecraft:golden_carrot>],
										[<ore:blockGlass>, <ore:gearDiamond>, <ore:blockGlass>],
										[null, <ore:ingotAluminium>, <minecraft:golden_apple>]],
	<industrialforegoing:crop_sower>
									:	[[<ore:plateApatite>, <ore:plateApatite>, <ore:plateApatite>],
										[<ore:plateApatite>, scripts.helpers.FrameTiers[3], <ore:plateApatite>],
										[<ore:gearDiamond>, scripts.helpers.CircuitTiers[2], <ore:gearDiamond>],
										[null, <ore:ingotAluminium>, <ore:ingotAluminium>]],
	<industrialforegoing:crop_enrich_material_injector>
									:	[[<ore:plateAluminium>, <ore:gearApatite>, <ore:plateAluminium>],
										[<ore:gearApatite>, scripts.helpers.FrameTiers[2], <ore:gearApatite>],
										[<ore:plateAluminium>, scripts.helpers.CircuitTiers[1], <ore:plateAluminium>],
										[null, <ore:gemApatite>, <ore:gemApatite>]],
	<industrialforegoing:crop_recolector>
									:	[[<ore:plateAluminium>, <minecraft:diamond_hoe>, <ore:plateAluminium>],
										[<minecraft:diamond_axe>, scripts.helpers.FrameTiers[2], <minecraft:diamond_shovel>],
										[<ore:plateAluminium>, null, <ore:plateAluminium>],
										[null, <ore:ingotInvar>, <ore:gearElectrum>]],
	<industrialforegoing:animal_resource_harvester>
									:	[[<ore:ingotAluminium>, <ore:ingotAluminium>, <ore:ingotAluminium>],
										[<minecraft:shears>, <minecraft:bucket>, <minecraft:shears>],
										[<ore:gearElectrum>, scripts.helpers.FrameTiers[1], <ore:gearElectrum>],
										[null, <ore:ingotInvar>, <ore:ingotInvar>]],
	<industrialforegoing:mob_slaughter_factory>
									:	[[<ore:plateInvar>, <ore:gearLumium>, <ore:plateInvar>],
										[<minecraft:diamond_sword>, scripts.helpers.FrameTiers[3], <minecraft:diamond_sword>],
										[<minecraft:diamond_axe>, <ore:gearLumium>, <minecraft:diamond_axe>],
										[null, <ore:dustRedstone>, <ore:dustRedstone>]],
	<industrialforegoing:sewage_composter_solidifier>
									:	[[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>],
										[<ore:dustRedstone>, scripts.helpers.FrameTiers[1], <ore:dustRedstone>],
										[<ore:ingotBrick>, <ore:ingotSignalum>, <ore:ingotBrick>],
										[null, <ore:dustRedstone>, <ore:ingotBrick>]],
	<industrialforegoing:animal_byproduct_recolector>
									:	[[<ore:ingotAluminium>, <minecraft:bucket>, <ore:ingotAluminium>],
										[<ore:ingotBrick>, scripts.helpers.FrameTiers[1], <ore:ingotBrick>],
										[<ore:ingotBrick>, <ore:plateGold>, <ore:ingotBrick>],
										[null, <ore:ingotAluminium>, <ore:ingotBrick>]],
	<industrialforegoing:sludge_refiner>
									:	[[<ore:ingotAluminium>, <minecraft:bucket>, <ore:ingotAluminium>],
										[<ore:ingotLead>, scripts.helpers.FrameTiers[2], <ore:ingotLead>],
										[<ore:ingotAluminium>, <ore:gearCopper>, <ore:ingotAluminium>],
										[null, null, <ore:ingotAluminium>]],
	<industrialforegoing:mob_detector>
									:	[[<ore:blockGlass>, <minecraft:observer>, <ore:blockGlass>],
										[<ore:ingotAluminium>, scripts.helpers.FrameTiers[0], <ore:ingotAluminium>],
										[<ore:blockGlass>, <minecraft:observer>, <ore:blockGlass>],
										[null, null, <ore:dustRedstone>]],
	<industrialforegoing:lava_fabricator>
									:	[[<ore:plateInvar>, <ore:obsidian>, <ore:plateInvar>],
										[<ore:plateInvar>, scripts.helpers.FrameTiers[3], <ore:plateInvar>],
										[<contenttweaker:magma_powder>, <ore:gearLumium>, <contenttweaker:magma_powder>],
										[null, <minecraft:magma_cream>, <ore:dustPyrotheum>]],
	<industrialforegoing:bioreactor>
									:	[[<ore:plateApatite>, <ore:ingotCopper>, <ore:plateApatite>],
										[<ore:slimeball>, scripts.helpers.FrameTiers[1], <ore:slimeball>],
										[<ore:plateApatite>, <ore:gearQuartz>, <ore:plateApatite>],
										[null, <ore:ingotAluminium>, <ore:slimeball>]],
	<industrialforegoing:biofuel_generator>
									:	[[<ore:ingotAluminium>, <minecraft:furnace>, <ore:ingotAluminium>],
										[scripts.helpers.BatteryTiers[0], scripts.helpers.FrameTiers[1], scripts.helpers.BatteryTiers[0]],
										[<ore:ingotAluminium>, <minecraft:furnace>, <ore:ingotAluminium>],
										[<minecraft:piston>, <minecraft:blaze_rod>, <ore:gearCopper>]],
	<industrialforegoing:ore_processor>
									:	[[<ore:ingotAluminium>, <minecraft:piston>, <ore:ingotAluminium>],
										[<ore:ingotAluminium>, scripts.helpers.FrameTiers[1], <ore:ingotAluminium>],
										[<ore:ingotAluminium>, <thermalfoundation:material:656>, <ore:ingotAluminium>],
										[<ore:ingotRedstoneAlloy>, <ore:gemDiamond>, <ore:gearQuartz>]],
	<industrialforegoing:dye_mixer>
									:	[[<ore:ingotAluminium>, <ore:dyeGreen>, <ore:ingotAluminium>],
										[<ore:dyeRed>, scripts.helpers.FrameTiers[2], <ore:dyeBlue>],
										[<ore:ingotAluminium>, <ore:blockGlass>, <ore:ingotAluminium>],
										[null, <ore:plateSteel>, <ore:gearElectrum>]],
	<industrialforegoing:enchantment_invoker>
									:	[[<ore:ingotAluminium>, <ore:book>, <ore:ingotAluminium>],
										[<ore:gemDiamond>, scripts.helpers.FrameTiers[2], <ore:gemDiamond>],
										[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>],
										[null, <ore:ingotAluminium>, <ore:ingotEnchantedMetal>]],
	<industrialforegoing:spores_recreator>
									:	[[<ore:ingotAluminium>, <ore:obsidian>, <ore:ingotAluminium>],
										[<ore:gearBronze>, scripts.helpers.FrameTiers[1], <ore:gearBronze>],
										[<ore:ingotAluminium>, <ore:obsidian>, <ore:ingotAluminium>],
										[<ore:cropMushroomBrown>, <ore:cropMushroomRed>, <ore:ingotBronze>]],
	<industrialforegoing:animal_growth_increaser>
									:	[[<ore:plateAluminium>, <minecraft:golden_carrot>, <ore:plateAluminium>],
										[<minecraft:golden_carrot>, scripts.helpers.FrameTiers[2], <minecraft:golden_carrot>],
										[<ore:plateAluminium>, <ore:gearSignalum>, <ore:plateAluminium>],
										[null, <ore:gemDiamond>, <ore:gemDiamond>]],
	<industrialforegoing:resourceful_furnace>
									:	[[<ore:ingotAluminium>, <ore:ingotBrick>, <ore:ingotAluminium>],
										[<minecraft:furnace>, scripts.helpers.FrameTiers[1], <minecraft:furnace>],
										[<ore:ingotAluminium>, <ore:ingotBrick>, <ore:ingotAluminium>],
										[null, <ore:ingotBrick>, <ore:ingotGold>]],
	<industrialforegoing:villager_trade_exchanger>
									:	[[<ore:ingotGold>, <ore:gemEmerald>, <ore:ingotGold>],
										[<ore:gearAluminium>, scripts.helpers.FrameTiers[2], <ore:gearAluminium>],
										[<ore:ingotGold>, <ore:gemEmerald>, <ore:ingotGold>],
										[null, <ore:ingotGold>, <ore:gearEmerald>]],
	<industrialforegoing:energy_field_provider>
									:	[[<ore:ingotElectrum>, scripts.helpers.BatteryTiers[2], <ore:ingotElectrum>],
										[<ore:ingotElectrum>, scripts.helpers.FrameTiers[3], <ore:ingotElectrum>],
										[<ore:ingotSteel>, <ore:gearDiamond>, <ore:ingotSteel>],
										[null, <ore:ingotSignalum>, <ore:ingotSignalum>]],
	<industrialforegoing:oredictionary_converter>
									:	[[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>],
										[<ore:ingotGold>, scripts.helpers.FrameTiers[1], <ore:ingotGold>],
										[<ore:nuggetAluminium>, <ore:ingotAluminium>, <ore:blockAluminium>],
										[null, null, <ore:ingotSteel>]],
	<industrialforegoing:protein_reactor>
									:	[[<ore:ingotAluminium>, <ore:foodMeat>, <ore:ingotAluminium>],
										[<minecraft:rabbit_foot>, scripts.helpers.FrameTiers[1], <minecraft:rabbit_foot>],
										[<ore:ingotAluminium>, <ore:foodMeat>, <ore:ingotAluminium>],
										[null, <ore:ingotAluminium>, <minecraft:egg>]],
	<industrialforegoing:protein_generator>
									:	[[<ore:ingotAluminium>, scripts.helpers.BatteryTiers[1], <ore:ingotAluminium>],
										[<minecraft:piston>, scripts.helpers.FrameTiers[1], <minecraft:piston>],
										[<ore:ingotAluminium>, scripts.helpers.BatteryTiers[1], <ore:ingotAluminium>],
										[<ore:ingotAluminium>, <ore:foodMeat>, <minecraft:egg>]],
	<industrialforegoing:hydrator>
									:	[[<ore:plateAluminium>, <ore:gearApatite>, <ore:plateAluminium>],
										[<ore:ingotLumium>, scripts.helpers.FrameTiers[2], <ore:ingotLumium>],
										[<ore:plateAluminium>, <ore:gearApatite>, <ore:plateAluminium>],
										[null, <ore:ingotAluminium>, <industrialforegoing:fertilizer>]],
	<industrialforegoing:wither_builder>
									:	[[<ore:plateAluminium>, <extendedcrafting:material:40>, <ore:plateAluminium>],
										[<minecraft:skull:1>, <enderio:item_material:66>, <minecraft:skull:1>],
										[<ore:ingotSoularium>, <ore:ingotSoularium>, <ore:ingotSoularium>],
										[null, <ore:plateAluminium>, <ore:ingotSoularium>]],
	<industrialforegoing:fluid_pump>
									:	[[<ore:ingotSteel>, <minecraft:water_bucket>, <ore:ingotSteel>],
										[<ore:ingotAluminium>, scripts.helpers.FrameTiers[0], <ore:ingotAluminium>],
										[<ore:ingotSteel>, <ore:gearDiamond>, <ore:ingotSteel>],
										[null, <ore:ingotAluminium>, <ore:ingotSteel>]],
	<industrialforegoing:fluid_crafter>
									:	[[<ore:ingotAluminium>, <ore:workbench>, <ore:ingotAluminium>],
										[null, scripts.helpers.FrameTiers[0], null],
										[<ore:ingotAluminium>, <ore:gearGold>, <ore:ingotAluminium>],
										[null, <ore:ingotAluminium>, <ore:ingotSteel>]],
	<industrialforegoing:plant_interactor>
									:	[[<ore:plateAluminium>, <minecraft:golden_hoe>, <ore:plateAluminium>],
										[<minecraft:golden_hoe>, scripts.helpers.FrameTiers[2], <minecraft:golden_hoe>],
										[<ore:plateAluminium>, <ore:plateDiamond>, <ore:plateAluminium>],
										[null, <ore:ingotInvar>, <ore:gearConstantan>]],
	<industrialforegoing:fluiddictionary_converter>
									:	[[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>],
										[<ore:ingotGold>, scripts.helpers.FrameTiers[1], <ore:ingotGold>],
										[<ore:nuggetBronze>, <ore:ingotBronze>, <ore:blockBronze>],
										[null, null, <ore:ingotSteel>]],
	<industrialforegoing:froster>
									:	[[<ore:ingotAluminium>, <minecraft:snowball>, <ore:ingotAluminium>],
										[<minecraft:snowball>, scripts.helpers.FrameTiers[1], <minecraft:snowball>],
										[<ore:ingotAluminium>, <ore:ingotGold>, <ore:ingotAluminium>],
										[null, <ore:ingotGold>, <ore:dustBlizz>]],
	<industrialforegoing:ore_fermenter>
									:	[[<ore:plateAluminium>, <ore:ingotConstantan>, <ore:plateAluminium>],
										[<ore:ingotConstantan>, scripts.helpers.FrameTiers[3], <ore:ingotConstantan>],
										[<ore:plateAluminium>, <ore:ingotConstantan>, <ore:plateAluminium>],
										[null, <ore:ingotElectrum>, <contenttweaker:sealed_wood_plate>]],
	<industrialforegoing:ore_sieve>
									:	[[<ore:blockGlassColorless>, null, <ore:blockGlassColorless>],
										[<ore:plateAluminium>, scripts.helpers.FrameTiers[3], <ore:plateAluminium>],
										[<ore:gearSignalum>, <industrialforegoing:pink_slime>, <ore:gearSignalum>],
										[null, <ore:blockGlassColorless>, <ore:plateBrass>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in industrialforegoing_EXTENDEDCRAFTING_T2 {
	recipes.remove(key.withAmount(1));
	scripts.helpers.createAdvancedCraftingRecipe(key, value, value[3][0], value[3][1], value[3][2], "", true);
}

//Tier 1 Extended Crafting Recipes (for more simple machines)
val industrialforegoingRecipes_EXTENDEDCRAFTING = {
	<industrialforegoing:block_destroyer> : [[<ore:ingotAluminium>, null, <ore:ingotAluminium>], [<ore:ingotAluminium>, scripts.helpers.FrameTiers[0], <ore:ingotAluminium>], [<ore:ingotAluminium>, <thermalfoundation:material:656>, <ore:ingotAluminium>]],
	<industrialforegoing:block_placer> : [[<ore:ingotAluminium>, null, <ore:ingotAluminium>], [<ore:ingotAluminium>, scripts.helpers.FrameTiers[0], <ore:ingotAluminium>], [<ore:ingotAluminium>, <minecraft:piston>, <ore:ingotAluminium>]],
	<industrialforegoing:item_splitter> : [[<ore:ingotGold>, null, <ore:ingotGold>], [<minecraft:hopper>, scripts.helpers.FrameTiers[0], <minecraft:hopper>], [<ore:ingotGold>, null, <ore:ingotGold>]],
	<industrialforegoing:pitiful_fuel_generator> : [[<ore:ingotAluminium>, <minecraft:furnace>, <ore:ingotAluminium>], [null, scripts.helpers.FrameTiers[1], null], [<ore:ingotAluminium>, <ore:gearCopper>, <ore:ingotAluminium>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in industrialforegoingRecipes_EXTENDEDCRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

//Upgrade Aquatic Entangler to Resources Fisher
mods.extendedcrafting.TableCrafting.addShaped(0, <industrialforegoing:water_resources_collector>, [[<ore:plateSilver>, <thermalfoundation:bait:1>, <ore:plateSilver>], [<thermalfoundation:bait:1>, <thermalexpansion:device:4>, <thermalfoundation:bait:1>], [<ore:plateSilver>, <thermalfoundation:bait:1>, <ore:plateSilver>]]);

//Water Condensator
recipes.remove(<industrialforegoing:water_condensator>);
for rune in scripts.helpers.AllWaterT1Items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <industrialforegoing:water_condensator>, [[<ore:plateAluminium>, rune, <ore:plateAluminium>], [<ore:ingotIron>, scripts.helpers.FrameTiers[0], <ore:ingotIron>], [<ore:plateAluminium>, <ore:ingotGold>, <ore:plateAluminium>]]);
}

//Change recipes for other mod items
val industrialforegoingRecipes_CRAFTINGTABLE = {
		<industrialforegoing:conveyor> * 48 : [[<ore:ingotSteel>, <ore:dustRedstone>, <ore:ingotSteel>], [<ore:ingotSteel>, scripts.helpers.MotorTiers[0], <ore:ingotSteel>], [<ore:ingotSteel>, <ore:dustRedstone>, <ore:ingotSteel>]],
		<industrialforegoing:conveyor_upgrade> * 4 : [[<ore:ingotSteel>, null, <ore:ingotSteel>], [<ore:dustRedstone>, <minecraft:dispenser>, <ore:dustRedstone>], [<ore:ingotSteel>, null, <ore:ingotSteel>]],
		<industrialforegoing:conveyor_upgrade:1> * 4 : [[<ore:ingotSteel>, null, <ore:ingotSteel>], [<ore:dustRedstone>, <minecraft:hopper>, <ore:dustRedstone>], [<ore:ingotSteel>, null, <ore:ingotSteel>]],
		<industrialforegoing:conveyor_upgrade:2> * 4 : [[<ore:ingotSteel>, null, <ore:ingotSteel>], [<ore:dustRedstone>, <minecraft:comparator>, <ore:dustRedstone>], [<ore:ingotSteel>, null, <ore:ingotSteel>]],
		<industrialforegoing:conveyor_upgrade:3> * 4 : [[<ore:ingotSteel>, <ore:blockSlime>, <ore:ingotSteel>], [<ore:dustRedstone>, <minecraft:piston>, <ore:dustRedstone>], [<ore:ingotSteel>, null, <ore:ingotSteel>]],
		<industrialforegoing:conveyor_upgrade:4> * 4 : [[<ore:ingotSteel>, <ore:barsIron>, <ore:ingotSteel>], [<ore:dustRedstone>, <minecraft:dropper>, <ore:dustRedstone>], [<ore:ingotSteel>, null, <ore:ingotSteel>]],
		<industrialforegoing:conveyor_upgrade:5> * 4 : [[<ore:ingotSteel>, <minecraft:chorus_fruit>, <ore:ingotSteel>], [<ore:dustRedstone>, <minecraft:sticky_piston>, <ore:dustRedstone>], [<ore:ingotSteel>, null, <ore:ingotSteel>]],
		<industrialforegoing:conveyor_upgrade:6> * 6 : [[<ore:ingotSteel>, <ore:barsIron>, <ore:ingotSteel>], [<ore:dustRedstone>, null, <ore:dustRedstone>], [<ore:ingotSteel>, <ore:barsIron>, <ore:ingotSteel>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in industrialforegoingRecipes_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Re-colour white conveyors
recipes.addShaped(scripts.helpers.createRecipeName(<industrialforegoing:conveyor>) ~ "_toWhite", <industrialforegoing:conveyor> * 8, [[<industrialforegoing:conveyor:*>, <industrialforegoing:conveyor:*>, <industrialforegoing:conveyor:*>], [<industrialforegoing:conveyor:*>, <ore:dyeWhite>, <industrialforegoing:conveyor:*>], [<industrialforegoing:conveyor:*>, <industrialforegoing:conveyor:*>, <industrialforegoing:conveyor:*>]]);
//Give them a tooltip too
scripts.helpers.AddTooltip(<industrialforegoing:conveyor>, ["These conveyors are entity-based, be warned!.", "Looks great and functions fine, but will lag if used with high-throughput systems!!"]);

//Assembly Line Recipe Changes
val industrialforegoingRecipes_ASSEMBLY = {
	<industrialforegoing:adult_filter> : [<ore:nuggetGold>, <ore:ingotSteel>, <ore:nuggetGold>, <ore:nuggetGold>, <ore:egg>, <ore:nuggetGold>, <ore:nuggetGold>, <ore:ingotSteel>, <ore:nuggetGold>],
	<industrialforegoing:range_addon> : [<ore:stone>, <ore:plateSteel>, <ore:stone>, <ore:stone>, scripts.helpers.CircuitTiers[1], <ore:stone>, <ore:stone>, <ore:plateSteel>, <ore:stone>],
	<industrialforegoing:range_addon:1> : [<ore:plateLapis>, <ore:plateSteel>, <ore:plateLapis>, <ore:plateLapis>, scripts.helpers.CircuitTiers[1], <ore:plateLapis>, <ore:plateLapis>, <ore:plateSteel>, <ore:plateLapis>],
	<industrialforegoing:range_addon:2> : [<ore:plateIron>, <ore:plateSteel>, <ore:plateIron>, <ore:plateIron>, scripts.helpers.CircuitTiers[1], <ore:plateIron>, <ore:plateIron>, <ore:plateSteel>, <ore:plateIron>],
	<industrialforegoing:range_addon:3> : [<ore:plateTin>, <ore:plateSteel>, <ore:plateTin>, <ore:plateTin>, scripts.helpers.CircuitTiers[1], <ore:plateTin>, <ore:plateTin>, <ore:plateSteel>, <ore:plateTin>],
	<industrialforegoing:range_addon:4> : [<ore:plateCopper>, <ore:plateSteel>, <ore:plateCopper>, <ore:plateCopper>, scripts.helpers.CircuitTiers[3], <ore:plateCopper>, <ore:plateCopper>, <ore:plateSteel>, <ore:plateCopper>],
	<industrialforegoing:range_addon:5> : [<ore:plateBronze>, <ore:plateSteel>, <ore:plateBronze>, <ore:plateBronze>, scripts.helpers.CircuitTiers[3], <ore:plateBronze>, <ore:plateBronze>, <ore:plateSteel>, <ore:plateBronze>],
	<industrialforegoing:range_addon:6> : [<ore:plateElectricalSteel>, <ore:plateSteel>, <ore:plateElectricalSteel>, <ore:plateElectricalSteel>, scripts.helpers.CircuitTiers[3], <ore:plateElectricalSteel>, <ore:plateElectricalSteel>, <ore:plateSteel>, <ore:plateElectricalSteel>],
	<industrialforegoing:range_addon:7> : [<ore:plateElectrum>, <ore:plateSteel>, <ore:plateElectrum>, <ore:plateElectrum>, scripts.helpers.CircuitTiers[3], <ore:plateElectrum>, <ore:plateElectrum>, <ore:plateSteel>, <ore:plateElectrum>],
	<industrialforegoing:range_addon:8> : [<ore:plateLithium>, <ore:plateSteel>, <ore:plateLithium>, <ore:plateLithium>, scripts.helpers.CircuitTiers[3], <ore:plateLithium>, <ore:plateLithium>, <ore:plateSteel>, <ore:plateLithium>],
	<industrialforegoing:range_addon:9> : [<ore:plateDiamond>, <ore:plateSteel>, <ore:plateDiamond>, <ore:plateDiamond>, scripts.helpers.CircuitTiers[3], <ore:plateDiamond>, <ore:plateDiamond>, <ore:plateSteel>, <ore:plateDiamond>],
	<industrialforegoing:range_addon:10> : [<ore:plateCobalt>, <ore:plateSteel>, <ore:plateCobalt>, <ore:plateCobalt>, scripts.helpers.CircuitTiers[3], <ore:plateCobalt>, <ore:plateCobalt>, <ore:plateSteel>, <ore:plateCobalt>],
	<industrialforegoing:range_addon:11> : [<ore:plateEndSteel>, <ore:plateSteel>, <ore:plateEndSteel>, <ore:plateEndSteel>, scripts.helpers.CircuitTiers[3], <ore:plateEndSteel>, <ore:plateEndSteel>, <ore:plateSteel>, <ore:plateEndSteel>],
	<industrialforegoing:energy_field_addon> : [<industrialforegoing:pink_slime_ingot>, <ore:plateSteel>, <industrialforegoing:pink_slime_ingot>, scripts.helpers.BatteryTiers[2], scripts.helpers.CircuitTiers[2], scripts.helpers.BatteryTiers[2], <industrialforegoing:pink_slime_ingot>, <ore:plateSteel>, <industrialforegoing:pink_slime_ingot>],
	<industrialforegoing:leaf_shearing> : [<ore:nuggetGold>, <ore:ingotSteel>, <ore:nuggetGold>, <ore:nuggetGold>, <ore:toolShears>, <ore:nuggetGold>, <ore:nuggetGold>, <ore:ingotSteel>, <ore:nuggetGold>],
	<industrialforegoing:itemstack_transfer_addon_pull> * 2 : [<ore:nuggetGold>, <ore:ingotSteel>, <ore:nuggetGold>, <ore:nuggetGold>, <minecraft:sticky_piston>, <ore:nuggetGold>, <ore:nuggetGold>, <ore:ingotSteel>, <ore:nuggetGold>],
	<industrialforegoing:itemstack_transfer_addon_push> * 2 : [<ore:nuggetGold>, <ore:ingotSteel>, <ore:nuggetGold>, <ore:nuggetGold>, <minecraft:piston>, <ore:nuggetGold>, <ore:nuggetGold>, <ore:ingotSteel>, <ore:nuggetGold>],
	<industrialforegoing:fluid_transfer_addon_pull> : [<ore:nuggetGold>, <ore:ingotBronze>, <ore:nuggetGold>, <ore:nuggetGold>, <minecraft:piston>, <ore:nuggetGold>, <ore:nuggetGold>, <ore:ingotBronze>, <ore:nuggetGold>],
	<industrialforegoing:fluid_transfer_addon_push> : [<ore:nuggetGold>, <ore:ingotBronze>, <ore:nuggetGold>, <ore:nuggetGold>, <minecraft:piston>, <ore:nuggetGold>, <ore:nuggetGold>, <ore:ingotBronze>, <ore:nuggetGold>],
	<industrialforegoing:fortune_addon> : [<industrialforegoing:pink_slime_ingot>, <ore:plateEndSteel>, <industrialforegoing:pink_slime_ingot>, <industrialforegoing:pink_slime_ingot>, scripts.helpers.CircuitTiers[4], <industrialforegoing:pink_slime_ingot>, <industrialforegoing:pink_slime_ingot>, <ore:plateEndSteel>, <industrialforegoing:pink_slime_ingot>],
} as crafttweaker.item.IIngredient[][crafttweaker.item.IItemStack];

for key, value in industrialforegoingRecipes_ASSEMBLY {
  recipes.remove(key.withAmount(1));
  scripts.helpers.CreateAssemblyRecipe(key, value, 200, 80000);
}

//Meat Feeder Assembly
recipes.remove(<industrialforegoing:meat_feeder>);
scripts.helpers.CreateAssemblyRecipe(<industrialforegoing:meat_feeder>, [<ore:plateSteel>, <ore:ingotAluminium>, <ore:plateSteel>, <minecraft:glass_bottle>, <ore:ingotAluminium>, <minecraft:glass_bottle>, null, <ore:ingotAluminium>, null], 60, 4000);

//Change Pink Slime Ingot Crafting
FluidSievingMachine.remove(<industrialforegoing:pink_slime_ingot>);
scripts.helpers.addInjectionRecipe(<industrialforegoing:pink_slime_ingot>, <ore:ingotManyullyn>, <liquid:if.pink_slime> * 1000, 25000, 4);

//TODO machines for later stages
/*
	<industrialforegoing:mob_relocator>
	<industrialforegoing:black_hole_unit>
	<industrialforegoing:mob_duplicator>
	<industrialforegoing:laser_base>
	<industrialforegoing:laser_drill>
	<industrialforegoing:black_hole_controller_reworked>
	<industrialforegoing:material_stonework_factory>
	<industrialforegoing:black_hole_tank>
*/

//Change Plastic Sheet Creation
furnace.remove(<industrialforegoing:plastic>, <industrialforegoing:dryrubber>);

//Machine Tier Tooltips
<industrialforegoing:ore_sieve>.addTooltip(scripts.helpers.createTierTooltip("Fluid Injector Tier ", 2, false, "."));

print("### Industrial Foregoing Init Complete ###");
