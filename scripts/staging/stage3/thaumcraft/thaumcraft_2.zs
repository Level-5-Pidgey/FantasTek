#priority 100
import scripts.staging.stages;

print("~~~ Begin Stage 3 Thaumcraft Staging ~~~");

var stageString = stages.Thaumcraft2.stage;

//Mod Staging
val ThaumcraftMods = [
  "thaumicperiphery",
  "thaumcraft"
] as string[];

for modTag in ThaumcraftMods
{
	mods.ItemStages.stageModItems(stageString, modTag);
}

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage3ThaumcraftMagicItems = [

] as crafttweaker.item.IItemStack[];

for item in Stage3ThaumcraftMagicItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stageString);
}

print("### Stage 3 Thaumcraft Complete ###");
