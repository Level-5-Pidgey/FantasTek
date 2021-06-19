
print("~~~ Begin Mekanism Init ~~~");

//Disable Chemical Dissolution Chamber
mods.mekanism.chemical.dissolution.removeAllRecipes();
mods.jei.JEI.hideCategory("mekanism.chemicaldissolutionchamber");
scripts.helpers.unstageAndHide(<mekanism:machineblock2:6>);

//Add back some Chemical Injection Chamber Recipes
mods.mekanism.chemical.injection.addRecipe(<minecraft:dirt>, <gas:hydrogenchloride> * 200, <minecraft:clay>);
mods.mekanism.chemical.injection.addRecipe(<minecraft:gunpowder>, <gas:hydrogenchloride> * 200, <magneticraft:crafting>);

//Add back some purification chamber recipes
mods.mekanism.purification.addRecipe(<minecraft:gravel>, <gas:oxygen>, <minecraft:flint>);

//Reduce Paxel Durability
val MekanismPaxels = [
	<mekanismtools:woodpaxel>,
	<mekanismtools:stonepaxel>,
	<mekanismtools:ironpaxel>,
	<mekanismtools:diamondpaxel>,
	<mekanismtools:goldpaxel>,
	<mekanismtools:glowstonepaxel>,
	<mekanismtools:bronzepaxel>,
	<mekanismtools:osmiumpaxel>,
	<mekanismtools:obsidianpaxel>,
	<mekanismtools:lapislazulipaxel>,
	<mekanismtools:steelpaxel>
] as crafttweaker.item.IItemStack[];

for paxel in MekanismPaxels
{
	paxel.maxDamage = paxel.maxDamage * 2 / 3;
	scripts.helpers.AddTooltip(paxel, ["Paxels are usable as a Pickaxe, Shovel", "and Axe at once, but have a 33% durability penalty."]);
}

//Remove souped-up rail recipe.
recipes.removeByRecipeName("mekanism:rail");

//Create Salt from White Sand
mods.inworldcrafting.FluidToItem.transform(<mekanism:saltblock>, <liquid:astralsorcery.liquidstarlight>, [<biomesoplenty:white_sand>], false);
mods.botania.PureDaisy.addRecipe(<biomesoplenty:white_sand>, <mekanism:saltblock>);
mods.bloodmagic.BloodAltar.addRecipe(<biomesoplenty:white_sand>, <mekanism:saltblock>, 0, 50, 25, 25);
scripts.mmhelper.AddEmberAssemblyRecipe(scripts.helpers.createRecipeName(<mekanism:saltblock>), <mekanism:saltblock>, [<biomesoplenty:white_sand>], 200);
mods.thaumcraft.Crucible.registerRecipe(scripts.helpers.createRecipeName(<mekanism:saltblock>), "FIRSTSTEPS", <mekanism:saltblock>, <biomesoplenty:white_sand>, [<aspect:aer>]);

//Grind Salt blocks into salt items
mods.appliedenergistics2.Grinder.addRecipe(<mekanism:salt> * 2, <mekanism:saltblock>, 3);

//Remove Mekanism Paper Recipe
recipes.removeByRecipeName("mekanism:paper");

//Craft the Configurator
recipes.remove(<mekanism:configurator>);
mods.extendedcrafting.TableCrafting.addShaped(0, <mekanism:configurator>, [[null, null, <magneticraft:battery_item_medium>], [<ore:ingotElectrotineAlloy>, <ore:stickIron>, null], [<ore:stickIron>, <ore:ingotElectrotineAlloy>, null]]);

