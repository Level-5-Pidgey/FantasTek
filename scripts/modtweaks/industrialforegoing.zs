
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
										[<ore:book>, scripts.helpers.FrameTiers[1], <ore:book>],
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
										[null, <ore:plateAluminium>, <ore:plateAluminium>]],
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
									:	[[<ore:ingotAluminium>, scripts.helpers.BatteryTiers[2], <ore:ingotAluminium>],
										[<minecraft:piston>, scripts.helpers.FrameTiers[1], <minecraft:piston>],
										[<ore:ingotAluminium>, scripts.helpers.BatteryTiers[2], <ore:ingotAluminium>],
										[<ore:ingotAluminium>, <ore:foodMeat>, <minecraft:egg>]],
	<industrialforegoing:hydrator>
									:	[[<ore:plateAluminium>, <ore:gearApatite>, <ore:plateAluminium>],
										[<ore:ingotLumium>, scripts.helpers.FrameTiers[2], <ore:ingotLumium>],
										[<ore:plateAluminium>, <ore:gearApatite>, <ore:plateAluminium>],
										[null, <ore:ingotAluminium>, <industrialforegoing:fertilizer>]],
	<industrialforegoing:wither_builder>
									:	[[<ore:plateAluminium>, <extendedcrafting:material:40>, <ore:plateAluminium>],
										[<minecraft:skull:1>, scripts.helpers.FrameTiers[4], <minecraft:skull:1>],
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
									:	[[<ore:plateAluminium>, <industrialforegoing:pink_slime>, <ore:plateAluminium>],
										[<enderio:block_dark_iron_bars>, scripts.helpers.FrameTiers[3], <enderio:block_dark_iron_bars>],
										[<ore:plateAluminium>, <ore:plateConstantan>, <ore:plateAluminium>],
										[null, <enderio:block_dark_iron_bars>, <ore:plateConstantan>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in industrialforegoing_EXTENDEDCRAFTING_T2 {
	recipes.remove(key.withAmount(1));
	scripts.helpers.createAdvancedCraftingRecipe(key, value, value[3][0], value[3][1], value[3][2], "", true);
}

//Upgrade Aquatic Entangler to Resources Fisher
mods.extendedcrafting.TableCrafting.addShaped(0, <industrialforegoing:water_resources_collector>, [[<ore:plateSilver>, <thermalfoundation:bait:1>, <ore:plateSilver>], [<thermalfoundation:bait:1>, <thermalexpansion:device:4>, <thermalfoundation:bait:1>], [<ore:plateSilver>, <thermalfoundation:bait:1>, <ore:plateSilver>]]);

//Water Condensator
recipes.remove(<industrialforegoing:water_condensator>);
for rune in scripts.helpers.AllWaterT1Items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <industrialforegoing:water_condensator>, [[<ore:plateAluminium>, rune, <ore:plateAluminium>], [<ore:ingotIron>, scripts.helpers.FrameTiers[0], <ore:ingotIron>], [<ore:plateAluminium>, <ore:ingotGold>, <ore:plateAluminium>]]);
}

//Block Destroyer
recipes.remove(<industrialforegoing:block_destroyer>);
mods.extendedcrafting.TableCrafting.addShaped(0, <industrialforegoing:block_destroyer>, [[<ore:ingotAluminium>, null, <ore:ingotAluminium>], [<ore:ingotAluminium>, scripts.helpers.FrameTiers[0], <ore:ingotAluminium>], [<ore:ingotAluminium>, <thermalfoundation:material:656>, <ore:ingotAluminium>]]);

//Block Placer
recipes.remove(<industrialforegoing:block_placer>);
mods.extendedcrafting.TableCrafting.addShaped(0, <industrialforegoing:block_placer>, [[<ore:ingotAluminium>, null, <ore:ingotAluminium>], [<ore:ingotAluminium>, scripts.helpers.FrameTiers[0], <ore:ingotAluminium>], [<ore:ingotAluminium>, <minecraft:piston>, <ore:ingotAluminium>]]);

//Item Splitter
recipes.remove(<industrialforegoing:item_splitter>);
mods.extendedcrafting.TableCrafting.addShaped(0, <industrialforegoing:item_splitter>, [[<ore:ingotGold>, null, <ore:ingotGold>], [<minecraft:hopper>, scripts.helpers.FrameTiers[0], <minecraft:hopper>], [<ore:ingotGold>, null, <ore:ingotGold>]]);

//Pitiful Fuel Generator
recipes.remove(<industrialforegoing:pitiful_fuel_generator>);
mods.extendedcrafting.TableCrafting.addShaped(0, <industrialforegoing:pitiful_fuel_generator>, [[<ore:ingotAluminium>, <minecraft:furnace>, <ore:ingotAluminium>], [null, scripts.helpers.FrameTiers[1], null], [<ore:ingotAluminium>, <ore:gearCopper>, <ore:ingotAluminium>]]);

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
print("### Industrial Foregoing Init Complete ###");
