
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

//Add Tooltips
scripts.helpers.AddTooltip(<embers:tinker_hammer>, ["Tinkers Hammers can be used to craft plates using ingots.", "They can also be used to crush most ingots into dusts."]);
scripts.helpers.AddTooltip(<embers:sealed_planks>, ["Created by soaking wood in creosote oil."]);
scripts.helpers.AddTooltip(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:embers_converter"}), ["Requires both an Ember Input and Energy Output. Can be put on either side."]);

//Change Sealed Planks/Reinforced Sealed Planks Recipes
recipes.remove(<embers:sealed_planks>);
recipes.remove(<embers:wrapped_sealed_planks>);
mods.inworldcrafting.FluidToItem.transform(<embers:sealed_planks> * 8, <liquid:creosote>, [<ore:plankWood> * 8], true);
mods.tconstruct.Casting.addBasinRecipe(<embers:wrapped_sealed_planks>, <embers:sealed_planks>, <liquid:crude_steel>, 144, true, 30);
mods.recipestages.Recipes.addShaped("sealed_planks", scripts.helpers.stages.progression2.stage, <embers:sealed_planks> * 8, [[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],[<ore:plankWood>, <forge:bucketfilled>.withTag({FluidName: "creosote", Amount: 1000}), <ore:plankWood>], [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]]);
mods.recipestages.Recipes.addShaped("reinforced_sealed_planks", scripts.helpers.stages.progression2.stage, <embers:wrapped_sealed_planks> * 4, [[<ore:ingotSteel>, <embers:sealed_planks>, <ore:ingotSteel>],[<embers:sealed_planks>, null, <embers:sealed_planks>], [<ore:ingotSteel>, <embers:sealed_planks>, <ore:ingotSteel>]]);

//Change Codex Recipe
recipes.remove(<embers:codex>);
recipes.addShapeless(scripts.helpers.createRecipeName(<embers:codex>), <embers:codex>, [<ore:book>, <embers:archaic_brick>]);

//Add Archaic Brick Recipe
furnace.remove(<natura:nether_glass>);
furnace.addRecipe(<embers:archaic_brick>, <minecraft:soul_sand>, 0.1);

//Recipe Changes
val embers_CRAFTINGTABLE = {
		<embers:ember_bore> : [[<embers:block_caminite_brick>, <ore:gearDiamond>, <embers:block_caminite_brick>],[<embers:block_caminite_brick>, <embers:mech_core>, <embers:block_caminite_brick>], [<ore:ingotIron>, <embers:ancient_motive_core>, <ore:ingotIron>]],
		<embers:mech_core> : [[<ore:ingotIron>, null, <ore:ingotIron>],[null, <ore:gearConductiveIron>, null], [<ore:ingotIron>, null, <ore:ingotIron>]],
		<embers:ember_activator> : [[<ore:ingotConductiveIron>, <ore:ingotConductiveIron>, <ore:ingotConductiveIron>], [<ore:ingotConductiveIron>, <embers:mech_core>, <ore:ingotConductiveIron>], [<embers:brick_caminite>, <embers:brick_caminite>, <embers:brick_caminite>]],
		<embers:ember_emitter> * 5 : [[null, <ore:ingotIron>, null], [null, <ore:ingotIron>, null], [<embers:brick_caminite>, <embers:brick_caminite>, <embers:brick_caminite>]],
		<embers:ember_receiver> * 5 : [[null, null, null], [<ore:ingotIron>, null, <ore:ingotIron>], [<embers:brick_caminite>, <embers:brick_caminite>, <embers:brick_caminite>]],
		<embers:ember_gauge> : [[<ore:dustRedstone>], [<ore:paper>], [<ore:plateGold>]],
		<embers:fluid_gauge> : [[<ore:dustRedstone>], [<ore:paper>], [<ore:plateIron>]],
		<embers:ember_detector> : [[null, <embers:archaic_brick>, null], [<embers:archaic_brick>, <minecraft:compass>, <embers:archaic_brick>], [null, <embers:archaic_brick>, null]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in embers_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//ExtendedCrafting recipes for forestry Machines in tier1
val embers_EXTENDEDCRAFTING = {
	<embers:stamper> : [[<embers:brick_caminite>, <ore:plateIron>.firstItem, <embers:brick_caminite>], [<embers:brick_caminite>, <ore:ingotIron>.firstItem, <embers:brick_caminite>], [<embers:brick_caminite>, null, <embers:brick_caminite>]],
	<embers:stamper_base> : [[<ore:ingotIron>.firstItem, null, <ore:ingotIron>.firstItem], [<embers:brick_caminite>, null, <embers:brick_caminite>], [<embers:brick_caminite>, <minecraft:bucket>, <embers:brick_caminite>]],
	<embers:block_furnace> : [[<embers:brick_caminite>, <embers:plate_caminite>, <embers:brick_caminite>],
	[<embers:brick_caminite>, <contenttweaker:crystal_ember_fire>, <embers:brick_caminite>],
	[<ore:ingotIron>, <ore:plateConductiveIron>, <ore:ingotIron>]]
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in embers_EXTENDEDCRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

print("### Embers Init Complete ###");
