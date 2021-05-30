
print("~~~ Begin DeepMobLearning Init ~~~");

//Change Polymer Clay Recipes
recipes.remove(<deepmoblearning:polymer_clay>);
scripts.helpers.addInjectionRecipe(<deepmoblearning:polymer_clay> * 2, <ore:itemClay> * 2, <liquid:ender> * 125, 3500, 3);
scripts.mmhelper.IndustrialMixerFactoryRecipe(scripts.helpers.createRecipeName(<deepmoblearning:polymer_clay>), 4000, 30, null, null, <liquid:ender> * 125, <liquid:clay> * 144, null, null, null, null, <deepmoblearning:polymer_clay> * 3);

//Remove Terrestrial Matter Conversion
var TerrestrialMatterRecipes = [
    "deepmoblearning:living_matter_exchange/transmutes1_hellish/recipe0_soul_sand",
    "deepmoblearning:living_matter_exchange/transmutes0_overworldian/recipe4_iron_ingot",
    "deepmoblearning:living_matter_exchange/metadata2_extraterrestrial_living_matter",
    "deepmoblearning:living_matter_exchange/transmutes0_overworldian/recipe6_arrow",
    "deepmoblearning:living_matter_exchange/metadata1_hellish_living_matter",
    "deepmoblearning:living_matter_exchange/transmutes0_overworldian/recipe9_cobweb",
    "deepmoblearning:living_matter_exchange/transmutes0_overworldian/recipe1_carrot",
    "deepmoblearning:living_matter_exchange/transmutes2_extraterrestrial/recipe4_chorus_fruit",
    "deepmoblearning:living_matter_exchange/transmutes1_hellish/recipe1_blaze_powder",
    "deepmoblearning:living_matter_exchange/transmutes1_hellish/recipe4_gold_ingot",
    "deepmoblearning:living_matter_exchange/transmutes0_overworldian/recipe3_rotten_flesh",
    "deepmoblearning:living_matter_exchange/transmutes0_overworldian/recipe7_spider_eye",
    "deepmoblearning:living_matter_exchange/transmutes0_overworldian/recipe5_bone",
    "deepmoblearning:living_matter_exchange/transmutes0_overworldian/recipe2_potato",
    "deepmoblearning:living_matter_exchange/transmutes2_extraterrestrial/recipe1_end_stone",
    "deepmoblearning:living_matter_exchange/transmutes2_extraterrestrial/recipe3_nether_star",
    "deepmoblearning:living_matter_exchange/transmutes0_overworldian/recipe0_grass",
    "deepmoblearning:living_matter_exchange/transmutes0_overworldian/recipe8_gunpowder",
    "deepmoblearning:living_matter_exchange/transmutes1_hellish/recipe5_nether_wart",
    "deepmoblearning:living_matter_exchange/transmutes1_hellish/recipe3_ghast_tear",
    "deepmoblearning:living_matter_exchange/transmutes1_hellish/recipe2_blaze_rod",
    "deepmoblearning:living_matter_exchange/transmutes2_extraterrestrial/recipe2_ender_pearl",
    "deepmoblearning:living_matter_exchange/transmutes0_overworldian/recipe10_prismarine",
] as string[];

for TerrestrialMatterRecipe in TerrestrialMatterRecipes
{
	recipes.removeByRecipeName(TerrestrialMatterRecipe);
}

//Blank Data Model
recipes.remove(<deepmoblearning:data_model_blank>);
scripts.helpers.CreateAssemblyRecipe(<deepmoblearning:data_model_blank>, [<ore:plateSoularium>, scripts.helpers.CircuitTiers[2], <ore:plateSoularium>, <ore:ingotDarkSteel>, <ore:blockGlass>, <ore:ingotDarkSteel>, <ore:plateSoularium>, scripts.helpers.CircuitTiers[2], <ore:plateSoularium>], 40, 8000);

