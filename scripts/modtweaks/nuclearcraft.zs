
//https://raw.githubusercontent.com/turbodiesel4598/NuclearCraft/master/craftTweaker.txt

print("~~~ Begin NuclearCraft Init ~~~");

//Change earlygame gelatin production
mods.tconstruct.Melting.removeRecipe(<liquid:gelatin>);
mods.tconstruct.Melting.addRecipe(<liquid:gelatin> * 36, <minecraft:dye:15>, 90);

//Early game cocoa butter production
mods.inworldcrafting.FluidToFluid.transform(<liquid:cocoa_butter>, <liquid:water>, [<nuclearcraft:ground_cocoa_nibs> * 10]);
mods.appliedenergistics2.Grinder.addRecipe(<nuclearcraft:ground_cocoa_nibs>, <nuclearcraft:roasted_cocoa_beans>, 3);

//Geiger Counter Recipe
recipes.remove(<nuclearcraft:geiger_counter>);
mods.forestry.Carpenter.addRecipe(<nuclearcraft:geiger_counter>, [[<ore:ingotElectrotineAlloy>, <ore:ingotIron>, <ore:ingotIron>],[<ore:ingotElectrotineAlloy>, <ore:ingotGold>, <ore:ingotGold>],[<ore:dustRedstone>, <ore:ingotIron>, <ore:ingotIron>]], 160, <liquid:water> * 500);

//Alloy Smelter Recipes
var ncAlloySmelter =
{
	<enderio:item_alloy_endergy_ingot> : [<ore:ingotIron>, <contenttweaker:coke_dust>],
	<enderio:item_alloy_ingot:3> : [<ore:ingotIron>, <ore:dustRedstone> * 8],
	<enderio:item_alloy_ingot:1> : [<nuclearcraft:compound:2>, <ore:dustElectrum>],
} as crafttweaker.item.IIngredient[][crafttweaker.item.IItemStack];

for item, inputArray in ncAlloySmelter
{
    mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(item.withAmount(1));
	mods.nuclearcraft.alloy_furnace.addRecipe(inputArray[0], inputArray[1], item);
}

//NC Rock Crusher, Crush all biome Variant Stone
mods.nuclearcraft.rock_crusher.removeAllRecipes();
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:soulSand>, /*Output 1*/ <ore:dustSmallSulfur>.firstItem * 3, 50, 1, /*Output 2*/ <ore:dustArsenic>.firstItem, 60, /*Output 3*/ <ore:dustTinyQuartz>.firstItem * 3, 33]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stoneJasper>, /*Output 1*/ <ore:dustSilicon>.firstItem, 25, /*Output 2*/ <ore:dustTinyQuartz>.firstItem, 66, /*Output 3*/ <ore:dustTinySulfur>.firstItem, 50]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stoneSlate>, /*Output 1*/ <ore:clay>.firstItem * 4, 66, 2, /*Output 2*/ <ore:dustSmallQuartz>.firstItem, 40, /*Output 3*/ <ore:dustTinySulfur>.firstItem, 33]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stoneBasalt>, /*Output 1*/ <ore:dustBeryllium>.firstItem, 60, /*Output 2*/ <ore:dustCarobbiite>.firstItem, 60, /*Output 3*/ <ore:dustSmallAluminum>.firstItem * 2, 30]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <appliedenergistics2:sky_stone_block>, /*Output 1*/ <appliedenergistics2:material:45> * 2, /*Output 2*/ <ore:dustZirconium>.firstItem, 75, /*Output 3*/ <ore:dustBeryllium>.firstItem, 33]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stoneLimestone>, /*Output 1*/ <ore:clay>.firstItem,  /*Output 2*/ <minecraft:dye:15> * 2, 60, /*Output 3*/ <ore:dustSmallIron>.firstItem, 40]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stoneGranite>, /*Output 1*/ <ore:dustVilliaumite>.firstItem, 50, /*Output 2*/ <ore:dustFluorite>.firstItem, 50,/*Output 3*/ <ore:dustRhodochrosite>.firstItem, 15]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stoneAndesite>, /*Output 1*/ <ore:dustSalt>.firstItem, 80,  /*Output 2*/ <ore:dustSmallLithium>.firstItem * 2, 33,/*Output 3*/ <ore:dustSilicon>.firstItem, 33]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stoneDiorite>, /*Output 1*/ <ore:dustBeryllium>.firstItem, 60, /*Output 2*/ <ore:dustSmallQuartz>.firstItem * 2, 40, /*Output 3*/ <ore:dustSilicon>.firstItem, 33]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stoneBrimstone>, /*Output 1*/ <ore:dustBlaze>.firstItem, 33, /*Output 2*/ <ore:gravel>.firstItem, /*Output 3*/ <ore:dustSulfur>.firstItem, 8]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stonePermafrost>, /*Output 1*/ <forestry:crafting_material:5>, 50, /*Output 2*/ <ore:gravel>.firstItem, /*Output 3*/ <ore:dustNiter>.firstItem, 8]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stoneMarble>, /*Output 1*/ <ore:clay>.firstItem * 2, /*Output 2*/ <biomesoplenty:white_sand>, 50, /*Output 3*/ <ore:dustSmallIron>.firstItem, 30]);

