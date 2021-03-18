#priority 99
import scripts.staging.stages;

print("~~~ Begin Stage 1 Thaumcraft Staging ~~~");

val Stage1ThaumcraftItems = [
	<contenttweaker:salis_mundus_air>,
	<contenttweaker:salis_mundus_water>,
	<contenttweaker:salis_mundus_fire>,
	<contenttweaker:salis_mundus_earth>,
	<thaumcraft:arcane_workbench>,
	<thaumcraft:salis_mundus>,
	<thaumcraft:scribing_tools>,
	<thaumcraft:research_table>,
	<thaumcraft:phial>,
	<thaumcraft:thaumometer>,
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "aer"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "terra"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "ignis"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "aqua"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "ordo"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "perditio"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "vacuos"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "lux"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "motus"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "gelum"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "vitreus"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "metallum"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "victus"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "mortuus"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "potentia"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "permutatio"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "praecantatio"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "auram"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "alkimia"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "vitium"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "tenebrae"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "alienis"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "volatus"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "herba"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "instrumentum"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "fabrico"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "machina"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "vinculum"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "spiritus"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "cognitio"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "sensus"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "aversio"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "praemunio"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "desiderium"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "exanimis"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "bestia"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "humanus"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "mythus"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "draco"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "fabrico"}]}),
	<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "ignis"}]}),
	<chisel:arcane_stone:*>,
	<chisel:arcane_stone1:*>,
	<thaumcraft:stone_arcane>,
	<thaumcraft:stone_arcane_brick>,
	<thaumcraft:stairs_arcane_brick>,
	<thaumcraft:stairs_arcane>,
	<thaumcraft:slab_arcane_stone>,
	<thaumcraft:crucible>,
	<thaumcraft:nitor_white>,
	<thaumcraft:nitor_orange>,
	<thaumcraft:nitor_magenta>,
	<thaumcraft:nitor_lightblue>,
	<thaumcraft:nitor_yellow>,
	<thaumcraft:nitor_lime>,
	<thaumcraft:nitor_pink>,
	<thaumcraft:nitor_gray>,
	<thaumcraft:nitor_silver>,
	<thaumcraft:nitor_cyan>,
	<thaumcraft:nitor_purple>,
	<thaumcraft:nitor_blue>,
	<thaumcraft:nitor_brown>,
	<thaumcraft:nitor_green>,
	<thaumcraft:nitor_red>,
	<thaumcraft:nitor_black>,
	<thaumcraft:alumentum>,
	<thaumcraft:tallow>,
	<thaumcraft:everfull_urn>,
	<thaumcraft:activator_rail>,
	<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:thaumic_energy_converter"}),
	<thaumcraft:celestial_notes:*>,
	<thaumcraft:curio:*>,
	<botania:manasteelhelmreveal>,
] as crafttweaker.item.IItemStack[];

for item in Stage1ThaumcraftItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stages.Thaumcraft1.stage);
}

//Items that should not have a stage associated with them at all
val StageLessItems = [
	<thaumcraft:thaumonomicon>,
	<thaumcraft:shimmerleaf>,
	<thaumcraft:cinderpearl>,
	<thaumcraft:vishroom>,
	<thaumcraft:log_greatwood>,
	<thaumcraft:log_silverwood>,
	<thaumcraft:plank_greatwood>,
	<thaumcraft:plank_silverwood>,
	<thaumcraft:slab_greatwood>,
	<thaumcraft:slab_silverwood>,
	<thaumcraft:sapling_greatwood>,
	<thaumcraft:sapling_silverwood>,
	<thaumcraft:leaves_greatwood>,
	<thaumcraft:leaves_silverwood>,
	<thaumcraft:stairs_greatwood>,
	<thaumcraft:stairs_silverwood>,
	<thaumcraft:table_wood>,
	<thaumcraft:table_stone>,
	<thaumcraft:taint_fibre>,
	<thaumcraft:taint_crust>,
	<thaumcraft:taint_soil>,
	<thaumcraft:taint_rock>,
	<thaumcraft:taint_geyser>,
	<thaumcraft:taint_feature>,
	<thaumcraft:taint_log>,
	<thaumcraft:flesh_block>,
	<thaumcraft:loot_bag>,
	<thaumcraft:loot_bag:1>,
	<thaumcraft:loot_bag:2>,
	<thaumcraft:brain>,
	<thaumcraft:ore_quartz>,
	<thaumcraft:nugget:5>,
	<thaumcraft:quicksilver>,
	<thaumcraft:loot_urn_common>,
	<thaumcraft:loot_urn_uncommon>,
	<thaumcraft:loot_urn_rare>,
	<thaumcraft:loot_crate_common>,
	<thaumcraft:loot_crate_uncommon>,
	<thaumcraft:loot_crate_rare>,
	<thaumcraft:crimson_plate_helm>,
	<thaumcraft:crimson_plate_chest>,
	<thaumcraft:crimson_plate_legs>,
	<thaumcraft:crimson_boots>,
	<thaumcraft:crimson_robe_helm>,
	<thaumcraft:crimson_robe_chest>,
	<thaumcraft:crimson_robe_legs>,
	<thaumcraft:crimson_praetor_helm>,
	<thaumcraft:crimson_praetor_chest>,
	<thaumcraft:crimson_praetor_legs>,
	<thaumcraft:table_wood>,
	<thaumcraft:table_stone>,
	<thaumcraft:stone_porous>,
	<thaumcraft:candle_white>,
	<thaumcraft:candle_orange>,
	<thaumcraft:candle_magenta>,
	<thaumcraft:candle_lightblue>,
	<thaumcraft:candle_yellow>,
	<thaumcraft:candle_lime>,
	<thaumcraft:candle_pink>,
	<thaumcraft:candle_gray>,
	<thaumcraft:candle_silver>,
	<thaumcraft:candle_cyan>,
	<thaumcraft:candle_purple>,
	<thaumcraft:candle_blue>,
	<thaumcraft:candle_brown>,
	<thaumcraft:candle_green>,
	<thaumcraft:candle_red>,
	<thaumcraft:candle_black>,
	<thaumcraft:banner_white>,
	<thaumcraft:banner_orange>,
	<thaumcraft:banner_magenta>,
	<thaumcraft:banner_lightblue>,
	<thaumcraft:banner_yellow>,
	<thaumcraft:banner_lime>,
	<thaumcraft:banner_pink>,
	<thaumcraft:banner_gray>,
	<thaumcraft:banner_silver>,
	<thaumcraft:banner_cyan>,
	<thaumcraft:banner_purple>,
	<thaumcraft:banner_blue>,
	<thaumcraft:banner_brown>,
	<thaumcraft:banner_green>,
	<thaumcraft:banner_red>,
	<thaumcraft:banner_black>,
	<thaumcraft:banner_crimson_cult>,
] as crafttweaker.item.IItemStack[];

for item in StageLessItems
{
  mods.ItemStages.removeItemStage(item);
}

//Stage the recipes of magic candles
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_white>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_orange>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_magenta>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_lightblue>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_yellow>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_lime>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_pink>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_gray>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_silver>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_cyan>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_purple>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_blue>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_brown>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_green>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_red>);
mods.recipestages.Recipes.setRecipeStage(stages.Thaumcraft1.stage, <thaumcraft:candle_black>);

print("### Stage 1 Thaumcraft Complete ###");
