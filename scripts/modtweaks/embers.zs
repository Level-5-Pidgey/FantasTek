
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

for materialString, oreValue in scripts.helpers.OresWithProcessingTier
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

//Add Tooltip for Tinker's Hammer.
scripts.helpers.AddTooltip(<embers:tinker_hammer>, ["Tinkers Hammers can be used to craft plates using ingots.", "They can also be used to crush most ingots into dusts."]);

//Add Tooltip for Sealed Planks.
scripts.helpers.AddTooltip(<embers:sealed_planks>, ["Created by soaking wood in creosote oil."]);

//Change Sealed Planks/Reinforced Sealed Planks Recipes
recipes.remove(<embers:sealed_planks>);
recipes.remove(<embers:wrapped_sealed_planks>);
mods.inworldcrafting.FluidToItem.transform(<embers:sealed_planks> * 8, <liquid:creosote>, [<ore:plankWood> * 8], true);
mods.tconstruct.Casting.addBasinRecipe(<embers:wrapped_sealed_planks>, <embers:sealed_planks>, <liquid:crude_steel>, 144, true, 30);
mods.recipestages.Recipes.addShaped("sealed_planks", scripts.helpers.stages.Locked.stage, <embers:sealed_planks> * 8, [[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],[<ore:plankWood>, <forge:bucketfilled>.withTag({FluidName: "creosote", Amount: 1000}), <ore:plankWood>], [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]]);
mods.recipestages.Recipes.addShaped("reinforced_sealed_planks", scripts.helpers.stages.Locked.stage, <embers:wrapped_sealed_planks> * 4, [[<ore:ingotSteel>, <embers:sealed_planks>, <ore:ingotSteel>],[<embers:sealed_planks>, null, <embers:sealed_planks>], [<ore:ingotSteel>, <embers:sealed_planks>, <ore:ingotSteel>]]);

print("### Embers Init Complete ###");
