#priority 99
import scripts.staging.stages;

print("~~~ Begin Stage 1 Embers Staging ~~~");

val Stage1EmbersItems = [
	<contenttweaker:crystal_ember_air>,
	<contenttweaker:crystal_ember_water>,
	<contenttweaker:crystal_ember_fire>,
	<contenttweaker:crystal_ember_earth>,
	<modulardiversity:blockemberinputhatch>,
	<modulardiversity:blockemberinputhatch:1>,
	<modulardiversity:blockemberoutputhatch>,
	<modulardiversity:blockemberoutputhatch:1>,
	<embers:stamp_bar>,
	<embers:stamp_flat>,
	<embers:stamp_plate>,
	<embers:stamp_gear>,
	<embers:stamp_bar_raw>,
	<embers:stamp_flat_raw>,
	<embers:stamp_plate_raw>,
	<embers:stamp_gear_raw>,
	<embers:dust_ember>,
	<embers:shard_ember>,
	<embers:crystal_ember>,
	<embers:mech_core>,
	<embers:ember_bore>,
	<embers:ember_activator>
] as crafttweaker.item.IItemStack[];

for item in Stage1EmbersItems
{
	mods.ItemStages.removeItemStage(item);
	scripts.helpers.setItemAndRecipesStage(item, stages.Embers1.stage);
}

//Items that should not have a stage associated with them at all
val StageLessItems = [
	<embers:brick_caminite>,
	<embers:blend_caminite>,
	<embers:plate_caminite>,
	<embers:plate_caminite_raw>,
	<embers:tinker_hammer>,
	<embers:block_caminite_brick_slab>,
	<embers:block_caminite_brick>,
	<embers:stairs_caminite_brick>,
	<embers:archaic_brick>,
	<embers:ancient_motive_core>,
	<embers:archaic_tile>,
	<embers:codex>,
	<embers:archaic_bricks>,
	<embers:pipe>,
	<embers:pump>,
	<embers:block_caminite_brick_slab_double>,
	<embers:ashen_tile_slab_double>,
	<embers:ashen_brick_slab_double>,
	<embers:ashen_stone_slab_double>,
	<embers:wall_ashen_tile>,
	<embers:wall_ashen_brick>,
	<embers:wall_ashen_stone>,
	<embers:wall_caminite_brick>,
	<embers:fluid_gauge>,
	<embers:caminite_lever>,
	<embers:sealed_planks>,
	<embers:wrapped_sealed_planks>,
	<embers:ore_copper>,
	<embers:ore_lead>,
	<embers:ore_silver>,
	<embers:ore_aluminum>,
	<embers:ore_nickel>,
	<embers:ore_tin>,
	<embers:ore_quartz>,
	<embers:block_tin>,
	<embers:block_nickel>,
	<embers:block_aluminum>,
	<embers:block_copper>,
	<embers:block_silver>,
	<embers:block_lead>,
	<embers:ingot_tin>,
	<embers:nugget_nickel>,
	<embers:ingot_copper>,
	<embers:ingot_lead>,
	<embers:ingot_silver>,
	<embers:nugget_tin>,
	<embers:nugget_copper>,
	<embers:nugget_lead>,
	<embers:nugget_silver>,
	<embers:ingot_aluminum>,
	<embers:nugget_aluminum>,
	<embers:ingot_nickel>,
	<embers:ashen_brick>,
	<embers:ashen_stone>,
	<embers:ashen_tile>,
	<embers:stairs_ashen_stone>,
	<embers:stairs_ashen_brick>,
	<embers:stairs_ashen_tile>,
	<embers:ashen_tile_slab>,
	<embers:ashen_brick_slab>,
	<embers:ashen_stone_slab>,
] as crafttweaker.item.IItemStack[];

for item in StageLessItems
{
  mods.ItemStages.removeItemStage(item);
}

print("### Stage 1 Embers Complete ###");