//Remove Lithium Ion Cell Recipe
recipes.remove(<nuclearcraft:lithium_ion_cell>);

//Assembly Line Recipe Changes
val nuclearcraftRecipes_ASSEMBLY = {
	<nuclearcraft:lithium_ion_cell>.withTag({maxTransfer: 200, capacity: 40000, energy: 0}) : [null, <ore:dustCobalt>, null, <ore:ingotSteel>, <ore:ingotLithium>, <ore:ingotSteel>, <ore:ingotSteel>, <ore:ingotLithium>, <ore:ingotSteel>],
  <nuclearcraft:part:8> * 2 : [<ore:ingotSteel>, <ore:ingotSteel>, null, <ore:plateAluminium>, <ore:plateAluminium>, <projectred-core:resource_item:400>, <ore:ingotSteel>, <ore:ingotSteel>, null],
} as crafttweaker.item.IIngredient[][crafttweaker.item.IItemStack];

for key, value in nuclearcraftRecipes_ASSEMBLY {
  recipes.remove(key.withAmount(1));
  scripts.helpers.CreateAssemblyRecipe(key, value, 60, 4000);
}

//Extended Crafting Recipes (T2 Table)
val magneticraft_EXTENDEDCRAFTING_T2 = {
	//null
	//								:	[[null, null, null],
	//									[null, null, null],
	//  								[null, null, null],
	//									[null, null, null]],
	<nuclearcraft:melter_idle>
									:	[[<ore:ingotBrickNether>, <ore:coilGold>, <ore:ingotBrickNether>],
	 									[<ore:blockGlass>, <enderio:item_material:1>, <ore:blockGlass>],
	   									[<ore:gearBronze>, scripts.helpers.CircuitTiers[1], <ore:gearBronze>],
										[<ore:ingotNickel>, <ore:ingotNickel>, <ore:plateNickel>]],
	<nuclearcraft:chemical_reactor_idle>
									:	[[<ore:stickSteel>, scripts.helpers.CircuitTiers[2], <ore:stickSteel>],
										[scripts.helpers.MotorTiers[1], <enderio:item_material:1>, scripts.helpers.MotorTiers[1]],
		  								[<ore:plateSteel>, scripts.helpers.BatteryTiers[1], <ore:plateSteel>],
										[null, <ore:plateSteel>, <ore:stickSteel>]],
	<nuclearcraft:ingot_former_idle>
									:	[[<ore:stickSteel>, <minecraft:hopper>, <ore:stickSteel>],
										[<ore:plateConstantan>, <enderio:item_material:1>, <ore:plateConstantan>],
		  								[<ore:stickSteel>, scripts.helpers.BatteryTiers[1], <ore:stickSteel>],
										[null, null, <ore:plateConstantan>]],
	<nuclearcraft:dissolver_idle>
									:	[[<ore:plateSteel>, <minecraft:hopper>, <ore:plateSteel>],
										[ <ore:plateLapis>, <enderio:item_material:1>,  <ore:plateLapis>],
		  								[scripts.helpers.BatteryTiers[1], scripts.helpers.MotorTiers[1], scripts.helpers.CircuitTiers[2]],
										[null, <ore:stickSilver>, <ore:plateSteel>]],
	<nuclearcraft:manufactory_idle>
									:	[[null, <thermalfoundation:material:657>, null],
	 									[<ore:gearSteel>, scripts.helpers.FrameTiers[1], <ore:gearSteel>],
	   									[null, scripts.helpers.CircuitTiers[1], null],
										[<ore:ingotCopper>, <ore:ingotCopper>, <ore:plateSteel>]],
	<nuclearcraft:rock_crusher_idle>
									:	[[<ore:plateSteel>, scripts.helpers.MotorTiers[1], <ore:plateSteel>],
										[<minecraft:piston>, scripts.helpers.FrameTiers[1], <minecraft:piston>],
	  									[<ore:plateSteel>, <thermalfoundation:material:656>, <ore:plateSteel>],
										[null, <ore:ingotManyullyn>, scripts.helpers.BatteryTiers[1]]],
	<nuclearcraft:alloy_furnace_idle>
									:	[[<ore:plateLead>, scripts.helpers.CircuitTiers[1], <ore:plateLead>],
										[<ore:plateLead>, scripts.helpers.FrameTiers[0], <ore:plateLead>],
										[<ore:gearLead>, scripts.helpers.MotorTiers[1], <ore:gearLead>],
										[null, <tconstruct:materials:2>, <ore:ingotBrickNether>]],
	<nuclearcraft:infuser_idle>
									:	[[null, <minecraft:bucket>, null],
										[scripts.helpers.CircuitTiers[4], <enderio:item_material:66>, scripts.helpers.CircuitTiers[4]],
										[<ore:gearEnderium>, scripts.helpers.MotorTiers[2], <ore:gearEnderium>],
										[<ore:ingotBrass>, <ore:ingotBrass>, <ore:blockGlassHardened>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in magneticraft_EXTENDEDCRAFTING_T2 {
	recipes.remove(key.withAmount(1));
	scripts.helpers.createAdvancedCraftingRecipe(key, value, value[3][0], value[3][1], value[3][2], "", true);
}

//Change Dimensional Blend Recipe
recipes.remove(<nuclearcraft:compound:8>);
mods.recipestages.Recipes.addShapeless(scripts.helpers.createRecipeName(<nuclearcraft:compound:8>), scripts.helpers.stages.progression2.stage, <nuclearcraft:compound:8>, [<ore:shulkerShell>, <ore:endstone>, <ore:endstone>, <ore:endstone>, <ore:endstone>, <ore:endstone>, <ore:endstone>, <ore:endstone>, <ore:endstone>]);

//Chemical Reactor Recipe Changes
mods.nuclearcraft.chemical_reactor.removeRecipeWithInput([<liquid:sulfuric_acid> * 1000, <liquid:ethene> * 1000]);
mods.nuclearcraft.chemical_reactor.removeRecipeWithInput([<liquid:carbon_monoxide> * 1000, <liquid:hydrogen> * 2000]);
mods.nuclearcraft.chemical_reactor.removeRecipeWithInput([<liquid:methanol> * 1000, <liquid:hydrofluoric_acid> * 1000]);
mods.nuclearcraft.chemical_reactor.removeRecipeWithInput([<liquid:fluoromethane> * 1000, <liquid:koh> * 666]);
mods.nuclearcraft.chemical_reactor.removeRecipeWithInput([<liquid:fluoromethane> * 1000, <liquid:naoh> * 666]);
mods.nuclearcraft.chemical_reactor.removeRecipeWithInput([<liquid:sugar> * 144, <liquid:water> * 1000]);
mods.nuclearcraft.chemical_reactor.addRecipe([<liquid:bio.ethanol> * 1000, <liquid:sulfuric_acid> * 1000, <liquid:ethene> * 1000, <liquid:sulfur_trioxide> * 250, 0.5]);

//Melter Ore Processing Tooltip
<nuclearcraft:melter_idle>.addTooltip(scripts.helpers.createTierTooltip("Processes up to Tier ", 2, false, " Ores, with a 3.0x output rate."));

//Upgrade Industrial Mixer to NC Melter
mods.extendedcrafting.TableCrafting.addShaped(0, <nuclearcraft:melter_idle>, [[<ore:plateNickel>, <ore:plateDarkSteel>, <ore:plateNickel>], [<ore:plateDarkSteel>, <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:industrial_mixer"}), <ore:plateDarkSteel>], [<ore:plateNickel>, scripts.helpers.CircuitTiers[2], <ore:plateNickel>]]);

//Upgrade Arc Furnace to NC Alloy Furnace
mods.extendedcrafting.TableCrafting.addShaped(0, <nuclearcraft:alloy_furnace_idle>, [
	[<ore:plateLead>, <ore:gearElectrum>, <ore:plateLead>],
	[<ore:plateLead>, <advancedrocketry:arcfurnace>, <ore:plateLead>],
	[<ore:ingotLead>, scripts.helpers.MotorTiers[1], <ore:ingotLead>]
]);

//Upgrade Fluid Tranasposer to NC Fluid Infuser
mods.extendedcrafting.TableCrafting.addShaped(0, <nuclearcraft:infuser_idle>, [
	[<ore:blockGlassHardened>, <ore:gearEnderium>, <ore:blockGlassHardened>],
	[scripts.helpers.CircuitTiers[4], <thermalexpansion:machine:8>, scripts.helpers.CircuitTiers[4]],
	[<ore:plateEndSteel>, <ore:gearEnderium>, <ore:plateEndSteel>]
]);

//Tier Tooltips for NC machines
<nuclearcraft:alloy_furnace_idle>.addTooltip(scripts.helpers.createTierTooltip("Alloy Furnace Tier ", 2, false, "."));
<nuclearcraft:manufactory_idle>.addTooltip(scripts.helpers.createTierTooltip("Crusher Tier ", 3, false, "."));
<nuclearcraft:manufactory_idle>.addTooltip("Not designed to crush ores!");
<nuclearcraft:melter_idle>.addTooltip(scripts.helpers.createTierTooltip("Melter Tier ", 4, false, "."));
<nuclearcraft:infuser_idle>.addTooltip(scripts.helpers.createTierTooltip("Fluid Injector Tier ", 4, false, "."));

//Mechanical Imbuement for Motor
scripts.mmhelper.AddMechanicalImbuerRecipe(scripts.helpers.createRecipeName(scripts.helpers.MotorTiers[1]), scripts.helpers.MotorTiers[1], 50000);

//Remove some Manufactory Recipes
mods.nuclearcraft.manufactory.removeRecipeWithOutput(<nuclearcraft:part:6>);
mods.nuclearcraft.manufactory.removeRecipeWithOutput(<thermalfoundation:material:772> * 2);
mods.nuclearcraft.manufactory.removeRecipeWithOutput(<libvulpes:productingot:3>);

//Remove Enderium Creation Nuclearcraft-style
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput([<nuclearcraft:alloy:9> * 4]);
mods.nuclearcraft.infuser.removeRecipeWithOutput([<ore:ingotEnderium>.firstItem]);

//Fluid Dict Mek Gasses (in fluid form) and NC Fluid Gasses
mods.industrialforegoing.FluidDictionary.add("liquidoxygen", "oxygen", 1.0);
mods.industrialforegoing.FluidDictionary.add("liquidhydrogen", "hydrogen", 1.0);

//Mechanically Embue Advanced Motor
scripts.mmhelper.AddMechanicalImbuerRecipe(scripts.helpers.createRecipeName(scripts.helpers.MotorTiers[1]), scripts.helpers.MotorTiers[1], 75000);

print("### NuclearCraft Init Complete ###");
