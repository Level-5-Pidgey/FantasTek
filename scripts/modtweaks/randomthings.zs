
print("~~~ Begin Random Things Init ~~~");

//Make these Specified Items Shop-Only
val shopItems =
[
  <randomthings:onlinedetector>,
  <randomthings:chatdetector>,
  <randomthings:enderbridge>,
  <randomthings:blockdestabilizer>,
  <randomthings:soundbox>,
  <randomthings:sounddampener>,
  <randomthings:globalchatdetector>,
  <randomthings:contactbutton>,
  <randomthings:contactlever>,
  <randomthings:rainshield>,
  <randomthings:potionvaporizer>,
  <randomthings:advancedredstonerepeater>,
  <randomthings:advancedredstonetorch_on>,
  <randomthings:basicredstoneinterface>,
  <randomthings:advancedredstoneinterface>,
  <randomthings:sidedredstone>,
  <randomthings:portablesounddampener>,
  <randomthings:redstoneremote>,
  <randomthings:chunkanalyzer>,
  <randomthings:enderanchor>,
  <randomthings:spectrelens>,
  <randomthings:soundrecorder>,
  <randomthings:soundpattern>
] as crafttweaker.item.IItemStack[];

for item in shopItems
{
	recipes.remove(item);
	scripts.helpers.AddTooltip(item, ["Cannot be crafted.", "Purchasable from various villagers."]);
}

//Craft Nature Cores
for wood in <ore:logWood>.items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <randomthings:naturecore>, [[wood, <ore:plateEmerald>.firstItem, wood], [<ore:plateEmerald>.firstItem, <botania:overgrowthseed>, <ore:plateEmerald>.firstItem], [wood, <ore:plateEmerald>.firstItem, wood]]);
}

//Hide Items from Mod
val randomthingsItem =
[
	<randomthings:enderletter>,
    <randomthings:endermailbox>,
    <randomthings:itemcollector>,
    <randomthings:biomecrystal>,
    <randomthings:ingredient:4>,
    <randomthings:biomeradar>,
    <randomthings:ingredient:1>,
    <randomthings:summoningpendulum>
] as crafttweaker.item.IItemStack[];

for randomthingsToHide in randomthingsItem
{
	scripts.helpers.unstageAndHide(randomthingsToHide);
}

//Crafting Table Recipes
val randomthingsRecipes_CRAFTINGTABLE = {
	<randomthings:lightredirector> : [[<ore:plankWood>, <ore:dustGlowstone>, <ore:plankWood>], [<ore:dustGlowstone>, <ore:blockGlassColorless>, <ore:dustGlowstone>], [<ore:plankWood>, <ore:dustGlowstone>, <ore:plankWood>]],
	<randomthings:imbuingstation> : [[<ore:dustGlowstone>, <ore:dustGlowstone>, <ore:dustGlowstone>], [<ore:treeLeaves>, <minecraft:brewing_stand>, <ore:treeLeaves>], [<ore:ingotGold>, <ore:ingotGold>, <ore:ingotGold>]],
	<randomthings:biomestone> * 8 : [[<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>], [<ore:cobblestone>, <ore:gemMoon>, <ore:cobblestone>], [<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>]],
	<randomthings:biomestone:1> * 8 : [[<minecraft:stone>, <minecraft:stone>, <minecraft:stone>], [<minecraft:stone>, <ore:gemMoon>, <minecraft:stone>], [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]],
	<randomthings:biomestone:2> * 8 : [[<minecraft:stonebrick>, <minecraft:stonebrick>, <minecraft:stonebrick>], [<minecraft:stonebrick>, <ore:gemMoon>, <minecraft:stonebrick>], [<minecraft:stonebrick>, <minecraft:stonebrick>, <minecraft:stonebrick>]],
	<randomthings:biomestone:3> * 8 : [[<minecraft:stonebrick:2>, <minecraft:stonebrick:2>, <minecraft:stonebrick:2>], [<minecraft:stonebrick:2>, <ore:gemMoon>, <minecraft:stonebrick:2>], [<minecraft:stonebrick:2>, <minecraft:stonebrick:2>, <minecraft:stonebrick:2>]],
	<randomthings:biomestone:4> * 8 : [[<minecraft:stonebrick:3>, <minecraft:stonebrick:3>, <minecraft:stonebrick:3>], [<minecraft:stonebrick:3>, <ore:gemMoon>, <minecraft:stonebrick:3>], [<minecraft:stonebrick:3>, <minecraft:stonebrick:3>, <minecraft:stonebrick:3>]],
	<randomthings:biomeglass> * 8 : [[<ore:blockGlassColorless>, <ore:blockGlassColorless>, <ore:blockGlassColorless>], [<ore:blockGlassColorless>, <ore:gemMoon>, <ore:blockGlassColorless>], [<ore:blockGlassColorless>, <ore:blockGlassColorless>, <ore:blockGlassColorless>]],
	<randomthings:blockbreaker> : [[<minecraft:stone>, <quark:iron_rod>, <minecraft:stone>], [<minecraft:stone>, <ore:gearRedstoneAlloy>, <minecraft:stone>], [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in randomthingsRecipes_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Extended Crafting Recipes
val randomthingsRecipes_EXTENDEDCRAFTING = {
	<randomthings:irondropper> : [[<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>], [<ore:nuggetIron>, <minecraft:dropper>, <ore:nuggetIron>], [<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>]],
	<randomthings:igniter> : [[<ore:netherrack>, <ore:stone>, <ore:stone>], [<ore:netherrack>, <minecraft:flint_and_steel>, <ore:stone>], [<ore:netherrack>, <ore:stone>, <ore:stone>]],
	<randomthings:advanceditemcollector> : [[null, <ore:dustGlowstone>, null], [<ore:dustGlowstone>, <openblocks:vacuum_hopper>, <ore:dustGlowstone>], [null, <ore:dustGlowstone>, null]],
	//<openblocks:projector> : [[null, null, null], [null, null, null], [null, null, null]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in randomthingsRecipes_EXTENDEDCRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

//Fertilized Dirt
recipes.remove(<randomthings:fertilizeddirt>);
for rune in scripts.helpers.AllEarthT1Items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <randomthings:fertilizeddirt> * 4, [[<forestry:fertilizer_compound>, <ore:dirt>, <forestry:fertilizer_compound>], [<ore:dirt>, rune, <ore:dirt>], [<forestry:fertilizer_compound>, <ore:dirt>, <forestry:fertilizer_compound>]]);
}

//Item Collector
recipes.remove(<randomthings:advanceditemcollector>);
for rune in scripts.helpers.AllAirT1Items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <randomthings:advanceditemcollector>, [[<ore:dustGlowstone>, rune, <ore:dustGlowstone>], [<ore:ingotPulsatingIron>, <minecraft:hopper>, <ore:ingotPulsatingIron>], [<ore:obsidian>, scripts.helpers.FrameTiers[0], <ore:obsidian>]]);
}

print("### Random Things Init Complete ###");
