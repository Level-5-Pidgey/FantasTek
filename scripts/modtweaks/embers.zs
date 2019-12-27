
print("~~~ Begin Embers Init ~~~");

//Hide Embers Plates
val emberPlates =
[
	<embers:plate_copper>,
	<embers:plate_iron>,
	<embers:plate_gold>,
	<embers:plate_aluminum>,
	<embers:plate_bronze>,
	<embers:plate_electrum>,
	<embers:plate_nickel>,
	<embers:plate_tin>,
	<embers:plate_silver>,
	<embers:plate_lead>
] as crafttweaker.item.IItemStack[];

for emberPlate in emberPlates
{
	mods.jei.JEI.hide(emberPlate);
}

for materialString, oreValue in scripts.modtweaks.basescripts.oreprocessing.OreTypes
{
	var blockOre = oreDict.get("ore" ~ materialString);
	var oreIngot = oreDict.get("ingot" ~ materialString);
	var oreDust = oreDict.get("dust" ~ materialString);

	if(!oreDust.empty & !oreIngot.empty)
	{
		recipes.addShapeless("ingotgrinding_" ~ materialString, oreDust.firstItem, [<embers:tinker_hammer>, oreIngot]);
	}
}

//Change Tinkers Hammer Recipe
recipes.remove(<embers:tinker_hammer>);
recipes.addShaped("tinker_hammer", <embers:tinker_hammer>.withTag({}), [[null, <ore:ingotIron>, <ore:obsidian>],[null, <ore:stickWood>, <ore:ingotIron>], [<ore:stickWood>, null, null]]);

print("### Embers Init Complete ###");
