#priority 100
import scripts.staging.stages;

print("~~~ Begin Stage 2 Astral Sorcery Staging ~~~");

var stageString = stages.AstralSorcery2.stage;

//Mod Staging
for item in loadedMods["astralsorcery"].items
{
	scripts.helpers.setItemAndRecipesStage(item, stageString);
}

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage2AstralItems = [
] as crafttweaker.item.IItemStack[];

for item in Stage2AstralItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stageString);
}

print("### Stage 2 Astral Sorcery Complete ###");
