
print("~~~ Begin Magneticraft Init ~~~");

//Disable Crushing Table and Hydraulic Press
mods.jei.JEI.hideCategory("magneticraft.hydraulic_press");
mods.jei.JEI.hideCategory("magneticraft.crushing_table");
scripts.helpers.unstageAndHide(<magneticraft:hydraulic_press>);
scripts.helpers.unstageAndHide(<magneticraft:crushing_table>);

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
	scripts.helpers.unstageAndHide(magneticraftPlate);
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
}

val magneticraftRecipes = {
	<magneticraft:crafting:2> * 4 : [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotRedstoneAlloy>, <ore:dustRedstone>, <ore:ingotCrudeSteel>], [<ore:ingotIron>, <ore:ingotIron>, null]],
	<magneticraft:conveyor_belt> * 16 : [[null, null, null], [<ore:plateIron>, <magneticraft:crafting:2>, <ore:plateIron>], [<ore:ingotIron>, null, <ore:ingotIron>]],
	<magneticraft:inserter> * 4 : [[<ore:ingotRedstoneAlloy>, <ore:nuggetIron>, null], [<ore:nuggetIron>, <ore:ingotRedstoneAlloy>, <ore:nuggetIron>], [<ore:plateIron>, <magneticraft:crafting:2>, <ore:plateIron>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in magneticraftRecipes {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Motor after stage 1
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<magneticraft:crafting:2>) ~ scripts.helpers.stages.progression2.stage, <magneticraft:crafting:2> * 4, [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotRedstoneAlloy>, <ore:dustRedstone>, <ore:ingotCopper>], [<ore:ingotIron>, <ore:ingotIron>, null]]);

print("### Magneticraft Init Complete ###");
