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
	<contenttweaker:sanguine_gem_air>,
	<contenttweaker:sanguine_gem_water>,
	<contenttweaker:sanguine_gem_fire>,
	<contenttweaker:sanguine_gem_earth>,
	<contenttweaker:sanguine_ingot>,
	<contenttweaker:sanguine_gem>
] as crafttweaker.item.IItemStack[];

for item in Stage1BloodMagicItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stages.BloodMagic1.stage);
}

//Items that should not have a stage associated with them at all
val StageLessItems = [
  <guideapi:bloodmagic-guide>
] as crafttweaker.item.IItemStack[];

for item in StageLessItems
{
  mods.ItemStages.removeItemStage(item);
}

print("### Stage 1 Blood Magic Complete ###");
