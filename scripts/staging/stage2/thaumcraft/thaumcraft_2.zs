#priority 100
import scripts.staging.stages;

print("~~~ Begin Stage 2 Thaumcraft Staging ~~~");

var stageString = stages.Thaumcraft2.stage;

//Mod Staging
mods.ItemStages.stageModItems(stageString, "thaumcraft");
mods.ItemStages.stageModItems(stageString, "thaumicperiphery");

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage2ThaumcraftMagicItems = [

] as crafttweaker.item.IItemStack[];

for item in Stage2ThaumcraftMagicItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stageString);
}

print("### Stage 2 Thaumcraft Complete ###");
