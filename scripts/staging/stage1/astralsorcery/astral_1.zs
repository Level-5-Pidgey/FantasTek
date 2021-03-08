#priority 100
import scripts.staging.stages;

print("~~~ Begin Stage 1 Astral Sorcery Staging ~~~");

var stageString = stages.AstralSorcery1.stage;

//Mod Staging
for item in loadedMods["astralsorcery"].items {
    mods.ItemStages.removeItemStage(item);
    scripts.helpers.setItemAndRecipesStage(item, stageString);
}
mods.ItemStages.stageModItems(stageString, "astralsorcery");

//Items that should not have a stage associated with them at all
val StageLessItems = [
  <astralsorcery:blockcustomflower>,
  <astralsorcery:blockblackmarble>,
  <astralsorcery:blockblackmarble:1>,
  <astralsorcery:blockblackmarble:2>,
  <astralsorcery:blockblackmarble:3>,
  <astralsorcery:blockblackmarble:4>,
  <astralsorcery:blockblackmarble:5>,
  <astralsorcery:blockblackmarble:6>,
  <astralsorcery:blockmarble>,
  <astralsorcery:blockmarble:1>,
  <astralsorcery:blockmarble:2>,
  <astralsorcery:blockmarble:3>,
  <astralsorcery:blockmarble:4>,
  <astralsorcery:blockmarble:5>,
  <astralsorcery:blockmarble:6>,
  <astralsorcery:blockmarbleslab>,
  <astralsorcery:blockmarblestairs>,
  <astralsorcery:itemjournal>
] as crafttweaker.item.IItemStack[];

for item in StageLessItems
{
  mods.ItemStages.removeItemStage(item);
}

//Stage Astral Sorcery Enchantments
mods.ItemStages.stageEnchant(stageString, <enchantment:astralsorcery:enchantment.as.smelting>);
mods.ItemStages.stageEnchant(stageString, <enchantment:astralsorcery:enchantment.as.nightvision>);

//Stage Parchment Crafting
mods.recipestages.Recipes.setRecipeStage(stageString, <astralsorcery:itemcraftingcomponent:5>);

//Change tooltip for Astral Sorcery crystals
mods.ItemStages.setUnfamiliarName("Mysterious Crystal", <astralsorcery:blockcollectorcrystal>);

//Extra staging
val Stage1AstralItems = [
    <contenttweaker:astral_crystal_air>,
    <contenttweaker:astral_crystal_water>,
    <contenttweaker:astral_crystal_fire>,
    <contenttweaker:astral_crystal_earth>,
    <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:astral_converter"})
] as crafttweaker.item.IItemStack[];

for item in Stage1AstralItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stageString);
}

print("### Stage 1 Astral Sorcery Complete ###");
