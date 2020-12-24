
print("~~~ Begin Extrautils2 Init ~~~");

//Make these Specified Items Shop-Only
val shopItems =
[
  <extrautils2:soundmuffler>
] as crafttweaker.item.IItemStack[];

for item in shopItems
{
	recipes.remove(item);
	scripts.helpers.AddTooltip(item, ["Cannot be crafted.", "Purchasable from various villagers."]);
}

//Disable JEI Resonator Window
mods.jei.JEI.hideCategory("extrautils2.resonator");

//Ineffable Glass/Ethereal Glass Recipe Changes
recipes.remove(<extrautils2:ineffableglass:*>);
recipes.addShapeless(scripts.helpers.createRecipeName(<extrautils2:ineffableglass:1>), <extrautils2:ineffableglass:1>, [<extrautils2:ineffableglass>, <minecraft:redstone_torch>]); //Inverted Ineffable Glass

//Remove the Glass Cutter and Ender Shard
scripts.helpers.unstageAndHide(<extrautils2:glasscutter>);
scripts.helpers.unstageAndHide(<extrautils2:endershard>);
recipes.remove(<extrautils2:ingredients>);

//Hide Items from Mod
val extrautilsItem =
[
	<extrautils2:book>,
    <extrautils2:ingredients:1>,
    <extrautils2:resonator>,
] as crafttweaker.item.IItemStack[];

for extrautilsitemsToHide in extrautilsItem
{
	scripts.helpers.unstageAndHide(extrautilsitemsToHide);
}

//Crafting Table Recipes
val extrautilsRecipes_CRAFTINGTABLE = {
    <extrautils2:ineffableglass> * 8 : [[<extrautils2:decorativeglass>, <extrautils2:decorativeglass>, <extrautils2:decorativeglass>], [<extrautils2:decorativeglass>, <ore:ingotUnstable>, <extrautils2:decorativeglass>], [<extrautils2:decorativeglass>, <extrautils2:decorativeglass>, <extrautils2:decorativeglass>]],
    <extrautils2:ineffableglass:2> * 8 : [[<extrautils2:ineffableglass>, <extrautils2:ineffableglass>, <extrautils2:ineffableglass>], [<extrautils2:ineffableglass>, <ore:ingotUnstable>, <extrautils2:ineffableglass>], [<extrautils2:ineffableglass>, <extrautils2:ineffableglass>, <extrautils2:ineffableglass>]],
    <extrautils2:ineffableglass:3> * 8 : [[<extrautils2:ineffableglass:2>, <extrautils2:ineffableglass:2>, <extrautils2:ineffableglass:2>], [<extrautils2:ineffableglass:2>, <ore:gemMoon>, <extrautils2:ineffableglass:2>], [<extrautils2:ineffableglass:2>, <extrautils2:ineffableglass:2>, <extrautils2:ineffableglass:2>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in extrautilsRecipes_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Extended Crafting Recipes
val extrautilsRecipes_EXTENDEDCRAFTING = {
    <extrautils2:screen> : [[<ore:blockGlassColorless>, <ore:blockGlassColorless>, <ore:blockGlassColorless>], [<ore:nuggetIron>, <ore:gearPulsatingIron>, <ore:nuggetIron>], [<ore:blockGlassColorless>, <ore:blockGlassColorless>, <ore:blockGlassColorless>]],
    <extrautils2:resonator> : [[<ore:blockGlassColorless>, <ore:blockGlassColorless>, <ore:blockGlassColorless>], [<ore:nuggetIron>, <ore:gearPulsatingIron>, <ore:nuggetIron>], [<ore:blockGlassColorless>, <ore:blockGlassColorless>, <ore:blockGlassColorless>]],
    <extrautils2:user> : [[null, <ore:obsidian>, null], [<ore:obsidian>, <minecraft:dispenser>, <ore:obsidian>], [null, <ore:obsidian>, null]],
    //<openblocks:projector> : [[<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>], [<ore:dustGlowstone>, scripts.helpers.CircuitTiers[0], <ore:gemLapis>], [<ore:slabStone>, <ore:slabStone>, <ore:slabStone>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in extrautilsRecipes_EXTENDEDCRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

//Resonator Recipes TODO
//<extrautils2:decorativeglass:5>
//<extrautils2:ingredients:13>.withTag({Freq: 579632228})
//<extrautils2:ingredients:9>
//<extrautils2:ingredients:4>
//<extrautils2:ingredients:3>
//<extrautils2:decorativesolid:8>
//<extrautils2:decorativesolid:7>
//<extrautils2:decorativesolid:3>
print("### Extrautils2 Init Complete ###");
