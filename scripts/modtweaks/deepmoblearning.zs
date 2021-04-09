
print("~~~ Begin DeepMobLearning Init ~~~");

//Change Durability of Glitch Armour
val GlitchEquipment = [
    <deepmoblearning:glitch_infused_helmet>,
    <deepmoblearning:glitch_infused_chestplate>,
    <deepmoblearning:glitch_infused_leggings>,
    <deepmoblearning:glitch_infused_boots>,
    <deepmoblearning:glitch_infused_sword>,
] as crafttweaker.item.IItemStack[];

for equipmentItem in GlitchEquipment
{
	equipmentItem.maxDamage = (equipmentItem.maxDamage * 4) / 10;
}

//Change Polymer Clay Recipes
recipes.remove(<deepmoblearning:polymer_clay>);
scripts.helpers.addInjectionRecipe(<deepmoblearning:polymer_clay> * 2, <ore:itemClay> * 2, <liquid:ender> * 125, 3500, false);
scripts.mmhelper.IndustrialMixerFactoryRecipe(scripts.helpers.createRecipeName(<deepmoblearning:polymer_clay>), 4000, 30, null, null, <liquid:ender> * 125, <liquid:clay> * 288, null, null, null, null, <deepmoblearning:polymer_clay> * 3);

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

//Assembly Line Recipe Changes
val deepmoblearningRecipes_ASSEMBLY = {
    <deepmoblearning:data_model_blank> : [<ore:plateSoularium>, scripts.helpers.CircuitTiers[2], <ore:plateSoularium>, <ore:ingotDarkSteel>, <ore:blockGlass>, <ore:ingotDarkSteel>, <ore:plateSoularium>, scripts.helpers.CircuitTiers[2], <ore:plateSoularium>],
    //<deepmoblearning:data_model_zombie> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_skeleton> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_creeper> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_spider> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_slime> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_witch> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_blaze> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_ghast> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_wither_skeleton> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_enderman> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_wither> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_dragon> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_shulker> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_guardian> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_thermal_elemental> : [<deepmoblearning:data_model_blank>],
    //<deepmoblearning:data_model_tinker_slime> : [<deepmoblearning:data_model_blank>],
} as crafttweaker.item.IIngredient[][crafttweaker.item.IItemStack];

for key, value in deepmoblearningRecipes_ASSEMBLY {
  recipes.remove(key.withAmount(1));
  scripts.helpers.CreateAssemblyRecipe(key, value, 60, 4000);
}

//Extended Crafting Recipes (T2 Table)
val deepmoblearning_EXTENDEDCRAFTING_T2 = {
    <deepmoblearning:simulation_chamber>
                                    :	[[<ore:plateSoularium>, scripts.helpers.CircuitTiers[2], <ore:plateSoularium>],
                                        [<ore:rodSteel>, <enderio:item_material:53>, <ore:rodSteel>],
                                        [<ore:plateSoularium>, scripts.helpers.CircuitTiers[2], <ore:plateSoularium>],
                                        [null, <ore:obsidian>, <ore:ingotSoularium>]],
    <deepmoblearning:extraction_chamber>
                                    :	[[null, null, null],
                                        [null, <enderio:item_material:53>, null],
                                        [null, null, null],
                                        [null, null, null]],
    <deepmoblearning:trial_keystone>
                                    :	[[null, null, null],
                                        [null, <enderio:item_material:53>, null],
                                        [<ore:ingotSoularium>, <ore:ingotSoularium>, <ore:ingotSoularium>],
                                        [null, null, null]],
    <deepmoblearning:deep_learner>
                                    :	[[null, null, null],
                                        [null, null, null],
                                        [null, null, null],
                                        [null, null, null]],
    <deepmoblearning:glitch_infused_helmet>
                                    :	[[null, null, null],
                                        [null, null, null],
                                        [null, null, null],
                                        [null, null, null]],
    <deepmoblearning:glitch_infused_chestplate>
                                    :	[[null, null, null],
                                        [null, null, null],
                                        [null, null, null],
                                        [null, null, null]],
    <deepmoblearning:glitch_infused_leggings>
                                    :	[[null, null, null],
                                        [null, null, null],
                                        [null, null, null],
                                        [null, null, null]],
    <deepmoblearning:glitch_infused_boots>
                                    :	[[null, null, null],
                                        [null, null, null],
                                        [null, null, null],
                                        [null, null, null]],
    <deepmoblearning:glitch_infused_sword>
                                    :	[[null, null, null],
                                        [null, null, null],
                                        [null, null, null],
                                        [null, null, null]],
    <deepmoblearning:trial_key>
                                    :	[[null, null, null],
                                        [null, null, null],
                                        [null, null, null],
                                        [null, null, null]],
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

print("### DeepMobLearning Init Complete ###");
