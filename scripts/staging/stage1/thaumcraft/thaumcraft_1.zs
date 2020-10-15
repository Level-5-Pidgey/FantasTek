#priority 99
import scripts.staging.stages;

print("~~~ Begin Stage 1 Thaumcraft Staging ~~~");

val Stage1ThaumcraftItems = [
	<contenttweaker:salis_mundus_air>,
	<contenttweaker:salis_mundus_water>,
	<contenttweaker:salis_mundus_fire>,
	<contenttweaker:salis_mundus_earth>,
	<thaumcraft:crystal_essence>,
	<thaumcraft:arcane_workbench>,
	<thaumcraft:salis_mundus>,
] as crafttweaker.item.IItemStack[];

for item in Stage1ThaumcraftItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stages.Thaumcraft1.stage);
}

//Items that should not have a stage associated with them at all
val StageLessItems = [
	<thaumcraft:thaumonomicon>,
	<thaumcraft:shimmerleaf>,
	<thaumcraft:cinderpearl>,
	<thaumcraft:vishroom>,
	<thaumcraft:log_greatwood>,
	<thaumcraft:log_silverwood>,
	<thaumcraft:plank_greatwood>,
	<thaumcraft:plank_silverwood>,
	<thaumcraft:slab_greatwood>,
	<thaumcraft:slab_silverwood>,
	<thaumcraft:sapling_greatwood>,
	<thaumcraft:sapling_silverwood>,
	<thaumcraft:leaves_greatwood>,
	<thaumcraft:leaves_silverwood>,
	<thaumcraft:stairs_greatwood>,
	<thaumcraft:stairs_silverwood>,
	<thaumcraft:table_wood>,
	<thaumcraft:table_stone>,
	<thaumcraft:taint_fibre>,
	<thaumcraft:taint_crust>,
	<thaumcraft:taint_soil>,
	<thaumcraft:taint_rock>,
	<thaumcraft:taint_geyser>,
	<thaumcraft:taint_feature>,
	<thaumcraft:taint_log>,
	<thaumcraft:flesh_block>,
	<thaumcraft:loot_bag>,
	<thaumcraft:loot_bag:1>,
	<thaumcraft:loot_bag:2>,
	<thaumcraft:brain>,
	<thaumcraft:brain>,
	<thaumcraft:ore_quartz>,
	<thaumcraft:nugget:5>,
	<thaumcraft:quicksilver>,
	<thaumcraft:loot_urn_common>,
	<thaumcraft:loot_urn_uncommon>,
	<thaumcraft:loot_urn_rare>,
	<thaumcraft:loot_crate_common>,
	<thaumcraft:loot_crate_uncommon>,
	<thaumcraft:loot_crate_rare>,
	<thaumcraft:crimson_plate_helm>,
	<thaumcraft:crimson_plate_chest>,
	<thaumcraft:crimson_plate_legs>,
	<thaumcraft:crimson_boots>,
	<thaumcraft:crimson_robe_helm>,
	<thaumcraft:crimson_robe_chest>,
	<thaumcraft:crimson_robe_legs>,
	<thaumcraft:crimson_praetor_helm>,
	<thaumcraft:crimson_praetor_chest>,
	<thaumcraft:crimson_praetor_legs>,
	<thaumcraft:table_wood>,
	<thaumcraft:table_stone>,
	<thaumcraft:stone_porous>,
	<thaumcraft:candle_white>,
	<thaumcraft:candle_orange>,
	<thaumcraft:candle_magenta>,
	<thaumcraft:candle_lightblue>,
	<thaumcraft:candle_yellow>,
	<thaumcraft:candle_lime>,
	<thaumcraft:candle_pink>,
	<thaumcraft:candle_gray>,
	<thaumcraft:candle_silver>,
	<thaumcraft:candle_cyan>,
	<thaumcraft:candle_purple>,
	<thaumcraft:candle_blue>,
	<thaumcraft:candle_brown>,
	<thaumcraft:candle_green>,
	<thaumcraft:candle_red>,
	<thaumcraft:candle_black>,
	<thaumcraft:banner_white>,
	<thaumcraft:banner_orange>,
	<thaumcraft:banner_magenta>,
	<thaumcraft:banner_lightblue>,
	<thaumcraft:banner_yellow>,
	<thaumcraft:banner_lime>,
	<thaumcraft:banner_pink>,
	<thaumcraft:banner_gray>,
	<thaumcraft:banner_silver>,
	<thaumcraft:banner_cyan>,
	<thaumcraft:banner_purple>,
	<thaumcraft:banner_blue>,
	<thaumcraft:banner_brown>,
	<thaumcraft:banner_green>,
	<thaumcraft:banner_red>,
	<thaumcraft:banner_black>,
	<thaumcraft:banner_crimson_cult>,
] as crafttweaker.item.IItemStack[];

for item in StageLessItems
{
  mods.ItemStages.removeItemStage(item);
}

print("### Stage 1 Thaumcraft Complete ###");
