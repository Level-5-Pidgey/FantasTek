
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
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stoneLimestone>, /*Output 1*/ <ore:clay>.firstItem,  /*Output 2*/ <ore:dustTinyQuartz>.firstItem * 2, 33, /*Output 3*/ <ore:dustMagnesium>.firstItem, 33]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stoneGranite>, /*Output 1*/ <ore:dustVilliaumite>.firstItem, 50, /*Output 2*/ <ore:dustFluorite>.firstItem, 50,/*Output 3*/ <ore:dustTinyQuartz>.firstItem * 3, 33]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stoneAndesite>, /*Output 1*/ <ore:dustSalt>.firstItem, 80,  /*Output 2*/ <ore:dustSmallLithium>.firstItem * 2, 33,/*Output 3*/ <ore:dustSilicon>.firstItem, 33]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stoneDiorite>, /*Output 1*/ <ore:dustBeryllium>.firstItem, 60, /*Output 2*/ <ore:dustSmallQuartz>.firstItem * 2, 40, /*Output 3*/ <ore:dustSilicon>.firstItem, 33]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stoneBrimstone>, /*Output 1*/ <ore:dustBlaze>.firstItem, 33, /*Output 2*/ <ore:gravel>.firstItem, /*Output 3*/ <ore:dustSulfur>.firstItem, 15]);
mods.nuclearcraft.rock_crusher.addRecipe([/*Input Item*/ <ore:stonePermafrost>, /*Output 1*/ <forestry:crafting_material:5>, 50, /*Output 2*/ <ore:gravel>.firstItem, /*Output 3*/ <ore:dustNiter>.firstItem, 15]);
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
	<nuclearcraft:manufactory_idle>
									:	[[null, <thermalfoundation:material:657>, null],
	 									[<ore:gearSteel>, scripts.helpers.FrameTiers[1], <ore:gearSteel>],
	   									[null, scripts.helpers.CircuitTiers[0], null],
										[null, <ore:ingotCopper>, <ore:plateLead>]],
	<nuclearcraft:rock_crusher_idle>
									:	[[<ore:plateSteel>, scripts.helpers.MotorTiers[1], <ore:plateSteel>],
										[<minecraft:piston>, scripts.helpers.FrameTiers[1], <minecraft:piston>],
	  									[<ore:plateSteel>, <thermalfoundation:material:656>, <ore:plateSteel>],
										[null, <ore:ingotManyullyn>, scripts.helpers.BatteryTiers[1]]],
	<nuclearcraft:alloy_furnace_idle>
									:	[[<ore:plateLead>, scripts.helpers.CircuitTiers[1], <ore:plateLead>],
										[<ore:plateLead>, scripts.helpers.FrameTiers[0], <ore:plateLead>],
										[<ore:gearLead>, scripts.helpers.MotorTiers[1], <ore:gearLead>],
										[null, null, <ore:ingotNickel>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in magneticraft_EXTENDEDCRAFTING_T2 {
	recipes.remove(key.withAmount(1));
	scripts.helpers.createAdvancedCraftingRecipe(key, value, value[3][0], value[3][1], value[3][2], "", true);
}

print("### NuclearCraft Init Complete ###");
