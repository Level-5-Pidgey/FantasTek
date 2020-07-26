print("~~~ Begin xReliquary Init ~~~");

//Hide Unused Items
val lootItems =
[
	<xreliquary:salamander_eye>,
	<xreliquary:serpent_staff>,
	<xreliquary:sojourner_staff>,
	<xreliquary:magicbane>,
	<xreliquary:phoenix_down>,
	<xreliquary:pyromancer_staff>,
	<xreliquary:rod_of_lyssa>,
	<xreliquary:midas_touchstone>,
	<xreliquary:lantern_of_paranoia>,
	<xreliquary:kraken_shell>,
	<xreliquary:infernal_tear>,
	<xreliquary:infernal_claws>,
	<xreliquary:infernal_chalice>,
	<xreliquary:ice_magus_rod>,
	<xreliquary:harvest_rod>,
	<xreliquary:glacial_staff>,
	<xreliquary:fortune_coin>,
	<xreliquary:ender_staff>,
	<xreliquary:emperor_chalice>,
	<xreliquary:angelic_feather>,
	<xreliquary:mercy_cross>,
	<xreliquary:destruction_catalyst>,
	<xreliquary:gun_part:1>,
	<xreliquary:gun_part:2>,
	<xreliquary:gun_part>
] as crafttweaker.item.IItemStack[];

for item in lootItems
{
	recipes.remove(item);
	scripts.helpers.AddTooltip(item, ["This item can be found within dungeon chests!"]);
}

//Change Handgun Recipe
recipes.remove(<xreliquary:handgun>);
recipes.addShaped(scripts.helpers.createRecipeName(<xreliquary:handgun>), <xreliquary:handgun>, [[<xreliquary:gun_part:1>, <ore:ingotIron>, <xreliquary:gun_part:2>], [<ore:ingotIron>, <ore:gemDiamond>, <ore:ingotIron>], [<ore:plateSteel>, <xreliquary:gun_part>, <ore:plateSteel>]]);
print("### xReliquary Init Complete ###");



val reliquaryUncrafting =
[
	"xreliquary:items/uncrafting/wither_skull",
	"xreliquary:items/uncrafting/gold_nugget",
	"xreliquary:items/uncrafting/gunpowder_storm_eye",
	"xreliquary:items/uncrafting/blaze_rod",
	"xreliquary:items/uncrafting/magma_cream",
	"xreliquary:items/uncrafting/rotten_flesh",
	"xreliquary:items/uncrafting/prismarine_crystals",
	"xreliquary:items/uncrafting/glass_bottle",
	"xreliquary:items/uncrafting/snowball",
	"xreliquary:items/uncrafting/string",
	"xreliquary:items/uncrafting/stick",
	"xreliquary:items/uncrafting/ghast_tear",
	"xreliquary:items/uncrafting/gunpowder_creeper_gland",
	"xreliquary:items/uncrafting/ink_sac",
	"xreliquary:items/uncrafting/packed_ice",
	"xreliquary:items/uncrafting/slime_ball",
	"xreliquary:items/uncrafting/sugar",
	"xreliquary:items/uncrafting/ender_pearl",
	"xreliquary:items/uncrafting/bone",
	"xreliquary:items/uncrafting/redstone",
	"xreliquary:items/uncrafting/gunpowder_witch_hat",
	"xreliquary:items/uncrafting/glowstone_dust",
	"xreliquary:items/uncrafting/spider_eye",
	"xreliquary:items/uncrafting/prismarine_shard",
] as string[];

for item in reliquaryUncrafting
{
	recipes.removeByRecipeName(item);
}

val reliquaryRecrafting = {
	<minecraft:bone> * 5 : [<xreliquary:mob_ingredient>],
	<minecraft:dye:15> * 24 : [<xreliquary:mob_ingredient>, <xreliquary:mob_ingredient>],
	<minecraft:skull:1> : [<xreliquary:mob_ingredient:1>, <xreliquary:mob_ingredient:1>, <xreliquary:mob_ingredient:1>, <minecraft:skull>],
	<minecraft:fermented_spider_eye> * 4 : [<xreliquary:mob_ingredient:2>, <xreliquary:mob_ingredient:2>, <xreliquary:mob_ingredient:2>],
	<minecraft:spider_eye> * 3 : [<xreliquary:mob_ingredient:2>, <xreliquary:mob_ingredient:2>],
	<minecraft:string> * 6 : [<xreliquary:mob_ingredient:2>],
	<minecraft:gunpowder> * 6 : [<xreliquary:mob_ingredient:3>],
	<minecraft:ghast_tear> : [<xreliquary:mob_ingredient:3>, <xreliquary:mob_ingredient:3>, <xreliquary:mob_ingredient:3>],
	<ore:dustSulfur>.firstItem * 3 : [<xreliquary:mob_ingredient:3>, <ore:blockCoal>.firstItem],
	<minecraft:slime_ball> * 8 : [<xreliquary:mob_ingredient:4>],
	<minecraft:magma_cream> * 6 : [<xreliquary:mob_ingredient:4>, <ore:rodBlaze>.firstItem],
	<minecraft:rotten_flesh> * 6 : [<xreliquary:mob_ingredient:6>],
	<ore:nuggetGold>.firstItem * 15 : [<xreliquary:mob_ingredient:6>, <ore:ingotGold>.firstItem],
	<ore:rodBlaze>.firstItem * 4 : [<xreliquary:mob_ingredient:7>, <xreliquary:mob_ingredient:7>],
	<minecraft:prismarine_crystals> * 4 : [<xreliquary:mob_ingredient:16>, <xreliquary:mob_ingredient:16>],
	<minecraft:prismarine_shard> * 8 : [<xreliquary:mob_ingredient:16>],
	<minecraft:snowball> * 16 : [<xreliquary:mob_ingredient:10>],
	<minecraft:packed_ice> * 3 : [<xreliquary:mob_ingredient:10>, <ore:ice>.firstItem, <ore:ice>.firstItem, <ore:ice>.firstItem, <ore:ice>.firstItem, <ore:ice>.firstItem],
	<ore:enderpearl>.firstItem * 4 : [<xreliquary:mob_ingredient:11>],
	<minecraft:dye> * 8 : [<xreliquary:mob_ingredient:12>],
	<minecraft:gunpowder> * 4 : [<xreliquary:witch_hat>, <minecraft:gunpowder>],
	<minecraft:sugar> * 4 : [<xreliquary:witch_hat>, <minecraft:sugar>],
	<minecraft:redstone> * 4 : [<xreliquary:witch_hat>, <minecraft:redstone>],
	<minecraft:glowstone_dust> * 4 : [<xreliquary:witch_hat>, <minecraft:glowstone_dust>],
} as crafttweaker.item.IItemStack[][crafttweaker.item.IItemStack];

for key, value in reliquaryRecrafting {
	mods.bloodmagic.AlchemyTable.addRecipe(key, value, 128, 40, 0);
}
