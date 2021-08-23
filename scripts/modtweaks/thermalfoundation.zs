print("~~~ Begin Thermal Foundation Init ~~~");

//Remove Manual Crafting of Blends
val alloyBlends = [
	<thermalfoundation:material:97>,
	<thermalfoundation:material:98>,
	<thermalfoundation:material:99>,
	<thermalfoundation:material:100>,
	<thermalfoundation:material:101>,
	<thermalfoundation:material:102>,
	<thermalfoundation:material:103>,
] as crafttweaker.item.IItemStack[];

for blend in alloyBlends
{
	recipes.remove(blend);
}

//Simple Recipe Changes for crafting bench
val thermalRecipes_CRAFTINGTABLE = {
	<thermalfoundation:material:657> : [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotIron>, <ore:gearCrudeSteel>, <ore:ingotIron>], [null, <ore:ingotIron>, <ore:ingotIron>]],
	<thermaldynamics:duct_0> * 16 : [[<ore:dustRedstone>, <ore:paneGlassColorless> | <ore:blockGlass>, <ore:dustRedstone>], [<ore:dustElectrotine>, <ore:dustElectrotine>, <ore:dustElectrotine>], [<ore:dustRedstone>, <ore:paneGlassColorless> | <ore:blockGlass>, <ore:dustRedstone>]],
	<thermalfoundation:material:656> : [[null, <ore:ingotIron>, null], [<ore:ingotIron>, <ore:gearCrudeSteel>, <ore:ingotIron>], [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>]],
	<thermalfoundation:wrench> : [[<ore:ingotIron>, null, <ore:ingotIron>], [null, <ore:ingotElectrotineAlloy>, null], [null, <ore:ingotIron>, null]],
	<thermaldynamics:duct_0:1> * 16 : [[<ore:dustRedstone>, <ore:paneGlassColorless> | <ore:blockGlass>, <ore:dustRedstone>], [<ore:ingotInvar>, <ore:ingotInvar>, <ore:ingotInvar>], [<ore:dustRedstone>, <ore:paneGlassColorless> | <ore:blockGlass>, <ore:dustRedstone>]],
	<thermaldynamics:duct_32> * 16 : [[<ore:ingotTin>, <ore:blockGlassHardened>, <ore:ingotTin>]],
	<thermaldynamics:duct_32:1> * 16 : [[<ore:ingotTin>, <ore:ingotLead>, <ore:ingotTin>]],
	<thermaldynamics:duct_48> * 16 : [[<ore:stone>, <ore:ingotLead>, <ore:stone>]],
	<thermaldynamics:duct_64:3> * 32 : [[<ore:ingotBronze>, <ore:blockGlassColorless>, <ore:ingotBronze>], [<ore:blockGlassColorless>, null, <ore:blockGlassColorless>], [<ore:ingotBronze>, <ore:blockGlassColorless>, <ore:ingotBronze>]],
	<thermaldynamics:duct_64:1> * 32 : [[<ore:plateLead>, <ore:blockGlassColorless>, <ore:plateLead>], [<ore:blockGlassColorless>, null, <ore:blockGlassColorless>], [<ore:plateLead>, <ore:blockGlassColorless>, <ore:plateLead>]],
	<thermalfoundation:tome_lexicon> : [[<ore:nuggetCopper>, <ore:ingotCopper>, <ore:plateCopper>], [<ore:dustRedstone>, <ore:book>, <ore:dustRedstone>], [<ore:plateTin>, <ore:ingotTin>, <ore:nuggetTin>]],
	<thermalfoundation:material:513> : [[null, <ore:ingotRedstoneAlloy>, <ore:stickGold>], [<ore:ingotRedstoneAlloy>, <ore:ingotGold>, <ore:ingotRedstoneAlloy>], [<ore:stickGold>, <ore:ingotRedstoneAlloy>, null]],
	<thermalfoundation:material:514> : [[null, <ore:ingotRedstoneAlloy>, <ore:stickSilver>], [<ore:ingotRedstoneAlloy>, <ore:ingotSilver>, <ore:ingotRedstoneAlloy>], [<ore:stickSilver>, <ore:ingotRedstoneAlloy>, null]],
	<thermalfoundation:material:515> : [[<ore:ingotElectrum>, <ore:ingotRedstoneAlloy>, null], [<ore:ingotRedstoneAlloy>, <ore:plateElectrum>, <ore:ingotRedstoneAlloy>], [null, <ore:ingotRedstoneAlloy>, <ore:ingotElectrum>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in thermalRecipes_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Item Tooltips
scripts.helpers.AddTooltip(<thermalexpansion:capacitor:*>, ["It contains 1.21 gigawatts!", "You can take this thing all sorts of places..."]);
scripts.helpers.AddTooltip(<thermalfoundation:wrench>, ["Not sure why this isn't called a wrench.", "This tooltip is purely so you can search \"wrench\" in JEI in peace.", "Thank me later."]);

//Post Stage 1 Saw Blade
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<thermalfoundation:material:657>), scripts.helpers.stages.progression2.stage, <thermalfoundation:material:657>, [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotIron>, <ore:gearSteel>, <ore:ingotIron>], [null, <ore:ingotIron>, <ore:ingotIron>]]);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<thermalfoundation:material:656>), scripts.helpers.stages.progression2.stage, <thermalfoundation:material:656>, [[null, <ore:ingotIron>, null], [<ore:ingotIron>, <ore:gearSteel>, <ore:ingotIron>], [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>]]);

//Aqueous Accumulator
recipes.remove(<thermalexpansion:device>);
for rune in scripts.helpers.AllWaterT1Items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <thermalexpansion:device>, [[<ore:plateIron>, rune, <ore:plateIron>], [<ore:ingotIron>, scripts.helpers.FrameTiers[0], <ore:ingotIron>], [<ore:plateIron>, <ore:ingotGold>, <ore:plateIron>]]);
}

