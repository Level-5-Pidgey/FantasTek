#priority 501

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

//Industrial Mixer
function IndustrialMixerFactoryRecipe(recipeName as string, energyCost as int, craftingTime as int, fluidOutput1 as crafttweaker.liquid.ILiquidStack, fluidOutput2 as crafttweaker.liquid.ILiquidStack, inputFluid1 as crafttweaker.liquid.ILiquidStack, inputFluid2 as crafttweaker.liquid.ILiquidStack, inputFluid3 as crafttweaker.liquid.ILiquidStack, inputFluid4 as crafttweaker.liquid.ILiquidStack, itemInput1 as crafttweaker.item.IItemStack, itemInput2 as crafttweaker.item.IItemStack, itemOutput as crafttweaker.item.IItemStack)
{
	var RecipeToAdd = RecipeBuilder.newBuilder(recipeName, "industrial_mixer", craftingTime);
	//Possible Item Inputs
	if(!isNull(itemInput1)) { RecipeToAdd.addItemInput(itemInput1); }
	if(!isNull(itemInput2)) { RecipeToAdd.addItemInput(itemInput2); }

	//Possible Fluid Inputs
	if(!isNull(inputFluid1)) { RecipeToAdd.addFluidInput(inputFluid1); }
	if(!isNull(inputFluid2)) { RecipeToAdd.addFluidInput(inputFluid2); }
	if(!isNull(inputFluid3)) { RecipeToAdd.addFluidInput(inputFluid3); }
	if(!isNull(inputFluid4)) { RecipeToAdd.addFluidInput(inputFluid4); }

	//Energy Input
	RecipeToAdd.addEnergyPerTickInput(energyCost / craftingTime);

	//Fluid Output
	if(!isNull(fluidOutput1)) { RecipeToAdd.addFluidOutput(fluidOutput1); }
	if(!isNull(fluidOutput2)) { RecipeToAdd.addFluidOutput(fluidOutput2); }

	//Item Output
	if(!isNull(itemOutput)) { RecipeToAdd.addItemOutput(itemOutput); }
	RecipeToAdd.build();
}

//Mechanical Imbuer
function AddMechanicalImbuerRecipe(recipeName as string, item as crafttweaker.item.IItemStack, energyCost as int)
{
	var tickTime as int = energyCost / 500;
	if (tickTime < 20) { tickTime = 20; }

	var RecipeToAdd = RecipeBuilder.newBuilder(recipeName, "mechanical_imbuer", tickTime);
	RecipeToAdd.addItemInput(item);
	RecipeToAdd.addFluidInput(<liquid:elemental_mix> * 1000);
	RecipeToAdd.addItemOutput(item.withTag({ench: [{lvl: 1 as short, id: 72}]}));
	RecipeToAdd.addEnergyPerTickInput(energyCost / tickTime);
	RecipeToAdd.build();
}

//Item simplification for the assembly line
function simplifyItem(inputItem as crafttweaker.item.IIngredient) //as crafttweaker.item.IIngredient
{
    var materialsList as string[] = [
        "Vibranium",
        "Necrodermis",
        "Chrome",
        "Zinc",
        "Copper",
        "Tin",
        "Silver",
        "Lead",
        "Nickel",
        "Platinum",
        "Iridium",
        "Mithril",
        "Aluminium",
				"Aluminum",
        "Draconium",
        "Titanium",
        "Thorium",
        "Uranium",
        "Boron",
        "Lithium",
        "Magnesium",
        "Dilithium",
        "ElectricalSteel",
        "EnergeticAlloy",
        "VibrantAlloy",
        "RedstoneAlloy",
        "ConductiveIron",
        "PulsatingIron",
        "DarkSteel",
        "EndSteel",
        "ConstructionAlloy",
        "Neutronium",
        "Infinity",
        "Electrum",
        "Constantan",
        "Enderium",
        "Lumium",
        "Signalum",
        "Invar",
        "Bronze",
        "Manyullyn",
        "Iron",
        "Gold",
        "Diamond",
        "Redstone",
        "Lapis",
        "Emerald",
        "Coal",
        "Quartz",
        "Ardite",
        "Cobalt",
				"Steel",
    ];

    var partsList as int[string] = {
        "plate" : 2,
        "block" : 9,
        "densePlate" : 4,
        "gear" : 4,
        "rod" : 1,
        "stick" : 1,
        "dust" : 1,
    };

    var result = "";
    var resultCount = inputItem.amount;
    var inputCount = inputItem.amount;

    if(inputItem.items[0].ores.length > 0)
    {
        var itemOreDict = inputItem.items[0].ores[0].name;
				print("OreDict name is " ~ itemOreDict ~ " and count is " ~ inputCount);
        var itemMaterial = "";
        var itemPart = "";

				//Obtain the Material
        for material in materialsList
        {
            if(itemOreDict.contains(material))
            {
                itemMaterial = material;
								print("Material is " ~ itemMaterial);
            }
        }

        //Now obtain the part
        for part, partCount in partsList
        {
            if(itemOreDict.contains(part))
            {
                itemPart = part;
                resultCount = partCount as int;
								print("itemPart is " ~ itemPart ~ " count is " ~ resultCount);
            }
        }

        if (itemPart != "" && itemMaterial != "")
        {
					if(!oreDict.get("ingot" ~ itemMaterial).empty)
					{
							result = "ingot" ~ itemMaterial;
					}
					else if(!oreDict.get("gem" ~ itemMaterial).empty)
					{
							result = "gem" ~ itemMaterial;
					}
        }
    }

	print("SIMPLIFY : \"" ~ result ~ "\"");

    if (result != "")
    {
        var resultDict = oreDict.get(result);
        if (resultDict.items.length > 0)
        {
            var resultIngredient = resultDict * (inputCount * resultCount);
						print("Generated ingredient " ~ result ~ " with count of " ~ (inputCount * resultCount));
        }
        else
        {
						print("returned null");
            return null;
        }
    }
    else
    {
        print("Could not simplify " ~ inputItem.items[0].displayName);
        return null;
    }
}