//Assembly Line Recipe Changes
val deepmoblearningRecipes_ASSEMBLY = {
    //<deepmoblearning:data_model_zombie> : [<xreliquary:mob_ingredient:6>, <xreliquary:mob_ingredient:6>, <xreliquary:mob_ingredient:6>, <xreliquary:mob_ingredient:6>, <deepmoblearning:data_model_blank>, <xreliquary:mob_ingredient:6>, <xreliquary:mob_ingredient:6>, <xreliquary:mob_ingredient:6>, <xreliquary:mob_ingredient:6>],
    //<deepmoblearning:data_model_skeleton> : [<xreliquary:mob_ingredient>, <xreliquary:mob_ingredient>, <xreliquary:mob_ingredient>, <xreliquary:mob_ingredient>, <deepmoblearning:data_model_blank>, <xreliquary:mob_ingredient>, <xreliquary:mob_ingredient>, <xreliquary:mob_ingredient>, <xreliquary:mob_ingredient>],
    //<deepmoblearning:data_model_creeper> : [<xreliquary:mob_ingredient:3>, <ore:dustSulfur>, <xreliquary:mob_ingredient:3>, <ore:dustSulfur>, <deepmoblearning:data_model_blank>, <ore:dustSulfur>, <xreliquary:mob_ingredient:3>, <xreliquary:mob_ingredient:3>, <ore:dustSulfur>],
    //<deepmoblearning:data_model_spider> : [null, null, null, null, <deepmoblearning:data_model_blank>, null, null, null, null],
    //<deepmoblearning:data_model_slime> : [null, null, null, null, <deepmoblearning:data_model_blank>, null, null, null, null],
    //<deepmoblearning:data_model_witch> : [null, null, null, null, <deepmoblearning:data_model_blank>, null, null, null, null],
    //<deepmoblearning:data_model_blaze> : [null, null, null, null, <deepmoblearning:data_model_blank>, null, null, null, null],
    //<deepmoblearning:data_model_ghast> : [<xreliquary:mob_ingredient:3>, <minecraft:ghast_tear>, <xreliquary:mob_ingredient:3>, <minecraft:ghast_tear>, <deepmoblearning:data_model_blank>, <minecraft:ghast_tear>, <xreliquary:mob_ingredient:3>, <xreliquary:mob_ingredient:3>, <minecraft:ghast_tear>]
    //<deepmoblearning:data_model_wither_skeleton> : [null, null, null, null, <deepmoblearning:data_model_blank>, null, null, null, null],
    //<deepmoblearning:data_model_enderman> : [null, null, null, null, <deepmoblearning:data_model_blank>, null, null, null, null],
    //<deepmoblearning:data_model_wither> : [null, null, null, null, <deepmoblearning:data_model_blank>, null, null, null, null],
    //<deepmoblearning:data_model_dragon> : [null, null, null, null, <deepmoblearning:data_model_blank>, null, null, null, null],
    //<deepmoblearning:data_model_shulker> : [null, null, null, null, <deepmoblearning:data_model_blank>, null, null, null, null],
    //<deepmoblearning:data_model_guardian> : [null, null, null, null, <deepmoblearning:data_model_blank>, null, null, null, null],
    //<deepmoblearning:data_model_thermal_elemental> : [null, null, null, null, <deepmoblearning:data_model_blank>, null, null, null, null],
    //<deepmoblearning:data_model_tinker_slime> : [null, null, null, null, <deepmoblearning:data_model_blank>, null, null, null, null],
} as crafttweaker.item.IIngredient[][crafttweaker.item.IItemStack];

for key, value in deepmoblearningRecipes_ASSEMBLY {
    recipes.remove(key.withAmount(1));
    scripts.helpers.CreateAssemblyRecipe(key, value, 80, 50000);
}

