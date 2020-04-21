#priority 111

import crafttweaker.liquid.ILiquidStack;
import mods.modularmachinery.RecipeBuilder;
import crafttweaker.data.IData;

//Script to easily make recipes for modular machinery.
//Ore Washing Factory
function AddOreWashingRecipe(ore as string, oreTier as int)
{
	var oreString = "ore" ~ ore;
	var OreBlock = oreDict.get(oreString);
	if(!OreBlock.empty)
	{
		var RecipeToAdd = RecipeBuilder.newBuilder("orewashing_" ~ ore, "ore_washing_factory", 80);
		RecipeToAdd.addItemInput(OreBlock);
		RecipeToAdd.addFluidInput(<liquid:meat> * 200);
		RecipeToAdd.addEnergyPerTickInput(75 * (oreTier + 1));

		//Create IData tag for ore type
		val oreFluidData = {Ore: oreString} as IData;
		RecipeToAdd.addFluidOutput(<liquid:if.ore_fluid_raw>.withTag(oreFluidData) * 150);
		RecipeToAdd.build();
	}
	else
	{
		print("Failed to add Multiblock Ore Washing Factory Recipe for " ~ ore ~ " as no ore block was found.");
	}
}

//Chemical Ore Factory
function ChemicalOreFactoryRecipe(ore as string, oreTier as int)
{
	var oreString = "ore" ~ ore;
	var OreBlock = oreDict.get(oreString);
	var oreCrystal = oreDict.get("crystal" ~ ore);

	if(!OreBlock.empty & !oreCrystal.empty)
	{
		var RecipeToAdd = RecipeBuilder.newBuilder("chemicalorefactory_" ~ ore, "chemical_ore_factory", 160);
		RecipeToAdd.addItemInput(OreBlock);
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
}

//Ember Assembly Plant
function AddEmberAssemblyRecipe(recipeName as string, item as crafttweaker.item.IItemStack, input as crafttweaker.item.IItemStack[], emberCost as double)
{
	var RecipeToAdd = RecipeBuilder.newBuilder(recipeName, "ember_assembly_plant", (20 * (emberCost / 10)) as int);
	for item in input
	{
		RecipeToAdd.addItemInput(item);
	}
	RecipeToAdd.addEmberInput(emberCost);
	RecipeToAdd.addItemOutput(item);
	RecipeToAdd.build();
}
