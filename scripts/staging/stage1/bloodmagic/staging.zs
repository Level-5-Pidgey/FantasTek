#priority 100

print("~~~ Begin Stage 1 Blood Magic Staging ~~~");

//Variable for stage name so it's easy to change later
var stageName = "bloodmagic-i";

//Mod Staging
mods.ItemStages.stageModItems(stageName, "bloodmagic");
mods.ItemStages.stageModItems(stageName, "animus");

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage1BloodMagicItems = [

] as crafttweaker.item.IItemStack[];

for item in Stage1BloodMagicItems
{
  mods.ItemStages.removeItemStage(item);
  mods.ItemStages.addItemStage(stageName, item);
}

//Items that should not have a stage associated with them at all
val StageLessItems = [
  <guideapi:bloodmagic-guide>
] as crafttweaker.item.IItemStack[];

for item in StageLessItems
{
  mods.ItemStages.removeItemStage(item);
}

//Stage Liquid Life Essence
mods.ItemStages.stageLiquid(stageName, <liquid:lifeessence>);


print("### Stage 1 Blood Magic Complete ###");
