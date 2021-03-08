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

//Factorizer
recipes.remove(<thermalexpansion:device:10>);
mods.extendedcrafting.TableCrafting.addShaped(0, <thermalexpansion:device:10>, [[null, <ore:workbench>, null], [<ore:ingotIron>, scripts.helpers.FrameTiers[0], <ore:ingotIron>], [<ore:gearGold>, <ore:dustRedstone>, <ore:gearGold>]]);

//Aquatic Entangler
recipes.remove(<thermalexpansion:device:4>);
mods.extendedcrafting.TableCrafting.addShaped(0, <thermalexpansion:device:4>, [[null, <minecraft:fishing_rod>, null], [<ore:barsIron>, scripts.helpers.FrameTiers[0], <ore:barsIron>], [<ore:gearIron>, <ore:dustRedstone>, <ore:gearIron>]]);
//Grind up Coal Coke into Dust
scripts.helpers.addCrushingRecipe(<contenttweaker:coke_dust>, <ore:fuelCoke>, 5000, true);

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
	 //  									[null, null, null],
	 //									[null, null, null]],
	 <thermalexpansion:machine:10>
 	 								:	[[<ore:gearTin>, scripts.helpers.MotorTiers[0], <ore:gearAluminum>],
	 									[null, scripts.helpers.FrameTiers[1], null],
	  									[<ore:gearAluminum>, scripts.helpers.CircuitTiers[0], <ore:gearTin>],
	 									[null, <ore:ingotSteel>, <ore:ingotConstantan>]],
	 <thermalexpansion:machine:6>
 									:	[[<ore:ingotBrickNether>, null, <ore:ingotBrickNether>],
	 									[null, scripts.helpers.FrameTiers[0], null],
	   									[<ore:gearBronze>, scripts.helpers.CircuitTiers[1], <ore:gearBronze>],
	 									[<ore:ingotLead>, <ore:ingotNickel>, <ore:ingotBrickNether>]],
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
	for ash in <ore:dustAsh>.items
	{
		mods.thermalexpansion.Transposer.addFillRecipe(elementalPowder, ash, elementalLiquid * 250, 2500);
	}
}

print("### Thermal Foundation Init Complete ###");