//Extended Crafting Recipes (T2 Table)
val deepmoblearning_EXTENDEDCRAFTING_T2 = {
    <deepmoblearning:simulation_chamber>
                                    :	[[<ore:plateCobalt>, scripts.helpers.CircuitTiers[2], <ore:plateCobalt>],
                                        [<ore:stickPlastic>, <enderio:item_material:53>, <ore:stickPlastic>],
                                        [<ore:plateCobalt>, scripts.helpers.CircuitTiers[2], <ore:plateCobalt>],
                                        [null, <ore:obsidian>, <ore:plateSoularium>]],
    <deepmoblearning:extraction_chamber>
                                    :	[[<ore:plateArdite>,  scripts.helpers.CircuitTiers[2], <ore:plateArdite>],
                                        [<ore:stickPlastic>, <enderio:item_material:53>, <ore:stickPlastic>],
                                        [<ore:plateArdite>,  scripts.helpers.CircuitTiers[2], <ore:plateArdite>],
                                        [null, <ore:obsidian>, <ore:plateSoularium>]],
    <deepmoblearning:trial_keystone>
                                    :	[[null, null, null],
                                        [<thermalfoundation:material:1028>, <enderio:item_material:53>, <thermalfoundation:material:1028>],
                                        [<ore:ingotSoularium>, <ore:ingotSoularium>, <ore:ingotSoularium>],
                                        [scripts.helpers.CircuitTiers[1], <ore:obsidian>, <ore:ingotCobalt>]],
    <deepmoblearning:deep_learner>
                                    :	[[<ore:ingotBlackIron>, <ore:ingotSoularium>, <ore:ingotBlackIron>],
                                        [<ore:ingotSoularium>, scripts.helpers.CircuitTiers[1], <ore:ingotSoularium>],
                                        [<ore:ingotBlackIron>, <ore:ingotSoularium>, <ore:ingotBlackIron>],
                                        [null, null, <ore:obsidian>]],
    <deepmoblearning:glitch_infused_helmet>
                                    :	[[<deepmoblearning:glitch_infused_ingot>, <ore:dustMana>, <deepmoblearning:glitch_infused_ingot>],
                                        [<ore:plateSoularium>, <enderio:item_end_steel_helmet>, <ore:plateSoularium>],
                                        [<deepmoblearning:glitch_infused_ingot>, scripts.helpers.CircuitTiers[3], <deepmoblearning:glitch_infused_ingot>],
                                        [<ore:obsidian>, <deepmoblearning:glitch_infused_ingot>, <ore:nuggetStellarAlloy>]],
    <deepmoblearning:glitch_infused_chestplate>
                                    :	[[<deepmoblearning:glitch_infused_ingot>, <ore:dustMana>, <deepmoblearning:glitch_infused_ingot>],
                                        [<ore:plateSoularium>, <enderio:item_end_steel_chestplate>, <ore:plateSoularium>],
                                        [<deepmoblearning:glitch_infused_ingot>, scripts.helpers.CircuitTiers[3], <deepmoblearning:glitch_infused_ingot>],
                                        [<ore:obsidian>, <deepmoblearning:glitch_infused_ingot>, <ore:nuggetStellarAlloy>]],
    <deepmoblearning:glitch_infused_leggings>
                                    :	[[<deepmoblearning:glitch_infused_ingot>, <ore:dustMana>, <deepmoblearning:glitch_infused_ingot>],
                                        [<ore:plateSoularium>, <enderio:item_end_steel_leggings>, <ore:plateSoularium>],
                                        [<deepmoblearning:glitch_infused_ingot>, scripts.helpers.CircuitTiers[3], <deepmoblearning:glitch_infused_ingot>],
                                        [<ore:obsidian>, <deepmoblearning:glitch_infused_ingot>, <ore:nuggetStellarAlloy>]],
    <deepmoblearning:glitch_infused_boots>
                                    :	[[<deepmoblearning:glitch_infused_ingot>, <ore:dustMana>, <deepmoblearning:glitch_infused_ingot>],
                                        [<ore:plateSoularium>, <enderio:item_end_steel_boots>, <ore:plateSoularium>],
                                        [<deepmoblearning:glitch_infused_ingot>, scripts.helpers.CircuitTiers[3], <deepmoblearning:glitch_infused_ingot>],
                                        [<ore:obsidian>, <deepmoblearning:glitch_infused_ingot>, <ore:nuggetStellarAlloy>]],
    <deepmoblearning:glitch_infused_sword>
                                    :	[[<deepmoblearning:glitch_infused_ingot>, <ore:dustMana>, <deepmoblearning:glitch_infused_ingot>],
                                        [<ore:plateSoularium>, <enderio:item_end_steel_sword>, <ore:plateSoularium>],
                                        [<deepmoblearning:glitch_infused_ingot>, scripts.helpers.CircuitTiers[3], <deepmoblearning:glitch_infused_ingot>],
                                        [<ore:obsidian>, <deepmoblearning:glitch_infused_ingot>, <ore:nuggetStellarAlloy>]],
    <deepmoblearning:trial_key>
                                    :	[[<ore:dustBlitz>, null, null],
                                        [<ore:ingotCobalt>, <ore:ingotCobalt>, <ore:ingotCobalt>],
                                        [<ore:dustBlitz>, null, <ore:ingotCobalt>],
                                        [null, <ore:obsidian>, <ore:ingotSoularium>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in deepmoblearning_EXTENDEDCRAFTING_T2 {
	recipes.remove(key.withAmount(1));
	scripts.helpers.createAdvancedCraftingRecipe(key, value, value[3][0], value[3][1], value[3][2], "", true);
}

//Data model creation with Pristine Matter
val deepmoblearningRecipes_PRISTINE = {
    <deepmoblearning:data_model_zombie> : <deepmoblearning:pristine_matter_zombie>,
    <deepmoblearning:data_model_skeleton> : <deepmoblearning:pristine_matter_skeleton>,
    <deepmoblearning:data_model_creeper> : <deepmoblearning:pristine_matter_creeper>,
    <deepmoblearning:data_model_spider> : <deepmoblearning:pristine_matter_spider>,
    <deepmoblearning:data_model_slime> : <deepmoblearning:pristine_matter_slime>,
    <deepmoblearning:data_model_witch> : <deepmoblearning:pristine_matter_witch>,
    <deepmoblearning:data_model_blaze> : <deepmoblearning:pristine_matter_blaze>,
    <deepmoblearning:data_model_ghast> : <deepmoblearning:pristine_matter_ghast>,
    <deepmoblearning:data_model_wither_skeleton> : <deepmoblearning:pristine_matter_wither_skeleton>,
    <deepmoblearning:data_model_enderman> : <deepmoblearning:pristine_matter_enderman>,
    <deepmoblearning:data_model_wither> : <deepmoblearning:pristine_matter_wither>,
    <deepmoblearning:data_model_dragon> : <deepmoblearning:pristine_matter_dragon>,
    <deepmoblearning:data_model_shulker> : <deepmoblearning:pristine_matter_shulker>,
    <deepmoblearning:data_model_guardian> : <deepmoblearning:pristine_matter_guardian>,
    <deepmoblearning:data_model_thermal_elemental> : <deepmoblearning:pristine_matter_thermal_elemental>,
    <deepmoblearning:data_model_tinker_slime> : <deepmoblearning:pristine_matter_tinker_slime>,
} as crafttweaker.item.IItemStack[crafttweaker.item.IItemStack];

for model, pristineMatter in deepmoblearningRecipes_PRISTINE {
  mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(model), scripts.helpers.stages.progression2.stage, model, [[null, pristineMatter, null], [pristineMatter, <deepmoblearning:data_model_blank>, pristineMatter], [null, pristineMatter, null]]);
}

//Melt Terrestrial Matters into XP Liquid
val deepmoblearning_MATTERMELT = {
    <deepmoblearning:living_matter_overworldian> : 200,
    <deepmoblearning:living_matter_hellish> : 280,
    <deepmoblearning:living_matter_extraterrestrial> : 400,
} as int[crafttweaker.item.IItemStack];

for matter, amount in deepmoblearning_MATTERMELT
{
    scripts.helpers.addMeltingRecipe(<liquid:xpjuice> * amount, matter, 6000, 4);
}

print("### DeepMobLearning Init Complete ###");
