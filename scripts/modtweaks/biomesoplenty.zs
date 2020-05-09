
print("~~~ Begin Biomes O Plenty Init ~~~");

//Remove kinda-op Ash Recipes.
recipes.removeByRecipeName("biomesoplenty:gray_dye_from_ash");
recipes.removeByRecipeName("biomesoplenty:coal_from_ash");

//Add Ash to oredict.
<ore:dustAsh>.add(<biomesoplenty:ash>);

//Add tooltips to biome gems.
var biomeGems =
[
<biomesoplenty:gem_ore:1>,
<biomesoplenty:gem_ore:2>,
<biomesoplenty:gem_ore:3>,
<biomesoplenty:gem_ore:4>,
<biomesoplenty:gem_ore:5>,
<biomesoplenty:gem_ore:6>,
<biomesoplenty:gem_ore:7>,
<minecraft:emerald_ore>
] as crafttweaker.item.IItemStack[];

for gem in biomeGems
{
	scripts.helpers.AddTooltip(gem, [""]);
}
print("### Biomes O Plenty Init Complete ###");
