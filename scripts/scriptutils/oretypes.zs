
print("~~~ Begin Dense/Poor Ore Crafting Init ~~~");

//Simplify oreDict for Dense Lapis Lazuli Ore
val lapisDenseOres =
[
	<contenttweaker:sub_block_holder_2:15>,
	<contenttweaker:sub_block_holder_5:6>,
	<contenttweaker:sub_block_holder_4:3>
] as crafttweaker.item.IItemStack[];

for ore in lapisDenseOres
{
	<ore:denseOreLapis>.add(ore);
}

//Simplify oreDict for Dense Lapis Lazuli Ore
val lapisPoorOres =
[
	<contenttweaker:sub_block_holder_10:8>,
	<contenttweaker:sub_block_holder_5:5>,
	<contenttweaker:sub_block_holder_5:11>
] as crafttweaker.item.IItemStack[];

for ore in lapisPoorOres
{
	<ore:poorOreLapis>.add(ore);
}

//Function to give dense ores crafting recipes
function denseOreCrafting(material as string)
{
	//Variables
	val regularOre = "ore" ~ material;
	val denseOre = "denseOre" ~ material;

	if(!oreDict.get(denseOre).empty)
	{
		for ore in oreDict.get(denseOre).items
		{
			//Furnace
			if(!oreDict.get(regularOre).empty)
			{
				furnace.addRecipe(oreDict.get(regularOre).firstItem * 3, ore, 0.0);
				print("Added furnace recipe for dense " ~ material ~ " ore.");
			}
			else
			{
				print("Could not add furnace recipe for " ~ material ~ " ore as no regular oreDict was found.");
			}
		}
	}
}

//Function to give poor ores crafting recipes
function poorOreCrafting(material as string)
{
	//Variables
	val smallDust = "dustSmall" ~ material;
	val nugget = "nugget" ~ material;
	val poorOre = "poorOre" ~ material;

	//Loop through all varieties of poor ore
	if(!oreDict.get(poorOre).empty)
	{
		for ore in oreDict.get(poorOre).items
		{
			//Furnace recipe with poor ore
			if(!oreDict.get(smallDust).empty)
			{
				furnace.addRecipe(oreDict.get(smallDust).firstItem * 2, ore, 0.1);
			}
			else
			{
				if(!oreDict.get(nugget).empty)
				{
					furnace.addRecipe(oreDict.get(nugget).firstItem * 2, ore, 0.1);
				}
				else
				{
					print("Could not create poor ore smelting recipe for " ~ material ~ " as no nuggets or small dust oreDict was found.");
				}
			}

			//Factorizer -- Combine 2 Poor Ore into 1 Regular
			if(!oreDict.get("ore" ~ material).empty)
			{
				for ore1 in oreDict.get("ore" ~ material).items
				{
					mods.thermalexpansion.Factorizer.addRecipeCombine(ore * 2, ore1);
				}
			}
			else
			{
				print("Could not create poor ore factorizer recipe for " ~ material ~ " as no oreDict was found.");
			}
		}
	}



}

val denseAndPoorOresList =
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
	"Iron",
	"Gold",
	"Diamond",
	"Redstone",
	"Lapis",
	"Emerald",
	"Coal",
	"Quartz"
] as string[];

for ore in denseAndPoorOresList
{
	//Make Dense ore crafting recipes for each ore material
	denseOreCrafting(ore);

	//Make Poor ore crafting recipes for each ore material
	poorOreCrafting(ore);
}

print("### Dense/Poor Ore Crafting Init Complete ###");
