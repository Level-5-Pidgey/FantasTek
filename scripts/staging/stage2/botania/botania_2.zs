#priority 100
import scripts.staging.stages;

print("~~~ Begin Stage 2 Botania Staging ~~~");

var stageString = stages.Botania2.stage;

//Mod Staging
val BotainaMods = [
  "botania",
  "botania_tweaks"
] as string[];

for modTag in BotainaMods
{
	for item in loadedMods[modTag].items
	{
		scripts.helpers.setItemAndRecipesStage(item, stageString);
	}
}

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage2BotaniaMagicItems = [

] as crafttweaker.item.IItemStack[];

for item in Stage2BotaniaMagicItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stageString);
}

print("### Stage 2 Botania Complete ###");
