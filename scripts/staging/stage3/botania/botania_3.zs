#priority 101
import scripts.staging.stages;

print("~~~ Begin Stage 3 Botania Staging ~~~");

var stageString = stages.Botania3.stage;

//Mod Staging
val BotainaMods = [
  "botania",
  "botania_tweaks"
] as string[];

for modTag in BotainaMods
{
	mods.ItemStages.stageModItems(stageString, modTag);
}

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage3BotaniaMagicItems = [

] as crafttweaker.item.IItemStack[];

for item in Stage3BotaniaMagicItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stageString);
}

print("### Stage 3 Botania Complete ###");
