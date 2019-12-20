
print("~~~ Begin Magneticraft Init ~~~");

//Disable Crushing Table and Hydraulic Press
mods.jei.JEI.hideCategory("magneticraft.hydraulic_press");
//mods.jei.JEI.hideCategory("magneticraft.crushing_table");
mods.jei.JEI.removeAndHide(<magneticraft:hydraulic_press>);
//mods.jei.JEI.removeAndHide(<magneticraft:crushing_table>);

//Hide Magneticraft Plates
val magneticraftPlates =
[
	<magneticraft:light_plates>,
	<magneticraft:heavy_plates:6>,
	<magneticraft:heavy_plates:5>,
	<magneticraft:heavy_plates:3>,
	<magneticraft:heavy_plates:2>,
	<magneticraft:heavy_plates:1>,
	<magneticraft:heavy_plates>,
	<magneticraft:light_plates:3>,
	<magneticraft:light_plates:2>,
	<magneticraft:light_plates:1>,
	<magneticraft:light_plates:6>,
	<magneticraft:light_plates:5>
] as crafttweaker.item.IItemStack[];

for magneticraftPlate in magneticraftPlates
{
	mods.jei.JEI.hide(magneticraftPlate);
}

//Replace Plates with OreDict
for item in loadedMods["magneticraft"].items {
	recipes.replaceAllOccurences(<magneticraft:light_plates>, <ore:plateIron>, item);
	recipes.replaceAllOccurences(<magneticraft:light_plates:1>, <ore:plateGold>, item);
	recipes.replaceAllOccurences(<magneticraft:light_plates:2>, <ore:plateCopper>, item);
	recipes.replaceAllOccurences(<magneticraft:light_plates:3>, <ore:plateLead>, item);
	recipes.replaceAllOccurences(<magneticraft:light_plates:5>, <ore:plateTungsten>, item);
	recipes.replaceAllOccurences(<magneticraft:light_plates:6>, <ore:plateSteel>, item);
}

//Disable Rocky Chunks being able to be smelted in a furnace
<ore:rockyChunkLead>.add(<magneticraft:rocky_chunks:8>); //Add Galena Chunk to Lead since they're not in the same oreDict
function removeChunkSmelt(material as string)
{
	//Combining string
	val rockyChunk = "rockyChunk" ~ material; //The ore/material used to obtain the ingot from the rocky chunk
	val ingotFromChunk = "ingot" ~ material;

	//If an oreDict for the rocky chunk exists, loop through all forms of the chunk
	if (!oreDict.get(rockyChunk).empty)
	{
		for rock in oreDict.get(rockyChunk).items
		{
			if(!oreDict.get(ingotFromChunk).empty)
			{
				for bar in oreDict.get(ingotFromChunk).items
				{
					//If both a chunk and ingot exist for the material given, remove the smelting recipe accordingly.
					furnace.remove(bar, rock);
				}
			}
		}
	}
}

function addCrushingTableRecipe(material as string)
{
	//Obtaining oreDicts
	var ingot = oreDict.get("ingot" ~ material);
	var dust = oreDict.get("dust" ~ material);

	if(!ingot.empty & !dust.empty)
	{
		mods.magneticraft.CrushingTable.addRecipe(ing, dust.firstItem, true);
	}
}

val oreMaterials =
[
	"Ardite",
	"AstralStarmetal",
	"Chromium",
	"Draconium",
	"Iridium",
	"Necrodermis",
	"Platinum",
	"Thorium",
	"Titanium",
	"Uranium",
	"Vibranium",
	"Yellorium",
	"Iron",
	"Gold",
	"Copper",
	"Lead",
	"Cobalt",
	"Tungsten",
	"Aluminium",
	"Mithril",
	"Nickel",
	"Osmium",
	"Silver",
	"Tin",
	"Zinc"
] as string[];

for materialString in oreMaterials
{
	removeChunkSmelt(materialString);

	addCrushingTableRecipe(materialString);
}

//Remove some Crushing Table Recipes
val crushingTable =
[
	<magneticraft:ingots:5>,
	<mekanism:ingot:1>,
	<draconicevolution:draconium_ingot>,
	<magneticraft:ingots:4>,
	<astralsorcery:itemcraftingcomponent:1>,
	<tconstruct:ingots:1>,
	<thermalfoundation:material:160>,
	<magneticraft:storage_blocks:3>,
	<chisel:blocklead:2>,
	<chisel:blockcopper:1>,
	<minecraft:gold_block>,
	<minecraft:iron_block>,
	<contenttweaker:sub_block_holder_11:6>,
	<mekanism:oreblock:2>,
	<embers:ore_silver>,
	<mekanism:oreblock>,
	<thermalfoundation:ore:5>,
	<thermalfoundation:ore:8>,
	<magneticraft:ores:3>,
	<thermalfoundation:ore:4>,
	<magneticraft:ores:2>,
	<thermalfoundation:ore:3>,
	<mekanism:oreblock:1>,
	<minecraft:gold_ore>,
	<minecraft:iron_ore>
] as crafttweaker.item.IItemStack[];

for inputItem in crushingTable
{
	mods.magneticraft.CrushingTable.removeRecipe(inputItem);
}

//Add Coal Coke Crushing Recipe
mods.magneticraft.CrushingTable.addRecipe(<thermalfoundation:material:802>, <contenttweaker:coke_dust> * 2, true);
mods.magneticraft.CrushingTable.addRecipe(<thermalfoundation:storage_resource:1>, <contenttweaker:coke_dust> * 18, true);

print("### Magneticraft Init Complete ###");
