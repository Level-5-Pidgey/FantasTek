#priority 111

import crafttweaker.liquid.ILiquidStack;
import mods.modularmachinery.RecipeBuilder;
import crafttweaker.data.IData;

//Script to easily make recipes for modular machinery.
//Ore Washing Factory
function AddOreWashingRecipe(ore as string, oreTier as int)
{
	var oreBlock = oreDict.get("ore" ~ ore);
	var oreDouble = oreDict.get("denseOre" ~ ore);
	val oreFluidData = {Ore: "ore" ~ ore} as IData;

	//Standard Ore
	if(!oreBlock.empty)
	{
		var RecipeToAdd = RecipeBuilder.newBuilder("orewashing_" ~ ore, "ore_washing_factory", 60);
		RecipeToAdd.addItemInput(oreBlock);
		RecipeToAdd.addFluidInput(<liquid:meat> * 200);
		RecipeToAdd.addEnergyPerTickInput(75 * (oreTier + 1));

		//Create IData tag for ore type
		RecipeToAdd.addFluidOutput(<liquid:if.ore_fluid_raw>.withTag(oreFluidData) * 150);
		RecipeToAdd.build();
	}
	else
	{
		print("Failed to add Multiblock Ore Washing Factory Recipe for " ~ ore ~ " as no ore block was found.");
	}

	//Dense Ore
	if(!oreDouble.empty)
	{
		var RecipeToAdd = RecipeBuilder.newBuilder("orewashing_" ~ ore ~ "_double", "ore_washing_factory", 120);
		RecipeToAdd.addItemInput(oreDouble);
		RecipeToAdd.addFluidInput(<liquid:meat> * 400);
		RecipeToAdd.addEnergyPerTickInput(150 * (oreTier + 1));

		//Create IData tag for ore type
		RecipeToAdd.addFluidOutput(<liquid:if.ore_fluid_raw>.withTag(oreFluidData) * 300);
		RecipeToAdd.build();
	}
}

//Chemical Ore Factory
function ChemicalOreFactoryRecipe(ore as string, oreTier as int)
{
	var oreBlock = oreDict.get("ore" ~ ore);
	var oreDouble = oreDict.get("denseOre" ~ ore);
	var oreCrystal = oreDict.get("crystal" ~ ore);

	//Standard Ore
	if(!oreBlock.empty & !oreCrystal.empty)
	{
		var RecipeToAdd = RecipeBuilder.newBuilder("chemicalorefactory_" ~ ore, "chemical_ore_factory", 40);
		RecipeToAdd.addItemInput(oreBlock);
		RecipeToAdd.addGasInput("sulfuricacid", 100);
		RecipeToAdd.addFluidInput(<liquid:water> * 200);
		RecipeToAdd.addEnergyPerTickInput(120 * (oreTier + 1));

		RecipeToAdd.addItemOutput(oreCrystal.firstItem * 5);
		RecipeToAdd.build();
	}
	else
	{
		print("Failed to add Chemical Ore Factory Recipe for " ~ ore ~ " as no ore block or Mekanism Crystal was found.");
	}

	//Dense Ore
	if(!oreDouble.empty & !oreCrystal.empty)
	{
		var RecipeToAdd = RecipeBuilder.newBuilder("chemicalorefactory_" ~ ore ~ "_double", "chemical_ore_factory", 80);
		RecipeToAdd.addItemInput(oreDouble);
		RecipeToAdd.addGasInput("sulfuricacid", 200);
		RecipeToAdd.addFluidInput(<liquid:water> * 400);
		RecipeToAdd.addEnergyPerTickInput(240 * (oreTier + 1));

		RecipeToAdd.addItemOutput(oreCrystal.firstItem * 10);
		RecipeToAdd.build();
	}
}

//Ember Assembly Plant
function AddEmberAssemblyRecipe(recipeName as string, item as crafttweaker.item.IItemStack, input as crafttweaker.item.IItemStack[], emberCost as double)
{
	var RecipeToAdd = RecipeBuilder.newBuilder(recipeName, "ember_assembly_plant", (5 * (emberCost / 20)) as int);
	for item in input
	{
		RecipeToAdd.addItemInput(item);
	}
	RecipeToAdd.addEmberInput(emberCost);
	RecipeToAdd.addItemOutput(item);
	RecipeToAdd.build();
}
