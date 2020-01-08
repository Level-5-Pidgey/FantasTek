print("~~~ Begin Stage 1 Astral Sorcery Staging ~~~");

//Variable for stage name so it's easy to change later
var stageName = "astral-i";

//Mod Staging
mods.ItemStages.stageModItems(stageName, "astralsorcery");

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage1AstralItems = [

] as crafttweaker.item.IItemStack[];

for item in Stage1AstralItems
{
  mods.ItemStages.removeItemStage(item);
}

//Items that should not have a stage associated with them at all
val StageLessItems = [
  <astralsorcery:blockcustomsandore>,
  <astralsorcery:blockcustomflower>,
  <astralsorcery:itemcraftingcomponent>,
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

//Stage Liquid Starlight
mods.ItemStages.stageLiquid(stageName, <liquid:astralsorcery.liquidstarlight>);
mods.ItemStages.stageLiquid(stageName, <liquid:molten_elemental_fire_crystal>);
mods.ItemStages.stageLiquid(stageName, <liquid:molten_elemental_water_crystal>);
mods.ItemStages.stageLiquid(stageName, <liquid:molten_elemental_earth_crystal>);
mods.ItemStages.stageLiquid(stageName, <liquid:molten_elemental_air_crystal>);

//Stage Astral Sorcery Enchantments
mods.ItemStages.stageEnchant(stageName, <enchantment:astralsorcery:enchantment.as.smelting>);
mods.ItemStages.stageEnchant(stageName, <enchantment:astralsorcery:enchantment.as.nightvision>);

//Stage Parchment Crafting
mods.recipestages.Recipes.setRecipeStage(stageName, <astralsorcery:itemcraftingcomponent:5>);

//Stage Elemental Crystals
mods.recipestages.Recipes.setRecipeStage(stageName, <contenttweaker:astral_crystal_air>);
mods.recipestages.Recipes.setRecipeStage(stageName, <contenttweaker:astral_crystal_water>);
mods.recipestages.Recipes.setRecipeStage(stageName, <contenttweaker:astral_crystal_fire>);
mods.recipestages.Recipes.setRecipeStage(stageName, <contenttweaker:astral_crystal_earth>);

print("### Stage 1 Astral Sorcery Complete ###");
