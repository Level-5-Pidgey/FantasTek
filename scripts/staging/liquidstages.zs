#priority -1
import scripts.staging.stages;
import crafttweaker.liquid.ILiquidStack;

print("~~~ Begin Liquid Staging ~~~");

function StageFlorb(liquidString as string, stageToSetTo as mods.zenstages.Stage)
{
	var FlorbData as crafttweaker.data.IData = {Fluid: liquidString};
	mods.ItemStages.addItemStage(stageToSetTo.stage, <thermalexpansion:florb>.withTag(FlorbData));
}

function StageFluidPattern(liquidString as string, stageToSetTo as mods.zenstages.Stage)
{
	var FluidPatternData as crafttweaker.data.IData = {Fluid: {FluidName: liquidString, Amount: 1000}};
	mods.ItemStages.addItemStage(stageToSetTo.stage, <extracells:pattern.fluid>.withTag(FluidPatternData));
}

function StageForestryCapsule(liquidObject as ILiquidStack, stageToSetTo as mods.zenstages.Stage)
{
	var liquidString as string = scripts.helpers.getLiquidStringFromObject(liquidObject);

	//If the liquid can be held in a Wax Capsule, stage that too.
	if (liquidObject.definition.temperature <= 300)
	{
		var WaxCapsuleData as crafttweaker.data.IData = {Fluid: {FluidName: liquidString, Amount: 1000}};
		mods.ItemStages.addItemStage(stageToSetTo.stage, <forestry:capsule:1>.withTag(WaxCapsuleData));
	}

	var TinCanData as crafttweaker.data.IData = {Fluid: {FluidName: liquidString, Amount: 1000}};
	mods.ItemStages.addItemStage(stageToSetTo.stage, <forestry:can:1>.withTag(TinCanData));

	var FrefractoryCapsuleData as crafttweaker.data.IData = {Fluid: {FluidName: liquidString, Amount: 1000}};
	mods.ItemStages.addItemStage(stageToSetTo.stage, <forestry:refractory:1>.withTag(FrefractoryCapsuleData));
}

