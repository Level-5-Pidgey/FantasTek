import mods.dropt.Dropt;

print("~~~ Begin ContentTweaker recipes Init ~~~");

//Steel Blend Crafting
recipes.addShaped("steel_blend_crafting", <contenttweaker:steel_blend> * 2, [[<contenttweaker:coke_dust>, <ore:dustIron>, <contenttweaker:coke_dust>],[<contenttweaker:coke_dust>, <ore:dustIron>, <contenttweaker:coke_dust>], [<contenttweaker:coke_dust>, <ore:dustIron>, <contenttweaker:coke_dust>]]);

//Melt Steel Blend into Crude Steel
mods.tconstruct.Melting.addRecipe(<liquid:crude_steel> * 144, <contenttweaker:steel_blend>, 450);

//Cast Crude Steel into Ingots or Blocks or Nuggets
mods.tconstruct.Casting.addTableRecipe(<ore:ingotCrudeSteel>.firstItem, <tconstruct:cast_custom>, <liquid:crude_steel>, 144, false);
mods.tconstruct.Casting.addTableRecipe(<ore:nuggetCrudeSteel>.firstItem, <tconstruct:cast_custom:1>, <liquid:crude_steel>, 16, false);
mods.tconstruct.Casting.addBasinRecipe(<ore:blockCrudeSteel>.firstItem, null, <liquid:crude_steel>, 1296);

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

//Thaumcraft Infused Stones
//Changing block drops
Dropt.list("thaumcraft_crystal_ores")

	.add(Dropt.rule()
		.matchBlocks(["contenttweaker:infused_stone_aer"])
		.addDrop(Dropt.drop()
		.items([<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]})], Dropt.range(1, 3))
	))
	.add(Dropt.rule()
		.matchBlocks(["contenttweaker:infused_stone_aqua"])
		.addDrop(Dropt.drop()
		.items([<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]})], Dropt.range(1, 3))
	))
	.add(Dropt.rule()
		.matchBlocks(["contenttweaker:infused_stone_ignis"])
		.addDrop(Dropt.drop()
		.items([<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]})], Dropt.range(1, 3))
	))
	.add(Dropt.rule()
		.matchBlocks(["contenttweaker:infused_stone_ordo"])
		.addDrop(Dropt.drop()
		.items([<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]})], Dropt.range(1, 3))
	))
	.add(Dropt.rule()
		.matchBlocks(["contenttweaker:infused_stone_perditio"])
		.addDrop(Dropt.drop()
		.items([<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]})], Dropt.range(1, 3))
	))
	.add(Dropt.rule()
		.matchBlocks(["contenttweaker:infused_stone_terra"])
		.addDrop(Dropt.drop()
		.items([<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]})], Dropt.range(1, 3))
	))
	.add(Dropt.rule()
		.matchBlocks(["contenttweaker:infused_stone_vitium"])
		.addDrop(Dropt.drop()
		.items([<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]})], Dropt.range(1, 3))
	));

//Adding Smelting Recipes
furnace.addRecipe(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]}) * 4, <contenttweaker:infused_stone_aer>, 0.7);
mods.minecraftfuture.BlastFurnace.addRecipe(<contenttweaker:infused_stone_aer>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]}) * 4);

furnace.addRecipe(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}) * 4, <contenttweaker:infused_stone_aqua>, 0.7);
mods.minecraftfuture.BlastFurnace.addRecipe(<contenttweaker:infused_stone_aqua>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}) * 4);

furnace.addRecipe(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}) * 4, <contenttweaker:infused_stone_ignis>, 0.7);
mods.minecraftfuture.BlastFurnace.addRecipe(<contenttweaker:infused_stone_ignis>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}) * 4);

furnace.addRecipe(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]}) * 4, <contenttweaker:infused_stone_ordo>, 0.7);
mods.minecraftfuture.BlastFurnace.addRecipe(<contenttweaker:infused_stone_ordo>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]}) * 4);

furnace.addRecipe(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]}) * 4, <contenttweaker:infused_stone_perditio>, 0.7);
mods.minecraftfuture.BlastFurnace.addRecipe(<contenttweaker:infused_stone_perditio>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]}) * 4);

furnace.addRecipe(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}) * 4, <contenttweaker:infused_stone_terra>, 0.7);
mods.minecraftfuture.BlastFurnace.addRecipe(<contenttweaker:infused_stone_terra>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}) * 4);

furnace.addRecipe(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) * 4, <contenttweaker:infused_stone_vitium>, 0.7);
mods.minecraftfuture.BlastFurnace.addRecipe(<contenttweaker:infused_stone_vitium>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) * 4);

print("### ContentTweaker recipes Init Complete ###");
