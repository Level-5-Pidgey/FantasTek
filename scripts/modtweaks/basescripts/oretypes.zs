
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

//Function to give poor ores crafting recipes
function poorOreCrafting(material as string)
{
	//Variables
	var poorOre = "poorOre" ~ material;

	//Loop through all varieties of poor ore
	if(!oreDict.get(poorOre).empty)
	{
		for ore in oreDict.get(poorOre).items
		{
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
	"Ardite",
	"Cobalt",
	"Iron",
	"Gold",
	"Diamond",
	"Redstone",
	"Lapis",
	"Emerald",
	"Coal",
	"Quartz",
	"Titanium",
	"Dilithium",
	"Thorium",
	"Uranium",
	"Boron",
	"Lithium",
	"Magnesium",
	"Draconium"
] as string[];

for ore in denseAndPoorOresList
{
	//Make Poor ore crafting recipes for each ore material
	poorOreCrafting(ore);
}

print("### Dense/Poor Ore Crafting Init Complete ###");
