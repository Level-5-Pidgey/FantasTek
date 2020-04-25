#priority 99
import scripts.staging.stages;

print("~~~ Begin Stage 1 Blood Magic Staging ~~~");

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
