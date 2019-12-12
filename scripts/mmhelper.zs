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