//Assembly Line
function AssemblyLineRecipe(recipeName as string, energyCost as int, craftingTime as int, itemOutput as crafttweaker.item.IItemStack, inputItems as crafttweaker.item.IIngredient[])
{
	var RecipeToAdd = RecipeBuilder.newBuilder(recipeName, "assembly_line", craftingTime);
	var simplifiedItems = [] as crafttweaker.item.IIngredient[];
	var lubricantCount as int = 10;

	//Iterate through the recipe items and simplify them.
	for item in inputItems
	{
		//For every item in the input array, add 10mb of Lubricant to the required amount
		lubricantCount += 10;

		var simplifiedItem = simplifyItem(item);
		if(!isNull(simplifiedItem))
		{
			simplifiedItems += simplifiedItem;
		}
		else
		{
			simplifiedItems += item;
		}
		print("Updated simple items list and added " ~ item.commandString ~ ", count is " ~ simplifiedItems.length);
	}

	print("Finished looping through items");

	var finalItems as crafttweaker.item.IIngredient[] = [];

	if(simplifiedItems.length > 0)
	{
		finalItems += simplifiedItems[0];
	}
	else
	{
		print("SimpleItems has no contents");
	}

	//Now that all possible items have been simplified, get their count and add them as ingredients
	for simpleItem in simplifiedItems
	{
		//Update mode : 0  = no change, 1 = new item, 2 = update item
		var updateFinal as int = 0;
		var changeItem as crafttweaker.item.IIngredient = null;
		var changeIndex as int = 0;

		for i, finalItem in finalItems
		{
			if(!isNull(simpleItem.items) && simpleItem.items.length > 0)
			{
				if(finalItem.matches(simpleItem.items[0]))
				{
					//The item is already in the array of recipe requirements
					//Increase the amount necessary instead
					var finalAmount = finalItem.amount;
					var simpleAmount = simpleItem.amount;
					changeItem = finalItem * (finalAmount + simpleAmount);
					changeIndex = i;
					updateFinal = 2;
				}
				else
				{
					changeItem = simpleItem;
					updateFinal = 1;
				}
			}
			else
			{
				print("simpleItem.items is null or empty");
			}
		}

		if(updateFinal == 2)
		{
			finalItems[changeIndex] = changeItem;
		}
		else if (updateFinal == 1)
		{
			finalItems += changeItem;
		}
	}

	//After creating a final array of items, now add them to the recipe.
	for finalItem in finalItems
	{
		var firstInput = finalItem.items[0];
		if (firstInput.ores.length > 0)
		{
			RecipeToAdd.addItemInput(firstInput.ores[0], firstInput.amount);
		}
		else
		{
			RecipeToAdd.addItemInput(firstInput);
		}
	}

	RecipeToAdd.addFluidInput(<liquid:lubricant> * lubricantCount);
	RecipeToAdd.addItemOutput(itemOutput);
	RecipeToAdd.build();
}
