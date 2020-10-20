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

//Stage Aspects to stage 1
//Crystals
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vacuos"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "lux"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "motus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "gelum"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitreus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "metallum"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "victus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "mortuus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "potentia"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "permutatio"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "praecantatio"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "auram"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "alkimia"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "tenebrae"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "alienis"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "volatus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "herba"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "instrumentum"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "fabrico"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "machina"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vinculum"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "spiritus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "cognitio"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "sensus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aversio"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "praemunio"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "desiderium"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "exanimis"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "bestia"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "humanus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "mythus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "draco"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "fabrico"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}));

//Phials
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "aer"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "terra"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "ignis"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "aqua"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "ordo"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "perditio"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "vacuos"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "lux"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "motus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "gelum"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "vitreus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "metallum"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "victus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "mortuus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "potentia"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "permutatio"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "praecantatio"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "auram"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "alkimia"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "vitium"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "tenebrae"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "alienis"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "volatus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "herba"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "instrumentum"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "fabrico"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "machina"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "vinculum"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "spiritus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "cognitio"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "sensus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "aversio"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "praemunio"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "desiderium"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "exanimis"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "bestia"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "humanus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "mythus"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "draco"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "fabrico"}]}));
mods.ItemStages.addItemStage(stages.Thaumcraft1.stage, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "ignis"}]}));

print("### Stage 1 Thaumcraft Complete ###");
