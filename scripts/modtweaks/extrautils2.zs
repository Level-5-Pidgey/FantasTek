
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
    <extrautils2:passivegenerator:7>
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
    <extrautils2:resonator> : [[<ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotBlackIron>], [<ore:ingotRedstoneAlloy>, <ore:dustGlowstone>, <ore:ingotRedstoneAlloy>], [<ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotBlackIron>]],
    <extrautils2:passivegenerator> * 3: [[null, null, null], [<ore:itemPlatePhotovoltaic>, <ore:itemPlatePhotovoltaic>, <ore:itemPlatePhotovoltaic>], [<ore:stone>, <ore:gearRedstoneAlloy>, <ore:stone>]],
    <extrautils2:passivegenerator:1> * 3 : [[null, null, null], [<ore:dustLunar>, <ore:dustLunar>, <ore:dustLunar>], [<extrautils2:passivegenerator>, <extrautils2:passivegenerator>, <extrautils2:passivegenerator>]],
    <extrautils2:passivegenerator:8> : [[<ore:stone>, <ore:enderpearl>, <ore:stone>], [<ore:netherStar>, <ore:gearRedstoneAlloy>, <ore:netherStar>], [<ore:stone>, <ore:enderpearl>, <ore:stone>]],
    <extrautils2:user> : [[<ore:nuggetIron>, <ore:stone>, <ore:nuggetIron>], [<ore:stone>, <minecraft:dispenser>, <ore:stone>], [<ore:nuggetIron>, <ore:stone>, <ore:nuggetIron>]],
    //<openblocks:projector> : [[<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>], [<ore:dustGlowstone>, scripts.helpers.CircuitTiers[0], <ore:gemLapis>], [<ore:slabStone>, <ore:slabStone>, <ore:slabStone>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in extrautilsRecipes_EXTENDEDCRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

//Elemental Generators
//Lava Generator (Earth)
recipes.remove(<extrautils2:passivegenerator:2>);
for rune in scripts.helpers.AllEarthT1Items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <extrautils2:passivegenerator:2> * 2, [[<ore:stone>, <ore:stone>, <ore:stone>], [<ore:ingotConductiveIron>, <minecraft:magma>, <ore:ingotConductiveIron>], [<ore:stone>, rune, <ore:stone>]]);
}
//Water Generator (Water)
recipes.remove(<extrautils2:passivegenerator:3>);
for rune in scripts.helpers.AllWaterT1Items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <extrautils2:passivegenerator:3> * 2, [[<ore:stone>, <ore:stone>, <ore:stone>], [<ore:ingotGold>, <ore:gemLapis>, <ore:ingotGold>], [<ore:stone>, rune, <ore:stone>]]);
}
//Air Generator (Air)
recipes.remove(<extrautils2:passivegenerator:4>);
for rune in scripts.helpers.AllAirT1Items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <extrautils2:passivegenerator:4> * 3, [[<ore:stone>, <ore:stone>, <ore:stone>], [<ore:barsIron>, <ore:barsIron>, <ore:barsIron>], [<ore:stone>, rune, <ore:stone>]]);
}
//Fire Generator (Fire)
recipes.remove(<extrautils2:passivegenerator:5>);
for rune in scripts.helpers.AllFireT1Items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <extrautils2:passivegenerator:5> * 3, [[<ore:stone>, <ore:stone>, <ore:stone>], [<ore:ingotBrickNether>, <ore:ingotBrickNether>, <ore:ingotBrickNether>], [<ore:stone>, rune, <ore:stone>]]);
}

//Use Machines to Create the exU metals
//Demon Metal
scripts.helpers.addInjectionRecipe(<ore:ingotDemonicMetal>.firstItem, <ore:ingotGold>, <liquid:lava> * 111, 5000, 2);
scripts.helpers.addInjectionRecipe(<ore:blockDemonicMetal>.firstItem, <ore:blockGold>, <liquid:lava> * 1000, 5000, 2);
<ticmat:xu_demonic_metal>.attackHead = 5.7; //Nerf Demonic Metal Damage
//Enchanted Metal
scripts.helpers.addInjectionRecipe(<ore:ingotEnchantedMetal>.firstItem, <ore:ingotManyullyn>, <liquid:essence> * 111, 10000, 3);
scripts.helpers.addInjectionRecipe(<ore:blockEnchantedMetal>.firstItem, <ore:blockManyullyn>, <liquid:essence> * 1000, 10000, 3);
scripts.helpers.addInjectionRecipe(<ore:ingotEnchantedMetal>.firstItem, <ore:ingotManyullyn>, <liquid:experience> * 111, 10000, 3);
scripts.helpers.addInjectionRecipe(<ore:blockEnchantedMetal>.firstItem, <ore:blockManyullyn>, <liquid:experience> * 1000, 10000, 3);
scripts.helpers.addInjectionRecipe(<ore:ingotEnchantedMetal>.firstItem, <ore:ingotManyullyn>, <liquid:xpjuice> * 111, 10000, 3);
scripts.helpers.addInjectionRecipe(<ore:blockEnchantedMetal>.firstItem, <ore:blockManyullyn>, <liquid:xpjuice> * 1000, 10000, 3);
<ticmat:xu_enchanted_metal>.attackHead = 9.1;
<ticmat:xu_enchanted_metal>.durabilityHead = 900;
<ticmat:xu_enchanted_metal>.miningSpeedHead = 7.45;
<ticmat:xu_enchanted_metal>.durabilityHandle = 250;
<ticmat:xu_enchanted_metal>.modifierHandle = 0.5;
<ticmat:xu_enchanted_metal>.durabilityExtra = 55;
//Evil Metal
scripts.helpers.addInjectionRecipe(<ore:ingotEvilMetal>.firstItem * 4, <minecraft:nether_star>, <liquid:liquid_nightmares> * 1000, 20000, 3);
<ticmat:xu_evil_metal>.durabilityHandle = 400;
<ticmat:xu_evil_metal>.modifierHandle = 0.9;

//Turn a drop of evil into Liquid Nightmares
scripts.helpers.addMeltingRecipe(<liquid:liquid_nightmares> * 1000, <extrautils2:ingredients:10>, 15000, 2);


print("### Extrautils2 Init Complete ###");
