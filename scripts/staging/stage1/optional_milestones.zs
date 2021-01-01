#priority 50
import scripts.staging.stages;

print("~~~ Begin Stage 1 Optional Milestone Staging ~~~");

//Optional Slimesling Stage
val SlimeSlingItems = [
    <tconstruct:slime_boots>,
    <tconstruct:slime_boots:1>,
    <tconstruct:slime_boots:2>,
    <tconstruct:slime_boots:4>,
    <tconstruct:slime_boots:5>,
    <tconstruct:slimesling>,
    <tconstruct:slimesling:1>,
    <tconstruct:slimesling:2>,
    <tconstruct:slimesling:4>,
    <tconstruct:slimesling:5>,
    <tconstruct:slimesling:3>,
    <tconstruct:slime_boots:3>,
] as crafttweaker.item.IItemStack[];

for item in SlimeSlingItems
{
  mods.ItemStages.removeItemStage(item);
  mods.recipestages.Recipes.setRecipeStage(stages.Slimesling.stage, item);
  scripts.helpers.AddTooltip(item, ["Can only be crafted by those that have completed the \"Guide to Sticky Situations\" optional milestone.", "Makes for an effective method of early game transportation!"]);
}

print("### Stage 1 Optional Milestone Staging Complete ###");