//Basic Energy Cube
recipes.remove(<mekanism:energycube>.withTag({tier: 0}));
for circuit in scripts.helpers.CircuitTiers[0].items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <mekanism:energycube>.withTag({tier: 0}), [[<ore:plateCrudeSteel>, <magneticraft:battery_item_medium>, <ore:plateCrudeSteel>], [<ore:ingotRedstoneAlloy>, circuit, <ore:ingotRedstoneAlloy>], [<ore:plateCrudeSteel>, <magneticraft:battery_item_medium>, <ore:plateCrudeSteel>]]);
	mods.extendedcrafting.TableCrafting.addShaped(0, <mekanism:energycube>.withTag({tier: 0}), [[<ore:plateSteel>, <magneticraft:battery_item_medium>, <ore:plateSteel>], [<ore:ingotRedstoneAlloy>, circuit, <ore:ingotRedstoneAlloy>], [<ore:plateSteel>, <magneticraft:battery_item_medium>, <ore:plateSteel>]]);
}

//Remove Crafting Recipes from Mekanism Storage Blocks
val MekanismUtilityBlocks = [
	<mekanism:machineblock2:11>.withTag({tier: 0}),
	<mekanism:machineblock2:11>.withTag({tier: 1}),
	<mekanism:machineblock2:11>.withTag({tier: 2}),
	<mekanism:machineblock2:11>.withTag({tier: 3}),
	<mekanism:machineblock2:11>.withTag({tier: 4}),
	<mekanism:energycube>.withTag({tier: 1}),
	<mekanism:energycube>.withTag({tier: 2}),
	<mekanism:energycube>.withTag({tier: 3}),
	<mekanism:energycube>.withTag({tier: 4}),
	<mekanism:basicblock:6>.withTag({tier: 0}),
	<mekanism:basicblock:6>.withTag({tier: 1}),
	<mekanism:basicblock:6>.withTag({tier: 2}),
	<mekanism:basicblock:6>.withTag({tier: 3}),
	<mekanism:basicblock:6>.withTag({tier: 4}),
	<mekanism:machineblock:13>,
] as crafttweaker.item.IItemStack[];

for block in MekanismUtilityBlocks
{
	recipes.remove(block);
	scripts.helpers.AddTooltip(block, ["Uncraftable.", "Try using alternatives in other mods!"]);
}

//Tier 1 Circuit Crafting
mods.mekanism.infuser.removeRecipe(scripts.helpers.CircuitTiers[1]);
mods.extendedcrafting.CombinationCrafting.addRecipe(scripts.helpers.CircuitTiers[1], 250000, 12500, <projectred-core:resource_item:301>, [<ore:ingotElectrum>, <ore:dustRedstone>, <ore:ingotElectrum>, <ore:dustRedstone>]);
mods.extendedcrafting.CombinationCrafting.addRecipe(scripts.helpers.CircuitTiers[1] * 9, 250000, 8000, <libvulpes:productboule:3>, [<ore:blockElectrum>, <ore:blockRedstone>, <ore:blockElectrum>, <ore:blockRedstone>]);

//Tier 2 Circuit Crafting
recipes.remove(scripts.helpers.CircuitTiers[3]);
mods.extendedcrafting.CombinationCrafting.addRecipe(scripts.helpers.CircuitTiers[3], 1000000, 50000, <mekanism:polyethene:2>, [scripts.helpers.CircuitTiers[1], <mekanism:enrichedalloy>, scripts.helpers.CircuitTiers[1], <mekanism:enrichedalloy>]);

//Metal Casing Crafting
recipes.remove(<mekanism:basicblock:8>);
mods.extendedcrafting.EnderCrafting.addShaped(<mekanism:basicblock:8>, [[<ore:plateSteel>, <ore:ingotBrass>, <ore:plateSteel>], [<ore:ingotBrass>, null, <ore:ingotBrass>], [<ore:plateSteel>, <ore:ingotBrass>, <ore:plateSteel>]], 60);

//Mechanical Imbuement
val mekanism_MechanicalImbuement = {
	scripts.helpers.FrameTiers[1] : 25000,
	scripts.helpers.CircuitTiers[1] : 25000,
	scripts.helpers.CircuitTiers[3] : 100000,
} as int[crafttweaker.item.IItemStack];

for item, energyCost in mekanism_MechanicalImbuement {
	scripts.mmhelper.AddMechanicalImbuerRecipe(scripts.helpers.createRecipeName(item), item, energyCost);
}

