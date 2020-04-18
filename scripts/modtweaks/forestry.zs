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

//Remove Tier 1 Ores being output from Metallic Grains
val metallicGrainsDusts = [
	<thermalfoundation:material:64>,
	<thermalfoundation:material:65>,
	<thermalfoundation:material:69>,
	<mekanism:dust:2>,
	<thermalfoundation:material:66>,
	<thermalfoundation:material:67>,
	<thermalfoundation:material:68>
] as crafttweaker.item.IItemStack[];

for metallicGrainsDustCraft in metallicGrainsDusts
{
	mods.forestry.Carpenter.removeRecipe(metallicGrainsDustCraft, <liquid:water>);
}

//ExtendedCrafting recipes for forestry Machines in tier1
val machineRecipes = {
		<forestry:engine_clockwork> : [[<ore:plateSealedWood>, <ore:plateSealedWood>, <ore:plateSealedWood>], [null, <ore:blockGlass>, null], [<magneticraft:crafting:2>, <ore:ingotIron>, <minecraft:clock>]],
		<forestry:carpenter> : [[<ore:ingotIron>, <ore:blockGlass>, <ore:ingotIron>], [<ore:ingotIron>, <ore:itemSimpleMachineChassi>, <ore:ingotIron>], [<ore:ingotIron>, <thermalfoundation:material:657>, <ore:ingotIron>]],
		<forestry:squeezer> : [[<ore:ingotIron>, <ore:blockGlass>, <ore:ingotIron>], [<ore:ingotIron>, <ore:itemSimpleMachineChassi>, <ore:ingotIron>], [<ore:ingotIron>, <minecraft:piston>, <ore:ingotIron>]],
		<forestry:centrifuge> : [[<ore:ingotIron>, <ore:blockGlass>, <ore:ingotIron>], [<ore:ingotIron>, <ore:itemSimpleMachineChassi>, <ore:ingotIron>], [<ore:ingotIron>, <magneticraft:crafting:2>, <ore:ingotIron>]],
		<forestry:fabricator> : [[<ore:ingotGold>, <ore:blockGlass>, <ore:ingotGold>], [<ore:blockGlass>, <ore:itemSimpleMachineChassi>, <ore:blockGlass>], [<ore:ingotGold>, <ore:chestWood>, <ore:ingotGold>]]
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in machineRecipes {
	recipes.remove(key);
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

print("### Forestry Init Complete ###");