var liquidStages as mods.zenstages.Stage[crafttweaker.liquid.ILiquidStack] =
{
	<liquid:aerotheum> : stages.progression2,
	<liquid:astralsorcery.liquidstarlight> : stages.AstralSorcery1,
	<liquid:alchemical_redstone> : stages.progression2,
	<liquid:alubrass> : stages.progression2,
	<liquid:aluminum> : stages.progression2,
	<liquid:ardite> : stages.progression2,
	<liquid:astral_starmetal> : stages.progression2,
	<liquid:beetroot_soup> : stages.progression1,
	<liquid:water> : stages.progression1,
	<liquid:lava> : stages.progression1,
	<liquid:biocrude> : stages.progression2,
	<liquid:biofuel> : stages.progression2,
	<liquid:biomass> : stages.progression2,
	<liquid:blockfluidantimatter> : stages.progression2,
	<liquid:blockfluiddirt> : stages.progression2,
	<liquid:blood> : stages.progression1,
	<liquid:blueslime> : stages.progression2,
	<liquid:brass> : stages.progression2,
	<liquid:brine> : stages.progression2,
	<liquid:bronze> : stages.progression2,
	<liquid:chromium> : stages.progression2,
	<liquid:clay> : stages.progression1,
	<liquid:cloud_seed> : stages.progression2,
	<liquid:cloud_seed_concentrated> : stages.progression2,
	<liquid:coal> : stages.progression1,
	<liquid:cobalt> : stages.progression2,
	<liquid:conductive_iron> : stages.progression1,
	<liquid:constantan> : stages.progression2,
	<liquid:construction_alloy> : stages.progression2,
	<liquid:copper> : stages.progression2,
	<liquid:creosote> : stages.progression1,
	<liquid:crude_oil> : stages.progression2,
	<liquid:cryotheum> : stages.progression2,
	<liquid:dark_steel> : stages.progression2,
	<liquid:dawnstone> : stages.progression2,
	<liquid:diesel> : stages.progression2,
	<liquid:dirt> : stages.progression1,
	<liquid:draconium> : stages.progression2,
	<liquid:dragonsteel_fire> : stages.progression2,
	<liquid:dragonsteel_ice> : stages.progression2,
	<liquid:electrical_steel> : stages.progression2,
	<liquid:electrum> : stages.progression2,
	<liquid:elementium> : stages.progression2,
	<liquid:emerald> : stages.progression1,
	<liquid:end_steel> : stages.progression2,
	<liquid:ender> : stages.progression1,
	<liquid:ender_distillation> : stages.progression2,
	<liquid:enderium> : stages.progression2,
	<liquid:energetic_alloy> : stages.progression2,
	<liquid:enrichedlava> : stages.progression2,
	<liquid:essence> : stages.progression2,
	<liquid:experience> : stages.progression2,
	<liquid:fire_water> : stages.progression2,
	<liquid:flux_goo> : stages.progression2,
	<liquid:fuel> : stages.progression2,
	<liquid:gasoline> : stages.progression2,
	<liquid:glass> : stages.progression1,
	<liquid:glowstone> : stages.progression1,
	<liquid:gold> : stages.progression1,
	<liquid:heavy_oil> : stages.progression2,
	<liquid:heavywater> : stages.progression2,
	<liquid:for.honey> : stages.progression1,
	<liquid:honey> : stages.progression1,
	<liquid:hootch> : stages.progression2,
	<liquid:hot_crude> : stages.progression2,
	<liquid:hot_spring_water> : stages.progression1,
	<liquid:hydrogen> : stages.progression2,
	<liquid:ice> : stages.progression1,
	<liquid:invar> : stages.progression2,
	<liquid:iridium> : stages.progression2,
	<liquid:iron> : stages.progression1,
	<liquid:juice> : stages.progression1,
	<liquid:kerosene> : stages.progression2,
	<liquid:knightslime> : stages.progression2,
	<liquid:latex> : stages.progression2,
	<liquid:lava> : stages.progression1,
	<liquid:lead> : stages.progression2,
	<liquid:lifeessence> : stages.BloodMagic1,
	<liquid:light_oil> : stages.progression2,
	<liquid:liquid_death> : stages.Thaumcraft1,
	<liquid:liquid_sunshine> : stages.progression2,
	<liquid:liquidchlorine> : stages.progression2,
	<liquid:liquiddeuterium> : stages.progression2,
	<liquid:liquidethene> : stages.progression2,
	<liquid:liquidfusionfuel> : stages.progression2,
	<liquid:liquidhydrogen> : stages.progression2,
	<liquid:liquidhydrogenchloride> : stages.progression2,
	<liquid:liquidlithium> : stages.progression2,
	<liquid:liquidoxygen> : stages.progression2,
	<liquid:liquidsodium> : stages.progression2,
	<liquid:liquidsulfurdioxide> : stages.progression2,
	<liquid:liquidsulfurtrioxide> : stages.progression2,
	<liquid:liquidtritium> : stages.progression2,
	<liquid:lpg> : stages.progression2,
	<liquid:lubricant> : stages.progression2,
	<liquid:lumium> : stages.progression2,
	<liquid:mana> : stages.progression2,
	<liquid:manasteel> : stages.progression2,
	<liquid:manyullyn> : stages.progression2,
	<liquid:meat> : stages.progression2,
	<liquid:milk> : stages.progression1,
	<liquid:mithril> : stages.progression2,
	<liquid:awakened_draconium> : stages.progression2,
	<liquid:black_iron> : stages.progression1,
	<liquid:crude_steel> : stages.progression1,
	<liquid:modularium> : stages.progression1,
	<liquid:molten_reinforced_pink_slime> : stages.progression2,
	<liquid:mushroom_stew> : stages.progression1,
	<liquid:naphtha> : stages.progression2,
	<liquid:natural_gas> : stages.progression2,
	<liquid:necrodermis> : stages.progression2,
	<liquid:netherite> : stages.progression1,
	<liquid:nickel> : stages.progression2,
	<liquid:nitrogen> : stages.progression2,
	<liquid:nutrient_distillation> : stages.progression2,
	<liquid:obsidian> : stages.progression1,
	<liquid:oil> : stages.progression2,
	<liquid:oil_residue> : stages.progression2,
	<liquid:osmium> : stages.progression2,
	<liquid:oxygen> : stages.progression2,
	<liquid:petrotheum> : stages.progression2,
	<liquid:pewterfluid> : stages.progression2,
	<liquid:pigiron> : stages.progression1,
	<liquid:plastic> : stages.progression2,
	<liquid:platinum> : stages.progression2,
	<liquid:poison> : stages.progression1,
	<liquid:potato_soup> : stages.progression1,
	<liquid:potion> : stages.progression1,
	<liquid:potion_lingering> : stages.progression1,
	<liquid:potion_splash> : stages.progression1,
	<liquid:pulsating_iron> : stages.progression1,
	<liquid:purifying_fluid> : stages.progression2,
	<liquid:purpleslime> : stages.progression2,
	<liquid:pyrotheum> : stages.progression2,
	<liquid:rabbit_stew> : stages.progression1,
	<liquid:redstone> : stages.progression1,
	<liquid:redstone_alloy> : stages.progression1,
	<liquid:refined_biofuel> : stages.progression2,
	<liquid:refined_fuel> : stages.progression2,
	<liquid:refined_oil> : stages.progression2,
	<liquid:resin> : stages.progression2,
	<liquid:rocket_fuel> : stages.progression2,
	<liquid:rocketfuel> : stages.progression2,
	<liquid:sand> : stages.progression1,
	<liquid:sap> : stages.progression2,
	<liquid:seed_oil> : stages.progression2,
	<liquid:sewage> : stages.progression2,
	<liquid:signalum> : stages.progression2,
	<liquid:silver> : stages.progression2,
	<liquid:sludge> : stages.progression2,
	<liquid:soularium> : stages.progression2,
	<liquid:starmetal> : stages.progression2,
	<liquid:steam> : stages.progression2,
	<liquid:steel> : stages.progression2,
	<liquid:stone> : stages.progression1,
	<liquid:sulfuricacid> : stages.progression2,
	<liquid:syrup> : stages.progression2,
	<liquid:terrasteel> : stages.progression2,
	<liquid:thaumium> : stages.progression2,
	<liquid:thorium> : stages.progression2,
	<liquid:tin> : stages.progression2,
	<liquid:titanium> : stages.progression2,
	<liquid:tree_oil> : stages.progression2,
	<liquid:tungsten> : stages.progression2,
	<liquid:uranium> : stages.progression2,
	<liquid:vapor_of_levity> : stages.progression2,
	<liquid:vibranium> : stages.progression2,
	<liquid:vibrant_alloy> : stages.progression2,
	<liquid:voidmetal> : stages.progression2,
	<liquid:wood_gas> : stages.progression2,
	<liquid:xpjuice> : stages.progression2,
	<liquid:xu_demonic_metal> : stages.progression2,
	<liquid:xu_enchanted_metal> : stages.progression2,
	<liquid:xu_evil_metal> : stages.progression2,
	<liquid:yellorium> : stages.progression2,
	<liquid:zinc> : stages.progression2,
	<liquid:if.pink_slime> : stages.progression2,
	<liquid:if.ore_fluid_raw> : stages.progression2,
	<liquid:if.ore_fluid_fermented> : stages.progression2,
	<liquid:vivid_alloy> : stages.progression2,
	<liquid:energetic_silver> : stages.progression2,
	<liquid:crystalline_pink_slime> : stages.progression2,
	<liquid:stellar_alloy> : stages.progression2,
	<liquid:melodic_alloy> : stages.progression2,
	<liquid:crystalline_alloy> : stages.progression2,
	<liquid:crude_steel> : stages.progression1,
	<liquid:if.protein> : stages.progression2
};

for liquidObject, zenStageObject in liquidStages
{
	if(zenStageObject.stage != "stage_i")
	{
		//Stage the liquid itself
		mods.ItemStages.stageLiquid(zenStageObject.stage, liquidObject);

		//Stage the Fluid Morb
		StageFlorb(scripts.helpers.getLiquidStringFromObject(liquidObject), zenStageObject);

		//Stage the buckets holding the fluid
		scripts.helpers.setItemAndRecipesStage(scripts.helpers.formatBucket(scripts.helpers.getLiquidStringFromObject(liquidObject)), zenStageObject.stage);

		//Stage ME Fluid Patterns
		StageFluidPattern(scripts.helpers.getLiquidStringFromObject(liquidObject), zenStageObject);

		//Stage Forestry Capsules
		StageForestryCapsule(liquidObject, zenStageObject);
	}
}

print("### Liquid Staging Complete ###");