//Crafting Table Recipes
val mekanismRecipes_CRAFTINGTABLE = {
	//null : [[null, null, null], [null, null, null], [null, null, null]],
	<mekanism:basicblock2:1> * 6 : [[<ore:dustSmallLithium>, <ore:ingotSteel>, <ore:dustSmallLithium>], [<ore:ingotSteel>, <ore:plateQuartz>, <ore:ingotSteel>], [<ore:dustSmallLithium>, <ore:ingotSteel>, <ore:dustSmallLithium>]],
	<mekanism:basicblock2:2> * 4 : [[null, <mekanism:basicblock2:1>, null], [<mekanism:basicblock2:1>, scripts.helpers.CircuitTiers[0], <mekanism:basicblock2:1>], [null, <mekanism:basicblock2:1>, null]],
	<mekanism:basicblock2:3>.withTag({tier: 0}) : [[<ore:dustSmallCobalt>, scripts.helpers.BatteryTiers[1], <ore:dustSmallCobalt>], [scripts.helpers.BatteryTiers[1], scripts.helpers.FrameTiers[1], scripts.helpers.BatteryTiers[1]], [<ore:dustSmallCobalt>, scripts.helpers.BatteryTiers[1], <ore:dustSmallCobalt>]],
	<mekanism:basicblock2:4>.withTag({tier: 0}) : [[<ore:dustSmallArdite>, scripts.helpers.CircuitTiers[0], <ore:dustSmallArdite>], [scripts.helpers.CircuitTiers[0], scripts.helpers.FrameTiers[1], scripts.helpers.CircuitTiers[0]], [<ore:dustSmallArdite>, scripts.helpers.CircuitTiers[0], <ore:dustSmallArdite>]],
	<mekanism:basicblock2:3>.withTag({tier: 1}) : [[<mekanism:basicblock2:3>.withTag({tier: 0}), scripts.helpers.BatteryTiers[2], <mekanism:basicblock2:3>.withTag({tier: 0})], [scripts.helpers.BatteryTiers[2], <enderio:item_material:66>, scripts.helpers.BatteryTiers[2]], [<mekanism:basicblock2:3>.withTag({tier: 0}), scripts.helpers.BatteryTiers[2], <mekanism:basicblock2:3>.withTag({tier: 0})]],
	<mekanism:basicblock2:4>.withTag({tier: 1}) : [[<ore:dustSmallArdite>, scripts.helpers.CircuitTiers[0], <ore:dustSmallArdite>], [scripts.helpers.CircuitTiers[0], <enderio:item_material:66>, scripts.helpers.CircuitTiers[0]], [<ore:dustSmallArdite>, scripts.helpers.CircuitTiers[0], <ore:dustSmallArdite>]],
	<mekanism:electrolyticcore> : [[<ore:ingotSteel>, <ore:plateAluminium>, <ore:ingotSteel>], [<ore:dustGold>, null, <ore:dustSilver>], [<ore:ingotSteel>, <ore:plateAluminium>, <ore:ingotSteel>]],
	<mekanism:gastank>.withTag({tier: 0}) : [[<ore:ingotSteel>, <ore:plateAluminium>, <ore:ingotSteel>], [<ore:dustGold>, null, <ore:dustSilver>], [<ore:ingotSteel>, <ore:plateAluminium>, <ore:ingotSteel>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in mekanismRecipes_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Change Mekanism HDPE Creation
mods.mekanism.reaction.removeRecipe(<mekanism:substrate>, <gas:ethene> * 100);
mods.mekanism.reaction.removeRecipe(<mekanism:substrate> * 8, <gas:oxygen> * 10);
mods.mekanism.reaction.removeRecipe(<mekanism:polyethene>, <gas:oxygen> * 5);
<ore:platePlastic>.add(<mekanism:polyethene:2>);
<ore:stickPlastic>.add(<mekanism:polyethene:1>);

//Manipulate HDPE Pellets into Plastic Items
mods.thermalexpansion.Compactor.addPressRecipe(<mekanism:polyethene:1>, <mekanism:polyethene> * 2, 2000); //Rod
mods.thermalexpansion.Compactor.addStorageRecipe(<mekanism:polyethene:2>, <mekanism:polyethene> * 5, 2000); //Plate

//Convert other mods liquid form gases to Mek Gases
mods.mekanism.GasConversion.register(<liquid:oxygen> * 1, <gas:oxygen> * 1);
mods.mekanism.GasConversion.register(<liquid:hydrogen> * 1, <gas:hydrogen> * 1);

//Extended Crafting Recipes (T2 Table)
val mekanism_EXTENDEDCRAFTING_T2 = {
	 <mekanism:machineblock2>	:		[[<ore:blockGlassColorless>, scripts.helpers.CircuitTiers[1], <ore:blockGlassColorless>],
	 									[null, scripts.helpers.FrameTiers[0], null],
	 									[<ore:blockGlassColorless>, scripts.helpers.CircuitTiers[1], <ore:blockGlassColorless>],
	 									[null, <ore:ingotElectricalSteel>, <libvulpes:structuremachine>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in mekanism_EXTENDEDCRAFTING_T2 {
	recipes.remove(key.withAmount(1));
	scripts.helpers.createAdvancedCraftingRecipe(key, value, value[3][0], value[3][1], value[3][2], "", true);
}

//Mekanism Pipe Recipes
val mekanism_PipeCrafting = {
	<mekanism:transmitter>.withTag({tier: 0}) : <ore:ingotInvar>,
    <mekanism:transmitter:1>.withTag({tier: 0}) : <ore:plateIron>,
    <mekanism:transmitter:2>.withTag({tier: 0}) : <extendedcrafting:material:2>,
    <mekanism:transmitter:3>.withTag({tier: 0}) : <ore:ingotLead>,
    <mekanism:transmitter:6>.withTag({tier: 0}) : <ore:plateBronze>,
} as crafttweaker.item.IIngredient[crafttweaker.item.IItemStack];

for key, value in mekanism_PipeCrafting {
	recipes.remove(key);
	scripts.helpers.CreateAssemblyRecipe(key * 24, [null, null, null, <ore:ingotSteel>, value, <ore:ingotSteel>, null, null, null], 40, 2500);
	mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(key), scripts.helpers.stages.progression2.stage, key * 8, [[<ore:ingotSteel>, value, <ore:ingotSteel>]]);
}

//Change how Balloons are created
val mekanism_BalloonCrafting = {
	<mekanism:balloon:1> : <ore:dyeRed>,
	<mekanism:balloon:2> : <ore:dyeGreen>,
	<mekanism:balloon:3> : <ore:dyeBrown>,
	<mekanism:balloon:4> : <ore:dyeBlue>,
	<mekanism:balloon:5> : <ore:dyePurple>,
	<mekanism:balloon:6> : <ore:dyeCyan>,
	<mekanism:balloon:7> : <ore:dyeLightGray>,
	<mekanism:balloon:8> : <ore:dyeGray>,
	<mekanism:balloon:9> : <ore:dyePink>,
	<mekanism:balloon:10> : <ore:dyeLime>,
	<mekanism:balloon:11> : <ore:dyeYellow>,
	<mekanism:balloon:12> : <ore:dyeLightBlue>,
	<mekanism:balloon:13> : <ore:dyeMagenta>,
	<mekanism:balloon:14> : <ore:dyeOrange>,
	<mekanism:balloon:15> : <ore:dyeWhite>,
} as crafttweaker.oredict.IOreDictEntry[crafttweaker.item.IItemStack];

for key, value in mekanism_BalloonCrafting {
	recipes.remove(key);
	mods.recipestages.Recipes.addShapeless(scripts.helpers.createRecipeName(key) ~ "_" ~ value.name, scripts.helpers.stages.progression3.stage, key, [<mekanism:balloon:*>, value]);
	mods.mekanism.reaction.addRecipe(value, <liquid:plastic> * 500, <gas:helium> * 250, key, null, 0.0, 40);
}

print("### Mekanism Init Complete ###");
