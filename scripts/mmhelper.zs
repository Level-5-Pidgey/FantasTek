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

//Store the Mechanical Imbuement IData for use elsewhere
static mechImbuementData as crafttweaker.data.IData = {ench: [{lvl: 1 as short, id: 72}]};

//Mechanical Imbuer
function AddMechanicalImbuerRecipe(recipeName as string, item as crafttweaker.item.IItemStack, energyCost as int)
{
	var tickTime as int = energyCost / 500;
	if (tickTime < 20) { tickTime = 20; }

	var RecipeToAdd = RecipeBuilder.newBuilder(recipeName, "mechanical_imbuer", tickTime);
	RecipeToAdd.addItemInput(item);
	RecipeToAdd.addFluidInput(<liquid:elemental_mix> * 1000);
	RecipeToAdd.addItemOutput(item.withTag(mechImbuementData));
	RecipeToAdd.addEnergyPerTickInput(energyCost / tickTime);
	RecipeToAdd.build();
}

//Item simplification for the assembly line
function simplifyItem(inputItem as crafttweaker.item.IIngredient) as crafttweaker.item.IIngredient
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

    if (result != "")
    {
        var resultDict = oreDict.get(result);
        if (resultDict.items.length > 0)
        {
            var resultIngredient as crafttweaker.item.IIngredient = resultDict.firstItem.withAmount(inputCount * resultCount);
			print("Generated ingredient " ~ result ~ " with count of " ~ (inputCount * resultCount));
			return resultIngredient;
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
	//Additionally, for every item in the input array, add 10mb of Lubricant to the required amount
	for item in inputItems
	{
		var simplifiedItem = simplifyItem(item);
		if(!isNull(simplifiedItem))
		{
			simplifiedItems += simplifiedItem;
			lubricantCount += (10 * simplifiedItem.amount);
		}
		else
		{
			simplifiedItems += item;
			lubricantCount += (10 * item.amount);
		}
	}


	//After creating a final array of items, now add them to the recipe.
	for i, finalItem in simplifiedItems
	{
		if(finalItem.items[0].ores.length > 0)
		{
			RecipeToAdd.addItemInput(finalItem.items[0].ores[0], finalItem.amount);
		}
		else
		{
			RecipeToAdd.addItemInput(finalItem.items[0].withAmount(finalItem.amount));
		}
	}

	RecipeToAdd.addEnergyPerTickInput(energyCost / craftingTime);
	RecipeToAdd.addFluidInput(<liquid:lubricant> * lubricantCount);
	RecipeToAdd.addItemOutput(itemOutput);
	RecipeToAdd.build();
}