//Thermal expansion Extended Crafting recipes
val thermalRecipes_EXTENDEDCRAFTING = {
	<thermalexpansion:device:12> : [[null, scripts.helpers.CircuitTiers[0], null], [<ore:ingotPulsatingIron>, <minecraft:hopper>, <ore:ingotPulsatingIron>], [<ore:dustObsidian>, scripts.helpers.FrameTiers[0], <ore:dustObsidian>]],
	<thermalexpansion:device:11> : [[null, <thermalexpansion:morb>, null], [<ore:blockGlass>, scripts.helpers.FrameTiers[0], <ore:blockGlass>], [<ore:ingotSteel>, <ore:gearConductiveIron>, <ore:ingotSteel>]],
	<thermalexpansion:device:9> : [[null, <minecraft:dispenser>, null], [<ore:gearSilver>, scripts.helpers.FrameTiers[0], <ore:gearSilver>], [<ore:ingotSteel>, <ore:gearConductiveIron>, <ore:ingotSteel>]],
	<thermalexpansion:device:8> : [[null, <ore:ingotEnchantedMetal>, null], [<ore:book>, scripts.helpers.FrameTiers[0], <ore:book>], [<ore:obsidian>, <ore:ingotEnchantedMetal>, <ore:obsidian>]],
	<thermalexpansion:device:7> : [[null, <thermalfoundation:tome_lexicon>, null], [<ore:ingotLead>, scripts.helpers.FrameTiers[0], <ore:ingotLead>], [<ore:ingotGold>, <ore:gearPulsatingIron>, <ore:ingotGold>]],
	<thermalexpansion:device:6> : [[null, <minecraft:bucket>, null], [<ore:ingotElectrotineAlloy>, scripts.helpers.FrameTiers[0], <ore:ingotElectrotineAlloy>], [<ore:gearStone>, <ore:dustRedstone>, <ore:gearStone>]],
	<thermalexpansion:device:5> : [[null, <minecraft:hopper>, null], [<ore:ingotRedstoneAlloy>, scripts.helpers.FrameTiers[0], <ore:ingotRedstoneAlloy>], [<ore:gearStone>, <ore:dustRedstone>, <ore:gearStone>]],
	<thermalexpansion:device:3> : [[<ore:ingotSteel>, null, <ore:ingotSteel>], [<magneticraft:iron_pipe>, scripts.helpers.FrameTiers[0], <magneticraft:iron_pipe>], [<magneticraft:iron_pipe>, <ore:gearSteel>, <magneticraft:iron_pipe>]],
	<thermalexpansion:device:2> : [[<ore:ingotInvar>, <ore:gearIron>, <ore:ingotInvar>], [<ore:dustRedstone>, scripts.helpers.FrameTiers[0], <ore:dustRedstone>], [<ore:ingotInvar>, <ore:gearIron>, <ore:ingotInvar>]],
	<thermalexpansion:device:1> : [[<ore:stone>, null, <ore:stone>], [<ore:stone>, <ore:dustRedstone>, <ore:stone>], [<ore:stone>, <ore:chestWood>, <ore:stone>]],
	<thermalexpansion:device:10> : [[null, <ore:workbench>, null], [<ore:ingotIron>, scripts.helpers.FrameTiers[0], <ore:ingotIron>], [<ore:gearGold>, <ore:dustRedstone>, <ore:gearGold>]],
	<thermalexpansion:device:4> : [[null, <minecraft:fishing_rod>, null], [<ore:barsIron>, scripts.helpers.FrameTiers[0], <ore:barsIron>], [<ore:gearIron>, <ore:dustRedstone>, <ore:gearIron>]],
	<thermalexpansion:dynamo> : [[null, <ore:coilCopper>, null], [<ore:ingotSteel>, scripts.helpers.FrameTiers[0], <ore:ingotSteel>], [<ore:ingotCopper>, scripts.helpers.MotorTiers[0], <ore:ingotCopper>]],
	<thermalexpansion:dynamo:1> : [[null, <ore:plateInvar>, null], [<ore:ingotSteel>, scripts.helpers.FrameTiers[1], <ore:ingotSteel>], [<ore:ingotInvar>, scripts.helpers.MotorTiers[0], <ore:ingotInvar>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in thermalRecipes_EXTENDEDCRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

//Grind up Coal Coke into Dust
scripts.helpers.addCrushingRecipe(<contenttweaker:coke_dust>, <ore:fuelCoke>, 5000, 1);

//Aqua Chow Recipes
recipes.remove(<thermalfoundation:bait>);
recipes.remove(<thermalfoundation:bait:1>);
recipes.addShapeless(scripts.helpers.createRecipeName(<thermalfoundation:bait>), <thermalfoundation:bait> * 10, [<ore:dustWood>, <ore:slimeball>, <ore:cropNetherWart>, <minecraft:bread>]);
mods.inworldcrafting.FluidToItem.transform(<thermalfoundation:bait:1> * 10, <liquid:redstone>, [<thermalfoundation:bait> * 10], true);
mods.thermalexpansion.Transposer.addFillRecipe(<thermalfoundation:bait:1>, <thermalfoundation:bait>, <liquid:redstone> * 100, 2000);

//Alloy Smelting Lumium
for tinIngot in <ore:ingotTin>.items
{
	for silverIngot in <ore:ingotSilver>.items
	{
		mods.advancedrocketry.ArcFurnace.addRecipe(<ore:ingotLumium>.firstItem * 4, 600, 2, tinIngot * 3, silverIngot, <ore:dustGlowstone>.firstItem * 4, <ore:sand>.firstItem);
	}
}

//Alloy Smelting Signalum
for copperIngot in <ore:ingotCopper>.items
{
	for silverIngot in <ore:ingotSilver>.items
	{
		mods.advancedrocketry.ArcFurnace.addRecipe(<ore:ingotSignalum>.firstItem * 4, 600, 2, copperIngot * 3, silverIngot, <ore:dustRedstone>.firstItem * 10, <ore:sand>.firstItem);
	}
}

//Extended Crafting Recipes (T2 Table)
val thermalfoundation_EXTENDEDCRAFTING_T2 = {
	 //null
 	 //								:	[[null, null, null],
	 //									[null, null, null],
 	 //  								[null, null, null],
	 //									[null, null, null]],
	 <thermalexpansion:dynamo:5>
 	 								:	[[null, scripts.helpers.CircuitTiers[1], null],
	 									[<ore:plateCrystallineAlloy>, scripts.helpers.FrameTiers[2], <ore:plateCrystallineAlloy>],
 	   									[scripts.helpers.BatteryTiers[2], scripts.helpers.MotorTiers[1], scripts.helpers.BatteryTiers[2]],
	 									[null, <ore:ingotSignalum>, <ore:gearRedstoneAlloy>]],
	 <thermalexpansion:dynamo:4>
 	 								:	[[null, scripts.helpers.CircuitTiers[1], null],
	 									[<ore:plateElectrumFlux>, scripts.helpers.FrameTiers[1], <ore:plateElectrumFlux>],
 	   									[<ore:coilIron>, scripts.helpers.MotorTiers[1], <ore:coilIron>],
	 									[null, <ore:ingotElectrum>, <ore:gearRedstoneAlloy>]],
	 <thermalexpansion:dynamo:3>
 	 								:	[[null, scripts.helpers.CircuitTiers[1], null],
	 									[<ore:plateSignalum>, scripts.helpers.FrameTiers[1], <ore:plateSignalum>],
 	   									[<ore:coilGold>, scripts.helpers.MotorTiers[1], <ore:coilGold>],
	 									[null, <ore:dustGlowstone>, <ore:gearAluminum>]],
	 <thermalexpansion:dynamo:2>
 	 								:	[[null, scripts.helpers.CircuitTiers[1], null],
	 									[<ore:plateInvar>, scripts.helpers.FrameTiers[1], <ore:plateInvar>],
 	   									[<ore:coilCopper>, scripts.helpers.MotorTiers[1], <ore:coilCopper>],
	 									[null, <ore:dustRedstone>, <ore:gearTin>]],
	 <thermalexpansion:machine:14>
 	 								:	[[<ore:plateCopper>, <ore:dustBlizz>, <ore:plateCopper>],
										[<ore:dustBlizz>, scripts.helpers.FrameTiers[1], <ore:dustBlizz>],
										[<ore:plateCopper>, scripts.helpers.CircuitTiers[1], <ore:plateCopper>],
										[null, <ore:ingotInvar>, <minecraft:snowball>]],

	 <thermalexpansion:machine:13>
 	 								:	[[null, <minecraft:enchanting_table>, null],
	 									[<ore:plateLapis>, scripts.helpers.FrameTiers[3], <ore:plateLapis>],
	   									[<ore:ingotElectrumFlux>, scripts.helpers.CircuitTiers[2], <ore:ingotElectrumFlux>],
	 									[null, <ore:ingotEnchantedMetal>, <ore:ingotEnchantedMetal>]],
	 <thermalexpansion:machine:12>
 	 								:	[[null, <minecraft:brewing_stand>, null],
	 									[<ore:blockGlass>, scripts.helpers.FrameTiers[0], <ore:blockGlass>],
	   									[<ore:ingotConstantan>, <ore:ingotConductiveIron>, <ore:ingotConstantan>],
	 									[null, <ore:dustRedstone>, <ore:dustGlowstone>]],
	 <thermalexpansion:machine:9>
 	 								:	[[<ore:blockGlass>, <ore:coilCopper>, <ore:blockGlass>],
	 									[scripts.helpers.BatteryTiers[0], scripts.helpers.FrameTiers[0], scripts.helpers.BatteryTiers[0]],
	   									[<ore:blockGlass>, <ore:coilCopper>, <ore:blockGlass>],
	 									[null, null, <ore:ingotGold>]],
	 <thermalexpansion:machine:15>
 	 								:	[[<ore:blockGlass>, scripts.helpers.CircuitTiers[1], <ore:blockGlass>],
	 									[<ore:plateManyullyn>, scripts.helpers.FrameTiers[1], <ore:plateManyullyn>],
	   									[<ore:blockGlass>, scripts.helpers.CircuitTiers[1], <ore:blockGlass>],
	 									[<ore:blockGlass>, null, <ore:gearInvar>]],
	 <thermalexpansion:machine:10>
 	 								:	[[<ore:gearTin>, scripts.helpers.MotorTiers[0], <ore:gearAluminum>],
	 									[null, scripts.helpers.FrameTiers[1], null],
	  									[<ore:gearAluminum>, scripts.helpers.CircuitTiers[0], <ore:gearTin>],
	 									[null, <ore:ingotSteel>, <ore:ingotConstantan>]],
	 <thermalexpansion:machine:6>
 									:	[[null, <ore:coilGold>, null],
	 									[<ore:blockGlass>, scripts.helpers.FrameTiers[0], <ore:blockGlass>],
	   									[<ore:gearBronze>, scripts.helpers.CircuitTiers[1], <ore:gearBronze>],
	 									[<ore:plateNickel>, null, <ore:ingotBrickNether>]],
	 <thermalexpansion:machine:2>
	 								:	[[null, <thermalfoundation:material:657>, null],
	 									[<ore:gearSteel>, scripts.helpers.FrameTiers[1], <ore:gearSteel>],
	   									[null, scripts.helpers.CircuitTiers[0], null],
	 									[<ore:plankWood>, <ore:plateSealedWood>, <ore:plateWood>]],
	 <thermalexpansion:machine>
	 								:	[[<ore:stone>, scripts.helpers.CircuitTiers[0], <ore:stone>],
	 									[<ore:stone>, scripts.helpers.FrameTiers[1], <ore:stone>],
	   									[<ore:gearCopper>, <ore:coilGold>, <ore:gearCopper>],
	 									[null, <ore:ingotNickel>, <ore:plateNickel>]],
	 <thermalexpansion:machine:8>
	 								:	[[null, <minecraft:bucket>, null],
	 									[<ore:blockGlass>, scripts.helpers.FrameTiers[2], <ore:blockGlass>],
  										[<ore:gearSignalum>, scripts.helpers.MotorTiers[1], <ore:gearSignalum>],
	  									[null, <ore:ingotBrass>, <ore:plateBrass>]],
	 <thermalexpansion:machine:4>
	 								:	[[null, <ore:gearLumium>, null],
	 									[<ore:dirt>, <enderio:item_material:66>, <ore:dirt>],
  										[<ore:gearCopper>, scripts.helpers.CircuitTiers[2], <ore:gearCopper>],
	  									[null, <ore:ingotLumium>, <thermalfoundation:fertilizer:2>]],
	 <thermalexpansion:machine:5>
	 								:	[[<ore:gearLumium>, <ore:gearSignalum>, <ore:gearEnderium>],
	 									[<ore:blockGlassColorless>, <enderio:item_material:66>, <ore:blockGlassColorless>],
  										[<ore:plateEnderium>, <ore:plateSignalum>, <ore:plateLumium>],
	  									[null, <ore:ingotSteel>, <ore:ingotSteel>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in thermalfoundation_EXTENDEDCRAFTING_T2 {
	recipes.remove(key.withAmount(1));
	scripts.helpers.createAdvancedCraftingRecipe(key, value, value[3][0], value[3][1], value[3][2], "", true);
}

//Elemental Powders Rework
//Make the Elemental Powders Craft out of the Magic Elemental Liquids
val elementalInputs = [
	<minecraft:snowball> * 2,
	<thermalfoundation:material:772>,
	<thermalfoundation:material:771>,
	<thermalfoundation:material:770>,
] as crafttweaker.item.IItemStack[];

for input in elementalInputs
{
	mods.thermalexpansion.Transposer.removeFillRecipe(input, <liquid:essence>);
	mods.thermalexpansion.Transposer.removeFillRecipe(input, <liquid:xpjuice>);
	mods.thermalexpansion.Transposer.removeFillRecipe(input, <liquid:experience>);
}

//Create the dusts themselves (that get turned into the useful liquids)
val thermal_elementalDusts = {
	<ore:dustPyrotheum>.firstItem : [<contenttweaker:magma_powder>, <contenttweaker:magma_powder>, <ore:dustSulfur>.firstItem, <ore:dustRedstone>.firstItem],
	<ore:dustCryotheum>.firstItem : [<ore:dustBlizz>.firstItem, <ore:dustBlizz>.firstItem, <ore:dustSaltpeter>.firstItem, <ore:dustRedstone>.firstItem],
	<ore:dustPetrotheum>.firstItem : [<ore:dustBasalz>.firstItem, <ore:dustBasalz>.firstItem, <ore:dustSulfur>.firstItem, <ore:dustRedstone>.firstItem],
	<ore:dustAerotheum>.firstItem : [<ore:dustBlitz>.firstItem, <ore:dustBlitz>.firstItem, <ore:dustSaltpeter>.firstItem, <ore:dustRedstone>.firstItem],
} as crafttweaker.item.IItemStack[][crafttweaker.item.IItemStack];

for elementalPowder, ingredients in thermal_elementalDusts {
	var weightedArray as crafttweaker.item.WeightedItemStack[] = [ingredients[0] % 100, ingredients[1] % 100, ingredients[2] % 100, ingredients[3] % 100];

	//Centrifuge
	mods.thermalexpansion.Centrifuge.removeRecipe(elementalPowder);
	mods.thermalexpansion.Centrifuge.addRecipe(weightedArray, elementalPowder * 2, null, 1500);

	//Crafting
	recipes.remove(elementalPowder);
	mods.recipestages.Recipes.addShapeless(scripts.helpers.createRecipeName(elementalPowder), scripts.helpers.stages.progression2.stage, elementalPowder * 2, ingredients);
}

//Add Recipes using Ash + an elemental Liquid to make the respective powder
val thermal_elementalPowders = {
	<liquid:elemental_water_fire> : <contenttweaker:magma_powder>,
	<liquid:elemental_water_water> : <ore:dustBlizz>.firstItem,
	<liquid:elemental_water_earth> : <ore:dustBasalz>.firstItem,
	<liquid:elemental_water_air> : <ore:dustBlitz>.firstItem,
} as crafttweaker.item.IItemStack[crafttweaker.liquid.ILiquidStack];

for elementalLiquid, elementalPowder in thermal_elementalPowders {
	scripts.helpers.addInjectionRecipe(elementalPowder, <bountifulbaubles:spectralsilt>, elementalLiquid * 250, 2500, 2);
}

//Change Hardened Glass Recipe
mods.thermalexpansion.InductionSmelter.removeRecipe(<ore:dustLead>.firstItem, <ore:dustObsidian>.firstItem * 4);
scripts.helpers.addAlloySmeltingRecipe(<thermalfoundation:glass:3> * 3, <ore:blockGlass>.firstItem * 3, <ore:ingotTough>.firstItem * 1, 30000, 2);

//Create Mana Dust by Combining All Elemental Dusts
scripts.mmhelper.IndustrialMixerFactoryRecipe("primal_mana", 50000, 100, <liquid:mana> * 1000, null, <liquid:pyrotheum> * 250, <liquid:cryotheum> * 250, <liquid:aerotheum> * 250, <liquid:petrotheum> * 250, null, null, null);

//Solidify Primal Mana into Mana Powder
scripts.helpers.addInjectionRecipe(<thermalfoundation:material:1028>, <bountifulbaubles:spectralsilt>, <liquid:mana> * 1000, 2500, 3);

//Melt Mana Powder into Primal Mana
scripts.helpers.addMeltingRecipe(<liquid:mana> * 1000, <thermalfoundation:material:1028>, 12500, 3);

//Thermal Assembly Recipes
val thermalfoundationRecipes_ASSEMBLY = {
	<thermalfoundation:material:640> : [<ore:ingotSteel>, <ore:dustRedstone>, <ore:ingotSteel>, <ore:plateElectrum>, scripts.helpers.CircuitTiers[1], <ore:plateElectrum>, <ore:dustRedstone>, <ore:ingotSteel>, <ore:dustRedstone>],
	<thermalfoundation:material:512> * 2 : [<ore:dustRedstone>, null, <ore:dustRedstone>, <ore:plateElectricalSteel>, scripts.helpers.CircuitTiers[1], <ore:plateElectricalSteel>, <ore:dustRedstone>, null, <ore:dustRedstone>],
	<thermaldynamics:duct_0:6> * 24 : [<ore:dustRedstone>, <ore:blockGlassHardened>, <ore:dustRedstone>, <ore:ingotElectrum>, <ore:ingotElectrum>, <ore:ingotElectrum>, <ore:dustRedstone>, <ore:blockGlassHardened>, <ore:dustRedstone>],
	<thermaldynamics:duct_0:7> * 24 : [<ore:dustRedstone>, <ore:blockGlassHardened>, <ore:dustRedstone>, <ore:ingotSignalum>, <ore:ingotSignalum>, <ore:ingotSignalum>, <ore:dustRedstone>, <ore:blockGlassHardened>, <ore:dustRedstone>],
	<thermaldynamics:duct_0:8> * 24 : [<ore:dustRedstone>, <ore:blockGlassHardened>, <ore:dustRedstone>, <ore:ingotEnderium>, <ore:ingotEnderium>, <ore:ingotEnderium>, <ore:dustRedstone>, <ore:blockGlassHardened>, <ore:dustRedstone>],
	<thermaldynamics:duct_16> * 16 : [null, null, null, <ore:plateBronze>, <ore:blockGlass>, <ore:plateBronze>, null, null, null],
	<thermaldynamics:duct_16:1> * 16 : [null, null, null, <ore:plateBronze>, <ore:ingotLead>, <ore:plateBronze>, null, null, null],
	<thermalexpansion:augment:496> : [null, <ore:gearBronze>, null, <ore:plateInvar>, scripts.helpers.CircuitTiers[2], <ore:plateInvar>, null, <ore:dustCryotheum>, null],
	<thermalexpansion:augment:448> : [<ore:ingotSilver>, <ore:blockGlassColorless>, <ore:ingotGold>, <ore:dustGlowstone>, scripts.helpers.CircuitTiers[1], <ore:dustRedstone>, <ore:ingotGold>, <ore:blockGlassColorless>, <ore:ingotSilver>],
	<thermalexpansion:augment:433> : [null, <minecraft:bucket>, null, <ore:ingotCopper>, scripts.helpers.CircuitTiers[0], <ore:ingotCopper>, null, <ore:ingotCopper>, null],
	<thermalexpansion:augment:432> : [null, <ore:blockGlass>, null, <ore:ingotTin>, scripts.helpers.CircuitTiers[0], <ore:ingotTin>, null, <ore:ingotTin>, null],
	<thermalexpansion:augment:416> : [null, <minecraft:diamond_sword>, null, <ore:ingotSteel>, scripts.helpers.CircuitTiers[1], <ore:ingotSteel>, <ore:ingotSteel>, <ore:gearInvar>, <ore:ingotSteel>],
	<thermalexpansion:augment:402> : [null, scripts.helpers.BatteryTiers[2], null, <ore:gearElectrum>, scripts.helpers.CircuitTiers[1], <ore:gearElectrum>, <ore:ingotSilver>, <ore:ingotSilver>, <ore:ingotSilver>],
	<thermalexpansion:augment:337> : [<ore:gearBronze>, <ore:gearInvar>, <ore:gearElectrum>, <ore:blockGlass>, scripts.helpers.CircuitTiers[2], <ore:blockGlass>, <ore:gearLumium>, <ore:gearSignalum>, <ore:gearEnderium>],
	<thermalexpansion:augment:336> : [<ore:plateLapis>, <ore:plateCoal>, <ore:plateApatite>, <ore:blockGlass>, scripts.helpers.CircuitTiers[2], <ore:blockGlass>, <ore:gearDiamond>, <ore:gearEmerald>, <ore:gearQuartz>],
	<thermalexpansion:augment:323> : [<ore:treeLeaves>, <ore:treeSapling>, <ore:treeLeaves>, <ore:plateLumium>, scripts.helpers.CircuitTiers[2], <ore:plateLumium>, <ore:treeLeaves>, <forestry:fertilizer_compound>, <ore:treeLeaves>],
	<thermalexpansion:augment:130> : [null, <ore:nuggetInvar>, null, <ore:nuggetInvar>, scripts.helpers.CircuitTiers[0], <ore:nuggetInvar>, null, <ore:nuggetInvar>, null],
	<thermalexpansion:augment:256> : [<minecraft:brick_block>, <ore:blockGlass>, <minecraft:brick_block>, <ore:plateSilver>, scripts.helpers.CircuitTiers[1], <ore:plateSilver>, <minecraft:brick_block>, <ore:blockGlass>, <minecraft:brick_block>],
	<thermalexpansion:augment:257> : [null, <ore:gearDarkSteel>, null, <ore:plateInvar>, scripts.helpers.CircuitTiers[2], <ore:plateInvar>, <ore:dustPyrotheum>, <ore:gearDarkSteel>, <ore:dustPyrotheum>],
	<thermalexpansion:augment:258> : [null, <ore:gearIron>, null, <ore:plateCopper>, scripts.helpers.CircuitTiers[1], <ore:plateCopper>, <minecraft:nether_brick>, <minecraft:nether_brick>, <minecraft:nether_brick>],
	<thermalexpansion:augment:273> : [null, <ore:gearEndSteel>, null, <ore:plateInvar>, scripts.helpers.CircuitTiers[2], <ore:plateInvar>, <ore:dustPetrotheum>, <ore:gearEndSteel>, <ore:dustPetrotheum>],
	<thermalexpansion:augment:288> : [null, <minecraft:bucket>, null, <ore:plateCopper>, scripts.helpers.CircuitTiers[1], <ore:plateCopper>, null, <ore:gearTin>, null],
	<thermalexpansion:augment:303> : [null, <ore:gearEnderium>, null, <thermalfoundation:material:865>, scripts.helpers.CircuitTiers[2], <thermalfoundation:material:865>, <ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>],
	<thermalexpansion:augment:304> : [null, <ore:gearEndSteel>, null, <ore:plateNickel>, scripts.helpers.CircuitTiers[2], <ore:plateNickel>, <ore:dustPyrotheum>, <ore:gearEndSteel>, <ore:dustPyrotheum>],
	<thermalexpansion:augment:320> : [<ore:blockGlassHardened>, <ore:ingotLumium>, <ore:blockGlassHardened>, <thermalfoundation:fertilizer:2>, scripts.helpers.CircuitTiers[3], <thermalfoundation:fertilizer:2>, <ore:blockGlassHardened>, <ore:ingotLumium>, <ore:blockGlassHardened>],
	<thermalexpansion:augment:324> : [<ore:blockGlassHardened>, <ore:gearNickel>, <ore:blockGlassHardened>, <thermalfoundation:fertilizer:2>, scripts.helpers.CircuitTiers[3], <thermalfoundation:fertilizer:2>, <ore:blockGlassHardened>, <ore:gearNickel>, <ore:blockGlassHardened>],
	<thermalexpansion:augment:352> : [<minecraft:nether_brick>, <ore:ingotInvar>, <minecraft:nether_brick>, <ore:ingotLead>, scripts.helpers.CircuitTiers[1], <ore:ingotLead>, <minecraft:nether_brick>, <ore:ingotInvar>, <minecraft:nether_brick>],
	<thermalexpansion:augment:369> : [null, <ore:gearSignalum>, null, <ore:plateLead>, scripts.helpers.CircuitTiers[0], <ore:plateLead>, null, <minecraft:cauldron>, null],
	<thermalexpansion:augment:400> : [null, scripts.helpers.BatteryTiers[2], null, <ore:coilGold>, scripts.helpers.CircuitTiers[1], <ore:coilGold>, <ore:ingotLead>, <ore:ingotLead>, <ore:ingotLead>],
	<thermalexpansion:augment:401> : [<ore:blockGlassHardened>, <ore:obsidian>, <ore:blockGlassHardened>, <ore:ingotEnchantedMetal>, scripts.helpers.CircuitTiers[2], <ore:ingotEnchantedMetal>, <ore:blockGlassHardened>, <ore:obsidian>, <ore:blockGlassHardened>],
	<thermalexpansion:augment:497> : [null, <ore:gearNickel>, null, <ore:blockGlass>, scripts.helpers.CircuitTiers[1], <ore:blockGlass>, <ore:plateEnergeticAlloy>, <ore:dustAerotheum>, <ore:plateEnergeticAlloy>],
	<thermalexpansion:augment:514> : [null, <ore:nuggetCopper>, null, <ore:nuggetCopper>, scripts.helpers.CircuitTiers[0], <ore:nuggetCopper>, null, <ore:nuggetCopper>, null],
	<thermalexpansion:augment:515> : [<ore:blockGlass>, <ore:ingotLead>, <ore:blockGlass>, <ore:ingotLead>, scripts.helpers.CircuitTiers[1], <ore:ingotLead>, <ore:blockGlass>, <ore:ingotLead>, <ore:blockGlass>],
	<thermalexpansion:augment:576> : [<ore:gearBronze>, <minecraft:bucket>, <ore:gearBronze>, <ore:blockGlass>, scripts.helpers.CircuitTiers[1], <ore:blockGlass>, <ore:blockGlass>, <ore:coilCopper>, <ore:blockGlass>],
	<thermalexpansion:augment:640> : [null, <ore:ingotIron>, null, <ore:plateCopper>, scripts.helpers.CircuitTiers[1], <ore:plateCopper>, <ore:plateCopper>, <ore:ingotIron>, <ore:plateCopper>],
	<thermalexpansion:augment:656> : [null, <ore:gearSignalum>, null, <ore:plateInvar>, scripts.helpers.CircuitTiers[2], <ore:plateInvar>, null, <ore:dustCryotheum>, null],
	<thermalexpansion:augment:672> : [null, <ore:gearNickel>, null, <ore:plateInvar>, scripts.helpers.CircuitTiers[2], <ore:plateInvar>, null, <ore:dustCryotheum>, null],
	<thermalexpansion:augment:688> : [<ore:dustPetrotheum>, <ore:ingotLead>, <ore:dustCryotheum>, <ore:ingotLead>, scripts.helpers.CircuitTiers[1], <ore:ingotLead>, <ore:dustPyrotheum>, <ore:ingotLead>, <ore:dustAerotheum>],
	<thermalexpansion:augment:704> : [<ore:plateLapis>, <ore:ingotEnchantedMetal>, <ore:plateLapis>, <ore:gearGold>, scripts.helpers.CircuitTiers[2], <ore:gearGold>, <ore:plateLapis>, <ore:ingotEnchantedMetal>, <ore:plateLapis>],
	<thermalexpansion:augment:720> : [<ore:plateLapis>, <ore:ingotEnchantedMetal>, <ore:plateLapis>, <ore:gearGold>, scripts.helpers.CircuitTiers[2], <ore:gearGold>, <ore:plateLapis>, <ore:ingotEnchantedMetal>, <ore:plateLapis>],
	// <thermalexpansion:augment:128> : [null, null, null, null, null, null, null, null, null],
	// <thermalexpansion:augment:129> : [null, null, null, null, null, null, null, null, null],
	// <thermalexpansion:augment:368> : [null, null, null, null, null, null, null, null, null],
	// <thermalexpansion:augment:512> : [null, null, null, null, null, null, null, null, null],
	// <thermalexpansion:augment:513> : [null, null, null, null, null, null, null, null, null],
	<thermalexpansion:augment:673> : [<ore:blockGlassHardened>, <ore:coilGold>, <ore:blockGlassHardened>, <ore:plateSignalum>, scripts.helpers.CircuitTiers[3], <ore:plateSignalum>, <ore:blockGlassHardened>, <ore:dustPyrotheum>, <ore:blockGlassHardened>],
	<thermalexpansion:augment:674> : [<ore:blockGlassHardened>, <ore:coilCopper>, <ore:blockGlassHardened>, <ore:plateLumium>, scripts.helpers.CircuitTiers[3], <ore:plateLumium>, <ore:blockGlassHardened>, <ore:dustAerotheum>, <ore:blockGlassHardened>],
} as crafttweaker.item.IIngredient[][crafttweaker.item.IItemStack];

for key, value in thermalfoundationRecipes_ASSEMBLY {
  recipes.remove(key.withAmount(1));
  scripts.helpers.CreateAssemblyRecipe(key, value, 120, 40000);
}

//Increase Biocrude output of Rich Bioblend
mods.thermalexpansion.Crucible.removeRecipe(<thermalfoundation:material:819>);
mods.thermalexpansion.Crucible.addRecipe(<liquid:biocrude> * 200, <thermalfoundation:material:819>, 6000);

//Add Tier tooltips for machines
<thermalexpansion:machine:6>.addTooltip(scripts.helpers.createTierTooltip("Melter Tier ", 2, false, "."));
<thermalexpansion:machine:8>.addTooltip(scripts.helpers.createTierTooltip("Fluid Injector Tier ", 3, false, "."));

//Rework Creation of Enderium (Since Platinum is not available in stage 2)
scripts.helpers.addAlloySmeltingRecipe(<enderio:item_material:39> * 4, <ore:ingotLead>.firstItem * 3, <ore:ingotBoron>.firstItem, 50000, 2);
scripts.helpers.addInjectionRecipe(<ore:ingotEnderium>.firstItem, <enderio:item_material:39>, <liquid:ender> * 250, 12500, 3);
mods.enderio.AlloySmelter.addRecipe(<ore:ingotEnderium>.firstItem * 4, [<ore:ingotLead> * 3, <ore:ingotBoron>, <ore:enderpearl>.firstItem * 4], 100000);
mods.thermalexpansion.Centrifuge.removeRecipe(<thermalfoundation:material:103>);
mods.thermalexpansion.Centrifuge.addRecipe([<ore:dustLead>.firstItem * 3, <ore:dustBoron>.firstItem], <thermalfoundation:material:103> * 4, <liquid:ender> * 1000, 8000);
mods.tconstruct.Alloy.removeRecipe(<liquid:enderium>);
mods.tconstruct.Alloy.addRecipe(<liquid:enderium> * 1000, [<liquid:ender> * 250, <liquid:lead> * 108, <liquid:boron> * 36]);

//Remove easy production of (Rich) Slag
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <minecraft:compass>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <minecraft:clock>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <minecraft:cauldron>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <minecraft:minecart>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <minecraft:chest_minecart>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <minecraft:hopper_minecart>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <minecraft:furnace_minecart>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <minecraft:anvil>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <minecraft:hopper>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <minecraft:cobblestone> * 2);

//Remove Saltpeter Crafting
mods.enderio.SagMill.removeRecipe(<minecraft:sandstone>);
val niterSandItems = [
	<quark:red_sandstone_smooth_slab>,
	<minecraft:red_sandstone>,
	<minecraft:sandstone_stairs>,
	<biomesoplenty:white_sandstone>,
	<quark:sandstone_smooth_slab>,
	<quark:sandstone_new:2>,
	<minecraft:sandstone>,
	<quark:red_sandstone_bricks_stairs>,
	<minecraft:stone_slab2>,
	<quark:sandstone_new:1>,
	<quark:sandstone_new:3>,
	<biomesoplenty:other_slab:1>,
	<quark:sandstone_new>,
	<quark:red_sandstone_bricks_slab>,
	<minecraft:red_sandstone_stairs>,
	<biomesoplenty:white_sandstone_stairs>,
	<minecraft:sandstone:1>,
	<quark:sandstone_bricks_slab>,
	<minecraft:sandstone:2>,
	<biomesoplenty:white_sandstone:1>,
	<minecraft:red_sandstone:1>,
	<biomesoplenty:white_sandstone:2>,
	<quark:sandstone_bricks_stairs>,
	<minecraft:stone_slab:1>,
	<minecraft:red_sandstone:2>
] as crafttweaker.item.IItemStack[];

for sandItem in niterSandItems
{
	mods.thermalexpansion.Pulverizer.removeRecipe(sandItem);
}

//Re-add Niter Creation
for sawdust in <ore:dustWood>.items
{
	scripts.helpers.addInjectionRecipe(<thermalfoundation:material:772> * 3, sawdust * 6, <liquid:sewage> * 500, 30000, 3);
}

//Upgrade Industrial Mixer/Fluid Sieve into Fluid Transposer
mods.extendedcrafting.TableCrafting.addShaped(0, <thermalexpansion:machine:8>, [
	[<ore:plateBrass>, <minecraft:bucket>, <ore:plateBrass>],
	[<ore:blockGlassColorless>, <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:industrial_mixer"}), <ore:blockGlassColorless>],
	[<ore:gearSignalum>, scripts.helpers.CircuitTiers[2], <ore:gearSignalum>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <thermalexpansion:machine:8>, [
	[<ore:plateBrass>, <minecraft:bucket>, <ore:plateBrass>],
	[<ore:blockGlassColorless>, <industrialforegoing:ore_sieve>, <ore:blockGlassColorless>],
	[<ore:gearSignalum>, scripts.helpers.CircuitTiers[2], <ore:gearSignalum>]
]);

//Remove Niter Creation from Nether blocks
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:soul_sand>, <minecraft:netherrack> * 2);
val sulfurSandItems = [
	<quark:soul_sandstone_bricks_stairs>,
	<quark:soul_sandstone_smooth_slab>,
	<quark:soul_sandstone_slab>,
	<minecraft:netherrack>,
	<quark:sandstone_new:5>,
	<quark:sandstone_new:4>,
	<quark:soul_sandstone_bricks_slab>,
	<quark:soul_sandstone_stairs>,
	<quark:soul_sandstone>
] as crafttweaker.item.IItemStack[];

for sandItem in sulfurSandItems
{
	mods.thermalexpansion.Pulverizer.removeRecipe(sandItem);
}

//Duct Crafting Injections
recipes.remove(<thermaldynamics:duct_0:3>);
recipes.remove(<thermaldynamics:duct_0:4>);
recipes.remove(<thermaldynamics:duct_0:9>);
recipes.remove(<thermaldynamics:duct_32:6>);
recipes.remove(<thermaldynamics:duct_32:7>);
scripts.helpers.CreateAssemblyRecipe(<thermaldynamics:duct_0:9>, [<ore:ingotEndSteel>, <ore:blockGlassHardened>, <ore:ingotEndSteel>, <ore:blockGlassHardened>, <thermaldynamics:duct_0:4>, <ore:blockGlassHardened>, <ore:ingotEndSteel>, <ore:blockGlassHardened>, <ore:ingotEndSteel>], 20, 10000);

val thermalRecipes_ADVANCEDCONDUITS = {
	[/*Output*/<thermaldynamics:duct_16:2>, /*Input*/<thermaldynamics:duct_16>] : <liquid:invar>,
	[/*Output*/<thermaldynamics:duct_16:3>, /*Input*/<thermaldynamics:duct_16:1>] : <liquid:invar>,
	[/*Output*/<thermaldynamics:duct_16:4>, /*Input*/<thermaldynamics:duct_16:2>] : <liquid:signalum>,
	[/*Output*/<thermaldynamics:duct_16:5>, /*Input*/<thermaldynamics:duct_16:3>] : <liquid:signalum>,
	[/*Output*/<thermaldynamics:duct_16:6>, /*Input*/<thermaldynamics:duct_16:2>] : <liquid:tough>,
	[/*Output*/<thermaldynamics:duct_16:7>, /*Input*/<thermaldynamics:duct_16:3>] : <liquid:tough>,
	[/*Output*/<thermaldynamics:duct_32:2>, /*Input*/<thermaldynamics:duct_32>] : <liquid:glowstone>,
	[/*Output*/<thermaldynamics:duct_32:3>, /*Input*/<thermaldynamics:duct_32:1>] : <liquid:glowstone>,
	[/*Output*/<thermaldynamics:duct_32:4>, /*Input*/<thermaldynamics:duct_32>] : <liquid:signalum>,
	[/*Output*/<thermaldynamics:duct_32:5>, /*Input*/<thermaldynamics:duct_32:1>] : <liquid:signalum>,
} as crafttweaker.liquid.ILiquidStack[crafttweaker.item.IItemStack[]];

for conduit, liquid in thermalRecipes_ADVANCEDCONDUITS {
    recipes.remove(conduit[0].withAmount(1));
	if(liquid.name != "glowstone")
	{
		scripts.helpers.addInjectionRecipe(conduit[0], conduit[1], liquid * 144, 1000, 3);
	}
	else
	{
		scripts.helpers.addInjectionRecipe(conduit[0], conduit[1], liquid * 200, 1000, 3);
	}
}

val thermalRecipes_SHAPELESS = {
	<thermaldynamics:duct_32>.withTag({DenseType: 2 as byte}) : [<thermaldynamics:duct_32>, <ore:nuggetSilver>],
	<thermaldynamics:duct_32>.withTag({DenseType: 1 as byte}) : [<thermaldynamics:duct_32>, <ore:nuggetLead>],
	<thermaldynamics:duct_32:1>.withTag({DenseType: 2 as byte}) : [<thermaldynamics:duct_32:1>, <ore:nuggetSilver>],
	<thermaldynamics:duct_32:1>.withTag({DenseType: 1 as byte}) : [<thermaldynamics:duct_32:1>, <ore:nuggetLead>],
	<thermaldynamics:duct_32:2>.withTag({DenseType: 2 as byte}) : [<thermaldynamics:duct_32:2>, <ore:nuggetSilver>],
	<thermaldynamics:duct_32:2>.withTag({DenseType: 1 as byte}) : [<thermaldynamics:duct_32:2>, <ore:nuggetLead>],
	<thermaldynamics:duct_32:3>.withTag({DenseType: 2 as byte}) : [<thermaldynamics:duct_32:3>, <ore:nuggetSilver>],
	<thermaldynamics:duct_32:5>.withTag({DenseType: 2 as byte}) : [<thermaldynamics:duct_32:5>, <ore:nuggetSilver>],
	<thermaldynamics:duct_32:5>.withTag({DenseType: 1 as byte}) : [<thermaldynamics:duct_32:5>, <ore:nuggetLead>],
	<thermaldynamics:duct_32:4>.withTag({DenseType: 2 as byte}) : [<thermaldynamics:duct_32:4>, <ore:nuggetSilver>],
	<thermaldynamics:duct_32:4>.withTag({DenseType: 1 as byte}) : [<thermaldynamics:duct_32:4>, <ore:nuggetLead>],
	<thermaldynamics:duct_32:6>.withTag({DenseType: 2 as byte}) : [<thermaldynamics:duct_32:6>, <ore:nuggetSilver>],
	<thermaldynamics:duct_32:6>.withTag({DenseType: 1 as byte}) : [<thermaldynamics:duct_32:6>, <ore:nuggetLead>],
	<thermaldynamics:duct_32:7>.withTag({DenseType: 2 as byte}) : [<thermaldynamics:duct_32:7>, <ore:nuggetSilver>],
	<thermaldynamics:duct_32:7>.withTag({DenseType: 1 as byte}) : [<thermaldynamics:duct_32:7>, <ore:nuggetLead>],
	<thermaldynamics:duct_32:3>.withTag({DenseType: 1 as byte}) : [<thermaldynamics:duct_32:3>, <ore:nuggetLead>],
} as crafttweaker.item.IIngredient[][crafttweaker.item.IItemStack];

for key, value in thermalRecipes_SHAPELESS {
	recipes.remove(key.withAmount(1));
	mods.recipestages.Recipes.addShapeless(scripts.helpers.createRecipeName(key), scripts.helpers.stages.progression2.stage, key, value);
}

//Magmatic Dynamo Burnables
mods.thermalexpansion.MagmaticDynamo.addFuel(<liquid:fire_water> * 1000, 550000);
mods.thermalexpansion.MagmaticDynamo.addFuel(<liquid:elemental_water_fire> * 1000, 750000);

//Compression Dynamo Burnables
val removeCompressionFuels = [
	<liquid:bio.ethanol>,
	<liquid:rocket_fuel>,
	<liquid:fire_water>,
	<liquid:gasoline>,
	<liquid:refined_biofuel>,
	<liquid:coal>,
	<liquid:crude_oil>,
	<liquid:refined_oil>,
	<liquid:tree_oil>,
	<liquid:creosote>,
	<liquid:seed_oil>,
	<liquid:hootch>,
	<liquid:diesel>,
	<liquid:oil>,
	<liquid:refined_fuel>,
] as crafttweaker.liquid.ILiquidStack[];

for dynamoLiquidRemove in removeCompressionFuels
{
	mods.thermalexpansion.CompressionDynamo.removeFuel(dynamoLiquidRemove);
}

val addCompressionFuels = {
	<liquid:bio.ethanol> : 350000,
	<liquid:rocket_fuel> : 2500000,
	<liquid:gasoline> : 1750000,
	<liquid:refined_biofuel> : 2750000,
	<liquid:coal> : 150000,
	<liquid:crude_oil> : 300000,
	<liquid:refined_oil> : 450000,
	<liquid:tree_oil> : 250000,
	<liquid:creosote> : 50000,
	<liquid:seed_oil> : 90000,
	<liquid:hootch> : 250000,
	<liquid:diesel> : 2250000,
	<liquid:oil> : 300000,
	<liquid:refined_fuel> : 3000000,
} as int[crafttweaker.liquid.ILiquidStack];

for key, value in addCompressionFuels {
	mods.thermalexpansion.CompressionDynamo.addFuel(key * 1000, value);
}

//Reactant Dynamo Burnables
val removeReactantFuels = {
	<liquid:glowstone> : <minecraft:ghast_tear>,
	<liquid:redstone> : <minecraft:sugar>,
	<liquid:glowstone> : <minecraft:gunpowder>,
	<liquid:redstone> : <minecraft:gunpowder>,
	<liquid:glowstone> : <minecraft:sugar>,
	<liquid:glowstone> : <minecraft:blaze_powder>,
	<liquid:redstone> : <minecraft:blaze_powder>,
	<liquid:redstone> : <minecraft:ghast_tear>,
	<liquid:glowstone> : <minecraft:nether_wart>,
	<liquid:redstone> : <minecraft:nether_wart>,
	<liquid:cryotheum> : <thermalfoundation:material:1024>,
	<liquid:pyrotheum> : <thermalfoundation:material:1025>,
	<liquid:petrotheum> : <thermalfoundation:material:1026>,
	<liquid:aerotheum> : <thermalfoundation:material:1027>,
} as crafttweaker.item.IItemStack[crafttweaker.liquid.ILiquidStack];

for key, value in removeReactantFuels {
	mods.thermalexpansion.ReactantDynamo.removeReaction(value, key);
}

val reactantDynamoSolids = {
	<minecraft:sugar> : 1.05f,
	<minecraft:glowstone_dust> : 1.25f,
	<minecraft:redstone> : 1.1f,
	<minecraft:nether_wart> : 1.2f,
	<forestry:fertilizer_compound> : 1.3f,
	<thermalfoundation:material:1027> : 3.3f,
	<thermalfoundation:material:1026> : 3.3f,
	<thermalfoundation:material:1025> : 3.3f,
	<thermalfoundation:material:1024> : 3.3f,
	<thermalfoundation:material:2049> : 1.4f,
	<thermalfoundation:material:2051> : 1.4f,
	<thermalfoundation:material:2053> : 1.4f,
	<thermalfoundation:material:1028> : 4.0f,
	<contenttweaker:magma_powder> : 1.4f,
} as float[crafttweaker.item.IItemStack];

val reactantDynamoLiquids = {
	<liquid:redstone> : 60000.0f,
	<liquid:glowstone> : 75000.0f,
	<liquid:ender> : 100000.0f,
	<liquid:aerotheum> : 350000.0f,
	<liquid:petrotheum> : 350000.0f,
	<liquid:cryotheum> : 350000.0f,
	<liquid:pyrotheum> : 350000.0f,
	<liquid:elemental_mix> : 1400000.0f,
	<liquid:mana> : 2100000.0f,
} as float[crafttweaker.liquid.ILiquidStack];

for solid, factor in reactantDynamoSolids {
	for liquid, power in reactantDynamoLiquids {
		if(!(solid.displayName.contains(liquid.name))) {
			var calculatedPower = (power * factor) as int;

			mods.thermalexpansion.ReactantDynamo.addReaction(solid, liquid * 100, calculatedPower);
		}
	}
}

//Ennervating Dynamo Burnables
val removeEnnervatingFuels = [
	<minecraft:redstone>,
	<minecraft:redstone_block>,
] as crafttweaker.item.IItemStack[];

for ennervatingItemRemove in removeEnnervatingFuels
{
	mods.thermalexpansion.EnervationDynamo.removeFuel(ennervatingItemRemove);
}

val addEnnervatingFuels = {
	<minecraft:redstone> : 60000,
	<minecraft:redstone_block> : 540000,
} as int[crafttweaker.item.IItemStack];

for key, value in addEnnervatingFuels {
	mods.thermalexpansion.EnervationDynamo.addFuel(key, value);
}

//Numismatic Dynamo Burnables (Coin)
val removeNumismaticCoinFuels = [
	<jaopca:item_coinastralstarmetal>,
	<thermalfoundation:coin:96>,
	<jaopca:item_coinvibranium>,
	<thermalfoundation:coin:1>,
	<thermalfoundation:coin:67>,
	<jaopca:item_coinchromium>,
	<jaopca:item_cointitanium>,
	<thermalfoundation:coin:98>,
	<thermalfoundation:coin:71>,
	<jaopca:item_coincobalt>,
	<thermalfoundation:coin:97>,
	<jaopca:item_coinboron>,
	<thermalfoundation:coin:64>,
	<jaopca:item_coinancientdebris>,
	<thermalfoundation:coin:68>,
	<thermalfoundation:coin:66>,
	<thermalfoundation:coin:101>,
	<jaopca:item_cointungsten>,
	<thermalfoundation:coin:100>,
	<jaopca:item_coindraconium>,
	<jaopca:item_coinosmium>,
	<thermalfoundation:coin:70>,
	<thermalfoundation:coin:99>,
	<jaopca:item_coinzinc>,
	<thermalfoundation:coin>,
	<thermalfoundation:coin:102>,
	<jaopca:item_coinmagnesium>,
	<jaopca:item_coinlithium>,
	<thermalfoundation:coin:72>,
	<thermalfoundation:coin:69>,
	<jaopca:item_coinardite>,
	<minecraft:emerald>,
	<thermalfoundation:coin:103>,
	<jaopca:item_coinuranium>,
	<jaopca:item_cointhorium>,
	<jaopca:item_coinnecrodermis>,
	<thermalfoundation:coin:65>,
] as crafttweaker.item.IItemStack[];

for numismaticCoin in removeNumismaticCoinFuels
{
	mods.thermalexpansion.NumisticDynamo.removeFuel(numismaticCoin);
}

val addNumismaticCoinFuels = {
	<thermalfoundation:coin> : 			15000,
	<thermalfoundation:coin:1> : 		32500,
	<thermalfoundation:coin:64> : 		40000,
	<thermalfoundation:coin:68> : 		40000,
	<thermalfoundation:coin:65> : 		40000,
	<thermalfoundation:coin:66> : 		45000,
	<thermalfoundation:coin:67> : 		55000,
	<thermalfoundation:coin:69> : 		60000,
	<jaopca:item_coinastralstarmetal> : 65000,
	<jaopca:item_coinzinc> : 			65000,
	<thermalfoundation:coin:96> : 		75000,
	<jaopca:item_coinlithium> : 		75000,
	<thermalfoundation:coin:98> : 		80000,
	<thermalfoundation:coin:99> : 		80000,
	<thermalfoundation:coin:100> : 		80000,
	<thermalfoundation:coin:97> : 		80000,
	<jaopca:item_coinboron> : 			80000,
	<jaopca:item_coinardite> : 			85000,
	<jaopca:item_coincobalt> : 			85000,
	<thermalfoundation:coin:101> : 		90000,
	<thermalfoundation:coin:102> : 		95000,
	<jaopca:item_coinmagnesium> : 		105000,
	<thermalfoundation:coin:70> : 		115000,
	<thermalfoundation:coin:103> : 		120000,
	<thermalfoundation:coin:72> : 		130000,
	<jaopca:item_coinancientdebris> : 	150000,
	<jaopca:item_coinosmium> : 			157500,
	<jaopca:item_coinuranium> : 		165000,
	<jaopca:item_cointhorium> : 		165000,
	<jaopca:item_cointungsten> : 		1000000,
	<jaopca:item_coinchromium> : 		1000000,
	<thermalfoundation:coin:71> : 		1000000,
	<jaopca:item_cointitanium> : 		3750000,
	<jaopca:item_coindraconium> : 		5000000,
	<jaopca:item_coinnecrodermis> : 	12500000,
	<jaopca:item_coinvibranium> : 		12500000,
} as int[crafttweaker.item.IItemStack];

for key, value in addNumismaticCoinFuels {
	mods.thermalexpansion.NumisticDynamo.addFuel(key, value);
}

//Numismatic Dynamo Burnables (Gem)
val removeNumismaticGemFuels = [
	<biomesoplenty:gem>,
	<minecraft:dye:4>,
	<biomesoplenty:gem:7>,
	<redstonearsenal:material:160>,
	<forestry:apatite>,
	<biomesoplenty:gem:1>,
	<biomesoplenty:gem:2>,
	<minecraft:diamond>,
	<biomesoplenty:gem:6>,
	<minecraft:quartz>,
	<minecraft:prismarine_shard>,
	<biomesoplenty:gem:4>,
	<minecraft:emerald>,
	<biomesoplenty:gem:5>,
	<biomesoplenty:gem:3>,
] as crafttweaker.item.IItemStack[];

for numismaticGem in removeNumismaticGemFuels
{
	mods.thermalexpansion.NumisticDynamo.removeGemFuel(numismaticGem);
}

val addNumismaticGemFuels = {
	<minecraft:coal> : 30000,
	<minecraft:diamond> : 80000,
	<minecraft:dye:4> : 12000,
	<minecraft:emerald> : 80000,
	<minecraft:quartz> : 40000,
	<minecraft:prismarine_shard> : 50000,
	<appliedenergistics2:material> : 75000,
	<appliedenergistics2:material:1> : 85000,
	<appliedenergistics2:material:7> : 100000,
	<biomesoplenty:gem> : 50000,
	<biomesoplenty:gem:1> : 50000,
	<biomesoplenty:gem:2> : 50000,
	<biomesoplenty:gem:3> : 50000,
	<biomesoplenty:gem:4> : 50000,
	<biomesoplenty:gem:5> : 50000,
	<biomesoplenty:gem:6> : 50000,
	<biomesoplenty:gem:7> : 50000,
	<extrautils2:ingredients:5> : 100000,
	<forestry:apatite> : 10000,
	<nuclearcraft:gem> : 1200000,
	<nuclearcraft:gem:1> : 4000000,
	<nuclearcraft:gem:2> : 600000,
	<nuclearcraft:gem:3> : 600000,
	<nuclearcraft:gem:4> : 500000,
	<nuclearcraft:gem:5> : 1100000,
	<quark:biotite> : 100000,
	<rftools:dimensional_shard> : 1800000,
	<redstonearsenal:material:160> : 400000,
	<libvulpes:productgem> : 7000000,
} as int[crafttweaker.item.IItemStack];

for key, value in addNumismaticGemFuels {
	mods.thermalexpansion.NumisticDynamo.addGemFuel(key, value);
}

print("### Thermal Foundation Init Complete ###");
