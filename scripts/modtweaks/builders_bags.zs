
print("~~~ Begin Builders Bags Init ~~~");

//Make t1 builders bag uncraftable (purchase only)
recipes.remove(<buildersbag:builders_bag_tier_one>);

//Change Recipes for builders bags
val buildBagRecipes = {
		<buildersbag:builders_bag_tier_two> : [[<ore:leather>, <ore:plateGold>, <ore:leather>], [<ore:gemDiamond>, <buildersbag:builders_bag_tier_one>, <ore:gemDiamond>], [<ore:leather>, <ore:plateGold>, <ore:leather>]],
		<buildersbag:builders_bag_tier_three> : [[<ore:leather>, <ore:platePulsatingIron>, <ore:leather>], [<ore:leather>, <buildersbag:builders_bag_tier_two>, <ore:leather>], [<ore:leather>, <ore:densePlatingQuartz>, <ore:leather>]],
		<buildersbag:builders_bag_tier_four> : [[<ore:crystalsPrismarine>, <ore:blockEmerald>, <ore:crystalsPrismarine>], [<ore:leather>, <buildersbag:builders_bag_tier_three>, <ore:leather>], [<ore:crystalsPrismarine>, <ore:densePlatingRedstone>, <ore:crystalsPrismarine>]],
		<buildersbag:builders_bag_tier_five> : [[<ore:leather>, <ore:chestEnder>, <ore:leather>], [<ore:leather>, <buildersbag:builders_bag_tier_four>, <ore:leather>], [<ore:leather>, <ore:densePlatingDiamond>, <ore:leather>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for bag, recipe in buildBagRecipes {
	recipes.remove(bag);
	mods.extendedcrafting.TableCrafting.addShaped(0, bag, recipe);
}

//Add tooltips for builders bags
var buildBagTooltips =
{
	<buildersbag:builders_bag_tier_one> : ["Cannot be crafted.", "Purchasable from the builder villager.", "Tier 1: Allows for block storage and placing of random blocks."],
	<buildersbag:builders_bag_tier_two> : ["Tier 1: Allows for block storage and placing of random blocks.", "Tier 2: Allows for automated chiseling of blocks."],
	<buildersbag:builders_bag_tier_three> : ["Tier 1: Allows for block storage and placing of random blocks.", "Tier 2: Allows for automated chiseling of blocks.", "Tier 3: Automatic LittleTiles block provider."],
	<buildersbag:builders_bag_tier_four> : ["Tier 1: Allows for block storage and placing of random blocks.", "Tier 2: Allows for automated chiseling of blocks.", "Tier 3: Automatic LittleTiles block provider.", "Tier 4: Crafts items as needed with resources in the bag to create the selected block."],
	<buildersbag:builders_bag_tier_five> : ["Tier 1: Allows for block storage and placing of random blocks.", "Tier 2: Allows for automated chiseling of blocks.", "Tier 3: Automatic LittleTiles block provider.", "Tier 4: Crafts items as needed with resources in the bag to create the selected block.", "Tier 5: Automatically provides items to the player's inventory using items in the bag."],
} as string[][crafttweaker.item.IItemStack];

for bag, tooltip in buildBagTooltips
{
	scripts.helpers.AddTooltip(bag, tooltip);
}

print("### Builders Bags Init Complete ###");
