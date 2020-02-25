#priority 99
import scripts.staging.stages;

print("~~~ Begin Stage 1 Blood Magic Staging ~~~");

//Mod Staging
mods.ItemStages.stageModItems(stages.BloodMagic1.stage, "bloodmagic");
mods.ItemStages.stageModItems(stages.BloodMagic1.stage, "animus");

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage1BloodMagicItems = [

] as crafttweaker.item.IItemStack[];

for item in Stage1BloodMagicItems
{
  mods.ItemStages.removeItemStage(item);
  mods.ItemStages.addItemStage(stages.BloodMagic1.stage, item);
}

//Items that should not have a stage associated with them at all
val StageLessItems = [
  <guideapi:bloodmagic-guide>
] as crafttweaker.item.IItemStack[];

for item in StageLessItems
{
  mods.ItemStages.removeItemStage(item);
}

//Stage Sanguine Crystals
mods.ItemStages.addItemStage(stages.BloodMagic1.stage, <contenttweaker:sanguine_gem_air>);
mods.ItemStages.addItemStage(stages.BloodMagic1.stage, <contenttweaker:sanguine_gem_water>);
mods.ItemStages.addItemStage(stages.BloodMagic1.stage, <contenttweaker:sanguine_gem_fire>);
mods.ItemStages.addItemStage(stages.BloodMagic1.stage, <contenttweaker:sanguine_gem_earth>);

//Stage Sanguine Ingot
mods.ItemStages.addItemStage(stages.BloodMagic1.stage, <contenttweaker:sanguine_ingot>);

//Stage Sanguine Gem
mods.ItemStages.addItemStage(stages.BloodMagic1.stage, <contenttweaker:sanguine_gem>);

print("### Stage 1 Blood Magic Complete ###");
