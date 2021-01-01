#priority 101
import scripts.staging.stages;

print("~~~ Begin Stage 3 Blood Magic Staging ~~~");

var stageString = stages.BloodMagic3.stage;

//Mod Staging
val BloodMagicMods = [
  "bloodmagic",
  "animus"
] as string[];

for modTag in BloodMagicMods
{
	mods.ItemStages.stageModItems(stageString, modTag);
}

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage3BloodMagicItems = [

] as crafttweaker.item.IItemStack[];

for item in Stage3BloodMagicItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stageString);
}

print("### Stage 3 Blood Magic Complete ###");
