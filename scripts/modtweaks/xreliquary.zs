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
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<xreliquary:handgun>), scripts.helpers.stages.progression2.stage, <xreliquary:handgun>, [[<xreliquary:gun_part:1>, <ore:ingotIron>, <xreliquary:gun_part:2>], [<ore:ingotIron>, <ore:gemDiamond>, <ore:ingotIron>], [<ore:plateSteel>, <xreliquary:gun_part>, <ore:plateSteel>]]);

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
	<minecraft:packed_ice> * 8 : [<xreliquary:mob_ingredient:10>, <ore:ice>.firstItem, <ore:ice>.firstItem, <ore:ice>.firstItem, <ore:ice>.firstItem, <ore:ice>.firstItem],
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

//Hide useless crafting components
val xreliquaryHide =
[
	<xreliquary:mob_ingredient:13>,
	<xreliquary:mob_ingredient:14>
] as crafttweaker.item.IItemStack[];

for xreliquaryItem in xreliquaryHide
{
	scripts.helpers.unstageAndHide(xreliquaryItem);
}

//Basic Crafting Table Items
val xreliquaryRecipes_EXTENDEDCRAFTING = {
	<xreliquary:fortune_coin> : [[<ore:ingotNetherite>, <ore:plateGold>, <ore:ingotNetherite>], [<ore:plateGold>, <minecraft:shulker_shell>, <ore:plateGold>], [<ore:ingotNetherite>, <ore:plateGold>, <ore:ingotNetherite>]],
	<xreliquary:handgun> : [[<xreliquary:gun_part:1>, <ore:ingotIron>, <xreliquary:gun_part:2>], [<ore:ingotIron>, <ore:gemDiamond>, <ore:ingotIron>], [<ore:plateCrudeSteel>, <xreliquary:gun_part>, <ore:plateCrudeSteel>]],
	<xreliquary:angelheart_vial> : [[<ore:paneGlass>, <ore:plankWood>, <ore:paneGlass>], [<ore:paneGlass>, <minecraft:totem_of_undying>, <ore:paneGlass>], [null, <ore:paneGlass>, null]],
	<xreliquary:apothecary_cauldron> : [[<bountifulbaubles:spectralsilt>, <ore:dustGlowstone>, <bountifulbaubles:spectralsilt>], [<ore:dustRedstone>, <minecraft:cauldron>, <ore:dustRedstone>], [<bountifulbaubles:spectralsilt>, <ore:dustGlowstone>, <bountifulbaubles:spectralsilt>]],
	<xreliquary:apothecary_mortar> : [[<ore:stickIron>, <bountifulbaubles:spectralsilt>, null], [<ore:ingotIron>, <ore:stickIron>, <ore:ingotIron>], [<ore:blockQuartz>, <ore:blockQuartz>, <ore:blockQuartz>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in xreliquaryRecipes_EXTENDEDCRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

//Create Crimson Cloths
scripts.helpers.addInjectionRecipe(<xreliquary:mob_ingredient:15>, <minecraft:wool:14> * 2, <liquid:liquid_nightmares> * 500, 15000, 3);

//Create Relics w/ Fluid Injection
val xreliquaryRecipes_INJECTION = {
	[<xreliquary:void_tear>, <xreliquary:infernal_tear>] : <liquid:liquid_nightmares> * 1000,
	[<xreliquary:interdiction_torch>, <minecraft:torch>] : <liquid:liquid_nightmares> * 1000,
	[<xreliquary:wraith_node>, <xreliquary:mob_ingredient:11>] : <liquid:aerotheum> * 250,
	[<xreliquary:hero_medallion>, <xreliquary:fortune_coin>] : <liquid:elemental_mix> * 1000,
	[<xreliquary:shears_of_winter>, <thermalfoundation:tool.shears_diamond>] : <liquid:cryotheum> * 1000,
} as crafttweaker.liquid.ILiquidStack[crafttweaker.item.IIngredient[]];

for key, value in xreliquaryRecipes_INJECTION {
	var inputAsStack as crafttweaker.item.IItemStack = key[0].items[0];
	recipes.remove(inputAsStack);
	scripts.helpers.addInjectionRecipe(inputAsStack, key[1], value, 150000, 3);
}

val xreliquary_EXTENDEDCRAFTING_T2 = {
	<xreliquary:rending_gale>
								:	[[null, <xreliquary:mob_ingredient:5>, <xreliquary:mob_ingredient:8>],
									[null, <ore:stickGold>, <xreliquary:mob_ingredient:5>],
  									[<ore:stickGold>, null, null],
									[<ore:feather>, <bountifulbaubles:spectralsilt>, <ore:dustAerotheum>]],
	<xreliquary:twilight_cloak>
								:	[[<ore:ingotSilver>, null, <ore:ingotSilver>],
									[<ore:woolBlack>, <xreliquary:mob_ingredient:15>, <ore:woolBlack>],
  									[<ore:woolBlack>, <xreliquary:mob_ingredient:15>, <ore:woolBlack>],
									[null, null, <ore:ingotEvilMetal>]],
	<xreliquary:witherless_rose>
								:	[[<ore:dustPetrotheum>, <thermalfoundation:fertilizer:2>, <ore:dustPetrotheum>],
									[<thermalfoundation:fertilizer:2>, <minecraft:double_plant:4>, <thermalfoundation:fertilizer:2>],
  									[<ore:dustPetrotheum>, <thermalfoundation:fertilizer:2>, <ore:dustPetrotheum>],
									[null, null, <ore:ingotEvilMetal>]],
	<xreliquary:altar>
								:	[[<ore:obsidian>, <ore:dustRedstone>, <ore:obsidian>],
									[<ore:dustRedstone>, <ore:glowstone>, <ore:dustRedstone>],
  									[<ore:obsidian>, <ore:dustRedstone>, <ore:obsidian>],
									[null, null, <ore:dustMana>]],
	<xreliquary:fertile_lilypad>
								:	[[<ore:plateApatite>, <ore:dustPetrotheum>, <ore:plateApatite>],
									[<ore:dustPetrotheum>, <minecraft:waterlily>, <ore:dustPetrotheum>],
  									[<ore:plateApatite>, <ore:dustPetrotheum>, <ore:plateApatite>],
									[null, null, <thermalfoundation:fertilizer:2>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in xreliquary_EXTENDEDCRAFTING_T2 {
	recipes.remove(key.withAmount(1));
	scripts.helpers.createAdvancedCraftingRecipe(key, value, value[3][0], value[3][1], value[3][2], "", true);
}

//Add Recipe to Crimson Cloth
recipes.remove(<xreliquary:mob_ingredient:15>);
mods.nuclearcraft.infuser.addRecipe(<ore:woolRed> * 2, <liquid:liquid_nightmares> * 1000, <xreliquary:mob_ingredient:15>);
mods.thermalexpansion.Transposer.addFillRecipe(<xreliquary:mob_ingredient:15>, <ore:woolRed>.firstItem * 2, <liquid:liquid_nightmares> * 1000, 25000);
scripts.mmhelper.IndustrialMixerFactoryRecipe(scripts.helpers.createRecipeName(<xreliquary:mob_ingredient:15>) ~ <liquid:liquid_nightmares>.name, 25000, 125, null, null, <liquid:liquid_nightmares> * 1000, null, null, null, <ore:woolRed>.firstItem * 2, null, <xreliquary:mob_ingredient:15>);

print("### xReliquary Init Complete ###");
