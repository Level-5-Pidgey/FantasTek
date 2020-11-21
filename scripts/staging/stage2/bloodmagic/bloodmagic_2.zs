#priority 100
import scripts.staging.stages;

print("~~~ Begin Stage 2 Blood Magic Staging ~~~");

var stageString = stages.BloodMagic2.stage;

//Mod Staging
val BloodMagicMods = [
  "bloodmagic",
  "animus"
] as string[];

for modTag in BloodMagicMods
{
	for item in loadedMods[modTag].items
	{
		scripts.helpers.setItemAndRecipesStage(item, stageString);
	}
}

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage2BloodMagicItems = [

] as crafttweaker.item.IItemStack[];

for item in Stage2BloodMagicItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stageString);
}

print("### Stage 2 Blood Magic Complete ###");
