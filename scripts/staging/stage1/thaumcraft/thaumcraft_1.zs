#priority 99
import scripts.staging.stages;

print("~~~ Begin Stage 1 Thaumcraft Staging ~~~");

val Stage1ThaumcraftItems = [
	<contenttweaker:salis_mundus_air>,
	<contenttweaker:salis_mundus_water>,
	<contenttweaker:salis_mundus_fire>,
	<contenttweaker:salis_mundus_earth>
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
	<thaumcraft:crimson_praetor_legs>
] as crafttweaker.item.IItemStack[];

for item in StageLessItems
{
  mods.ItemStages.removeItemStage(item);
}

print("### Stage 1 Thaumcraft Complete ###");
