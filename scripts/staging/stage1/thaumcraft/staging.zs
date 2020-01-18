#priority 100

print("~~~ Begin Stage 1 Thaumcraft Staging ~~~");

//Variable for stage name so it's easy to change later
var stageName = "thaumcraft-i";

//Mod Staging
mods.ItemStages.stageModItems(stageName, "thaumcraft");
mods.ItemStages.stageModItems(stageName, "thaumicperiphery");

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage1ThaumcraftItems = [

] as crafttweaker.item.IItemStack[];

for item in Stage1ThaumcraftItems
{
  mods.ItemStages.removeItemStage(item);
  mods.ItemStages.addItemStage(stageName, item);
}

//Items that should not have a stage associated with them at all
val StageLessItems = [
  <thaumcraft:thaumonomicon>,
  <thaumcraft:salis_mundus>,
  <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}),
  <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}),
  <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}),
  <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]}),
  <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]}),
  <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]}),
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
  <thaumcraft:crystal_aer>,
  <thaumcraft:crystal_ignis>,
  <thaumcraft:crystal_aqua>,
  <thaumcraft:crystal_terra>,
  <thaumcraft:crystal_ordo>,
  <thaumcraft:crystal_perditio>,
  <thaumcraft:flesh_block>,
  <thaumcraft:loot_bag>,
  <thaumcraft:loot_bag:1>,
  <thaumcraft:loot_bag:2>,
  <thaumcraft:brain>,
  <thaumcraft:brain>,
  <thaumcraft:crystal_vitium>
] as crafttweaker.item.IItemStack[];

for item in StageLessItems
{
  mods.ItemStages.removeItemStage(item);
}

//Stage Thaumcraft Liquids
mods.ItemStages.stageLiquid(stageName, <liquid:liquid_death>);
mods.ItemStages.stageLiquid(stageName, <liquid:purifying_fluid>);

print("### Stage 1 Thaumcraft Complete ###");
