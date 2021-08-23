
print("~~~ Begin Openblocks Init ~~~");

//Hide Items from Mod
val openblocksItem =
[
	<openblocks:block_breaker>,
] as crafttweaker.item.IItemStack[];

for openblocksToHide in openblocksItem
{
	scripts.helpers.unstageAndHide(openblocksToHide);
}

//Crafting Table Recipes
val openblocksRecipes_CRAFTINGTABLE = {

	<openblocks:block_placer> : [[<ore:stone>, <ore:stone>, <ore:stone>], [<ore:stone>, <minecraft:piston>, <ore:stone>], [<ore:stone>, <minecraft:piston>, <ore:stone>]],
	<openblocks:hang_glider> : [[<ore:nuggetSteel>, <ore:ingotSteel>, <ore:nuggetSteel>], [<openblocks:generic>, <ore:nuggetSteel>, <openblocks:generic>], [<ore:nuggetSteel>, <ore:ingotSteel>, <ore:nuggetSteel>]],
	<openblocks:generic> : [[<ore:itemLeather>, <ore:nuggetSteel>, null], [<ore:itemLeather>, <ore:itemLeather>, <ore:nuggetSteel>], [<ore:itemLeather>, <ore:itemLeather>, <ore:itemLeather>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in openblocksRecipes_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Extended Crafting Recipes
val openblocksRecipes_EXTENDEDCRAFTING = {
	<openblocks:projector> : [[<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>], [<ore:dustGlowstone>, scripts.helpers.CircuitTiers[0], <ore:gemLapis>], [<ore:slabStone>, <ore:slabStone>, <ore:slabStone>]],
	<openblocks:generic:6> : [[null, <ore:dustElectrotine>, null], [<ore:dustElectrotine>, <ore:ingotGold>, <ore:dustElectrotine>], [null, <ore:dustElectrotine>, null]],
	<openblocks:generic:7> : [[<ore:dustElectrotine>, <ore:nuggetIron>, null], [<ore:dustElectrotine>, <ore:nuggetIron>, null], [<ore:dustElectrotine>, <ore:nuggetIron>, null]],
	<openblocks:vacuum_hopper> : [[null, scripts.helpers.CircuitTiers[0], null], [<extendedcrafting:material:37>, <minecraft:hopper>, <extendedcrafting:material:37>], [<extendedcrafting:material:37>, scripts.helpers.FrameTiers[0], <extendedcrafting:material:37>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in openblocksRecipes_EXTENDEDCRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

//Fan
recipes.remove(<openblocks:fan>);
for rune in scripts.helpers.AllAirT1Items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <openblocks:fan>, [[null, <ore:barsIron>, null], [null, <ore:ingotIron>, null], [<ore:slabStone>, rune, <ore:slabStone>]]);
}

print("### Openblocks Init Complete ###");
