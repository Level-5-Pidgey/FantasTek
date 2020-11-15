#priority 100
import scripts.staging.stages;

print("~~~ Begin Stage 2 Embers Staging ~~~");

var stageString = stages.Embers2.stage;

//Mod Staging
mods.ItemStages.stageModItems(stageString, "embers");

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage2EmbersMagicItems = [
	<modulardiversity:blockemberinputhatch:2>,
	<modulardiversity:blockemberinputhatch:3>,
	<modulardiversity:blockemberinputhatch:4>,
	<modulardiversity:blockemberinputhatch:5>,
	<modulardiversity:blockemberinputhatch:6>,
	<modulardiversity:blockemberinputhatch:7>,
	<modulardiversity:blockemberoutputhatch:2>,
	<modulardiversity:blockemberoutputhatch:3>,
	<modulardiversity:blockemberoutputhatch:4>,
	<modulardiversity:blockemberoutputhatch:5>,
	<modulardiversity:blockemberoutputhatch:6>,
	<modulardiversity:blockemberoutputhatch:7>
] as crafttweaker.item.IItemStack[];

for item in Stage2EmbersMagicItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stageString);
}

print("### Stage 2 Embers Complete ###");
