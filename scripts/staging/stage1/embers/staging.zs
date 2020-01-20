#priority 99
import scripts.staging.stages;

print("~~~ Begin Stage 1 Embers Staging ~~~");

//Mod Staging
mods.ItemStages.stageModItems(stages.Embers1.stage, "embers");

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage1EmbersItems = [

] as crafttweaker.item.IItemStack[];

for item in Stage1EmbersItems
{
  mods.ItemStages.removeItemStage(item);
  mods.ItemStages.addItemStage(stages.Embers1.stage, item);
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
  <embers:wrapped_sealed_planks>
] as crafttweaker.item.IItemStack[];

for item in StageLessItems
{
  mods.ItemStages.removeItemStage(item);
}

print("### Stage 1 Embers Complete ###");
