#priority 99
import scripts.staging.stages;

print("~~~ Begin Stage 1 Astral Sorcery Staging ~~~");

//Mod Staging
mods.ItemStages.stageModItems(stages.AstralSorcery1.stage, "astralsorcery");

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage1AstralItems = [
	<contenttweaker:astral_crystal_air>,
	<contenttweaker:astral_crystal_water>,
	<contenttweaker:astral_crystal_fire>,
	<contenttweaker:astral_crystal_earth>
] as crafttweaker.item.IItemStack[];

for item in Stage1AstralItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stages.AstralSorcery1.stage);
}

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
  <astralsorcery:itemjournal>,
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.discidia"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.armara"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.vicio"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.aevitas"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.evorsio"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.lucerna"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.mineralis"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.horologium"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.octans"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.bootes"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.fornax"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.pelotrio"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.gelu"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.ulteria"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.vorux"}}),
  <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.alcara"}})
] as crafttweaker.item.IItemStack[];

for item in StageLessItems
{
  mods.ItemStages.removeItemStage(item);
}

//Stage Astral Sorcery Enchantments
mods.ItemStages.stageEnchant(stages.AstralSorcery1.stage, <enchantment:astralsorcery:enchantment.as.smelting>);
mods.ItemStages.stageEnchant(stages.AstralSorcery1.stage, <enchantment:astralsorcery:enchantment.as.nightvision>);

//Stage Parchment Crafting
mods.recipestages.Recipes.setRecipeStage(stages.AstralSorcery1.stage, <astralsorcery:itemcraftingcomponent:5>);

//Change tooltip for Astral Sorcery crystals
mods.ItemStages.setUnfamiliarName("Mysterious Crystal", <astralsorcery:blockcollectorcrystal>);

print("### Stage 1 Astral Sorcery Complete ###");
