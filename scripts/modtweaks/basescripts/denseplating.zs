
print("~~~ Begin Dense Plate Management Init ~~~");

<ore:densePlatingLapis>.add(<contenttweaker:material_part:692>); //Simplify oreDict for Lapis Lazuli Dense Plating
<ore:blockSheetmetalLapis>.add(<contenttweaker:sub_block_holder_7:8>); //Simplify oreDict for Lapis Lazuli Sheet Metal Block

//Function for generating Dense Plating Recipes
function densePlateRecipeCreate(densePlateDict as crafttweaker.item.IItemStack, craftingMaterial as string)
{
	val plate = oreDict.get("plate" ~ craftingMaterial);
	val block = oreDict.get("block" ~ craftingMaterial);
	val ingot = oreDict.get("ingot" ~ craftingMaterial);
	val nugget = oreDict.get("nugget" ~ craftingMaterial);
	val gem = oreDict.get("gem" ~ craftingMaterial);

	if (!plate.empty)
	{
		if (!nugget.empty)
		{
			//Craft using plates and nuggets
			recipes.addShaped("densePlate_" ~ craftingMaterial ~ "_plate", densePlateDict, [[nugget, plate, nugget], [nugget, plate, nugget], [nugget, plate, nugget]]);
		}
		else
		{
			//Craft with plates only
			recipes.addShaped("densePlate_" ~ craftingMaterial ~ "_plate", densePlateDict, [[null, plate, null], [plate, plate, plate], [null, plate, null]]);
		}
	}
	else if (!block.empty)
	{
		if (!ingot.empty)
		{
			//Craft using blocks and ingots
			recipes.addShaped("densePlate_" ~ craftingMaterial ~ "_block", densePlateDict, [[ingot, block, ingot],[ingot, null, ingot], [ingot, block, ingot]]);
		}
		else if (!gem.empty)
		{
			//Craft using blocks and ingots
			recipes.addShaped("densePlate_" ~ craftingMaterial ~ "_block", densePlateDict, [[gem, block, gem],[gem, null, gem], [gem, block, gem]]);
		}
		else
		{
			//Craft using blocks
			recipes.addShaped("densePlate_" ~ craftingMaterial ~ "_block", densePlateDict, [[null, block, null], [block, null, block], [null, block, null]]);
		}
	}
	else
	{
		print("Could not create plate recipe with material " ~ craftingMaterial);
	}
}

function densePlateCrafting(material as string)
{
	//Combining string
	val densePlate = "densePlating" ~ material; //The ore/material used to obtain the ingot from the rocky chunk
	val plate = "plate" ~ material;
	val block = "block" ~ material;
	val gem = "gem" ~ material;

	//If an oreDict for the dense plate exists, create recipes for it
	if (!oreDict.get(densePlate).empty)
	{
		val densePlating = oreDict.get(densePlate).firstItem;

		if(!oreDict.get(plate).empty)
		{
			densePlateRecipeCreate(densePlating, material);
		}
		else if(!oreDict.get(block).empty)
		{
			densePlateRecipeCreate(densePlating, material);
		}
		else if(!oreDict.get(gem).empty)
		{
			densePlateRecipeCreate(densePlating, material);
		}
	}
}

function sheetmetalCrafting(material as string)
{
	//Variables
	val densePlating = oreDict.get("densePlating" ~ material).firstItem;
	val sheetmetalBlock = oreDict.get("blockSheetmetal" ~ material).firstItem;

	//Crafting Table
	recipes.addShaped("sheetmetalBlock_" ~ material, sheetmetalBlock * 4, [[densePlating, densePlating, densePlating],[densePlating, null, densePlating], [densePlating, densePlating, densePlating]]);

	//Factorizer
	mods.thermalexpansion.Factorizer.addRecipeSplit(sheetmetalBlock , densePlating * 2);
	mods.thermalexpansion.Factorizer.addRecipeCombine(densePlating * 2, sheetmetalBlock);
}

val densePlateMaterials =
[
	"Vibranium",
	"Yellorium",
	"Thorium",
	"Necrodermis",
	"Chrome",
	"Zinc",
	"Uranium",
	"Copper",
	"Tin",
	"Silver",
	"Lead",
	"Aluminum",
	"Nickel",
	"Platinum",
	"Iridium",
	"Mithril",
	"Aluminium",
	"Steel",
	"ElectricalSteel",
	"EnergeticAlloy",
	"VibrantAlloy",
	"RedstoneAlloy",
	"ConductiveIron",
	"PulsatingIron",
	"DarkSteel",
	"Soularium",
	"EndSteel",
	"ConstructionAlloy",
	"Neutronium",
	"Infinity",
	"Iron",
	"Gold",
	"Diamond",
	"Redstone",
	"Lapis",
	"Emerald",
	"Coal",
	"Quartz",
	"Electrum",
	"Constantan",
	"Enderium",
	"Lumium",
	"Signalum",
	"Invar",
	"Bronze"
] as string[];

for plateMaterial in densePlateMaterials
{
	//Create Crafting Recipe for Dense Plating
	densePlateCrafting(plateMaterial);

	//Create Crafting Recipe for Sheetmetal
	sheetmetalCrafting(plateMaterial);
}

print("### Dense Plate Management Init Complete ###");
