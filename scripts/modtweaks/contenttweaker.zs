print("~~~ Begin ContentTweaker recipes Init ~~~");

//Steel Blend Crafting
recipes.addShaped("steel_blend_crafting", <contenttweaker:steel_blend> * 2, [[<contenttweaker:coke_dust>, <ore:dustIron>, <contenttweaker:coke_dust>],[<contenttweaker:coke_dust>, <ore:dustIron>, <contenttweaker:coke_dust>], [<contenttweaker:coke_dust>, <ore:dustIron>, <contenttweaker:coke_dust>]]);

//Melt Steel Blend into Crude Steel
mods.tconstruct.Melting.addRecipe(<liquid:molten_crude_steel> * 144, <contenttweaker:steel_blend>, 450);

//Cast Crude Steel into Ingots or Blocks or Nuggets
mods.tconstruct.Casting.addTableRecipe(<ore:ingotCrudeSteel>.firstItem, <tconstruct:cast_custom>, <liquid:molten_crude_steel>, 144, false);
mods.tconstruct.Casting.addTableRecipe(<ore:nuggetCrudeSteel>.firstItem, <tconstruct:cast_custom:1>, <liquid:molten_crude_steel>, 16, false);
mods.tconstruct.Casting.addBasinRecipe(<ore:blockCrudeSteel>.firstItem, null, <liquid:molten_crude_steel>, 1296);

//Add Plate Press for Wooden Boards
for wood in <ore:logWood>.items
{
	mods.advancedrocketry.PlatePresser.addRecipe(<contenttweaker:wood_plate> * 2, wood);
}

//Add Prismarine Shard Crafting
for prismarine in <ore:prismarine>.items
{
	mods.advancedrocketry.PlatePresser.addRecipe(<contenttweaker:prismarine_nugget> * 16, prismarine);
	scripts.helpers.AddTooltip(prismarine, ["Prismarine can be found in Ocean Monuments,", "or obtained by mining Prismarine Boulders", "found on the seabed."]);
}
recipes.addShapeless("prismarine_shards", <contenttweaker:prismarine_nugget> * 2, [<embers:tinker_hammer>, <ore:shardPrismarine>]);

//Add Tooltip for Artifact
scripts.helpers.AddTooltip(<contenttweaker:strange_treasure>, ["Rare treasure that villagers may have a bounty for!", "Can be sold for a high price."]);

print("### ContentTweaker recipes Init Complete ###");
