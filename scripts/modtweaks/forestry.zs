import crafttweaker.item.IItemStack;

print("~~~ Begin Forestry Init ~~~");

//Add Log Pile to an OreDict for the Coke Oven
<ore:logPile>.add(<forestry:wood_pile>);

//Hide Depreciated Items
val depreciatedForestry = [
	<forestry:greenhouse:3>,
	<forestry:greenhouse:4>,
	<forestry:greenhouse:5>,
	<forestry:climatiser:1>,
	<forestry:climatiser:2>,
	<forestry:climatiser:3>,
	<forestry:climatiser:4>
] as crafttweaker.item.IItemStack[];

for depreciated in depreciatedForestry
{
	mods.jei.JEI.removeAndHide(depreciated);
}

//Add more items that produce honey when squeezed
var honeyOutput =
{
	<minecraftfuture:honeycomb> : 50,
	<minecraftfuture:honey_bottle> : 100,
	<biomesoplenty:honeycomb> : 25,
	<biomesoplenty:filled_honeycomb> : 75,
	<minecraftfuture:honeycomb_block> : 200,
	<biomesoplenty:honey_block> : 250,
	<biomesoplenty:jar_filled> : 100
} as int[IItemStack];

for item, fluidAmount in honeyOutput
{
	mods.forestry.Squeezer.addRecipe(<liquid:for.honey> * fluidAmount, [item], 40);
	mods.thermalexpansion.Transposer.addExtractRecipe(<liquid:for.honey> * fluidAmount, item, 2400);
}

//Change Recipes
recipes.remove(<forestry:bee_house>);
recipes.addShaped(scripts.helpers.createRecipeName(<forestry:bee_house>), <forestry:bee_house>, [[<ore:plateSealedWood>, <ore:plateSealedWood>, <ore:plateSealedWood>],[<ore:plankWood>, <minecraftfuture:honeycomb>, <ore:plankWood>], [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]]); //Bee House
mods.forestry.Carpenter.removeRecipe(<forestry:impregnated_casing>); //Impregnated Casing
mods.forestry.Carpenter.addRecipe(<forestry:impregnated_casing>, [[<embers:wrapped_sealed_planks>, <embers:sealed_planks>, <embers:wrapped_sealed_planks>],[<embers:sealed_planks>, null, <embers:sealed_planks>],[<embers:wrapped_sealed_planks>, <embers:sealed_planks>, <embers:wrapped_sealed_planks>]], 80, <liquid:seed.oil> * 250);

print("### Forestry Init Complete ###");
