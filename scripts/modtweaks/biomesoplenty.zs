
print("~~~ Begin Biomes O Plenty Init ~~~");

//Remove kinda-op Ash Recipes.
recipes.removeByRecipeName("biomesoplenty:gray_dye_from_ash");
recipes.removeByRecipeName("biomesoplenty:coal_from_ash");

//Add Ash to oredict.
<ore:dustAsh>.add(<biomesoplenty:ash>);

//Add tooltips to biome gems.
var biomeGems =
[
	<ore:oreRuby>.firstItem,
	<ore:orePeridot>.firstItem,
	<ore:oreTopaz>.firstItem,
	<ore:oreTanzanite>.firstItem,
	<ore:oreMalachite>.firstItem,
	<ore:oreSapphire>.firstItem,
	<ore:oreAmber>.firstItem,
	<ore:oreEmerald>.firstItem,
	<ore:gemRuby>.firstItem,
	<ore:gemPeridot>.firstItem,
	<ore:gemTopaz>.firstItem,
	<ore:gemTanzanite>.firstItem,
	<ore:gemMalachite>.firstItem,
	<ore:gemSapphire>.firstItem,
	<ore:gemAmber>.firstItem,
	<ore:gemEmerald>.firstItem,
	<ore:blockRuby>.firstItem,
	<ore:blockPeridot>.firstItem,
	<ore:blockTopaz>.firstItem,
	<ore:blockTanzanite>.firstItem,
	<ore:blockMalachite>.firstItem,
	<ore:blockSapphire>.firstItem,
	<ore:blockAmber>.firstItem,
	<ore:blockEmerald>.firstItem,
] as crafttweaker.item.IItemStack[];

for gem in biomeGems
{
	scripts.helpers.AddTooltip(gem, ["Biome Gem.", "Can be found in various biomes underground!"]);
}

print("### Biomes O Plenty Init Complete ###");
