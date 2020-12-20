#priority 96
import scripts.staging.stages;

print("~~~ Begin Stage 1 Optional Milestone Staging ~~~");

//Optional Slimesling Stage
val SlimeSlingItems = [
    <tconstruct:slime_boots>,
    <tconstruct:slime_boots:1>,
    <tconstruct:slime_boots:2>,
    <tconstruct:slime_boots:4>,
    <tconstruct:slimesling>,
    <tconstruct:slimesling:1>,
    <tconstruct:slimesling:2>,
    <tconstruct:slimesling:4>,
    <tconstruct:slimesling:3>,
    <tconstruct:slime_boots:3>,
] as crafttweaker.item.IItemStack[];

for item in SlimeSlingItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stages.Slimesling.stage);
}

print("### Stage 1 Optional Milestone Staging Complete ###");
