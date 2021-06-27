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
	 //  									[null, null, null],
	 //									[null, null, null]],
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
  										[<ore:plateLumium>, <ore:plateSignalum>, <ore:plateEnderium>],
	  									[<ore:ingotSteel>, null, <ore:plateSteel>]],
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
} as crafttweaker.item.IIngredient[][crafttweaker.item.IItemStack];

for key, value in thermalfoundationRecipes_ASSEMBLY {
  recipes.remove(key.withAmount(1));
  scripts.helpers.CreateAssemblyRecipe(key, value, 40, 20000);
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

//Remove easy production of Rich Slag
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <minecraft:compass>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <minecraft:clock>);

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

print("### Thermal Foundation Init Complete ###");
