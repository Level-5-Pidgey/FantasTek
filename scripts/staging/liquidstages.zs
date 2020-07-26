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
	<liquid:aerotheum> : stages.Locked,
	<liquid:astralsorcery.liquidstarlight> : stages.AstralSorcery1,
	<liquid:alchemical_redstone> : stages.Locked,
	<liquid:alubrass> : stages.Locked,
	<liquid:aluminum> : stages.Locked,
	<liquid:ardite> : stages.Locked,
	<liquid:astral_starmetal> : stages.Locked,
	<liquid:beetroot_soup> : stages.progression1,
	<liquid:water> : stages.progression1,
	<liquid:lava> : stages.progression1,
	<liquid:biocrude> : stages.Locked,
	<liquid:biofuel> : stages.Locked,
	<liquid:biomass> : stages.Locked,
	<liquid:blockfluidantimatter> : stages.Locked,
	<liquid:blockfluiddirt> : stages.Locked,
	<liquid:blood> : stages.Locked,
	<liquid:blueslime> : stages.Locked,
	<liquid:brass> : stages.Locked,
	<liquid:brine> : stages.Locked,
	<liquid:bronze> : stages.Locked,
	<liquid:chromium> : stages.Locked,
	<liquid:clay> : stages.progression1,
	<liquid:cloud_seed> : stages.Locked,
	<liquid:cloud_seed_concentrated> : stages.Locked,
	<liquid:coal> : stages.progression1,
	<liquid:cobalt> : stages.Locked,
	<liquid:conductive_iron> : stages.progression1,
	<liquid:constantan> : stages.Locked,
	<liquid:construction_alloy> : stages.Locked,
	<liquid:copper> : stages.Locked,
	<liquid:creosote> : stages.progression1,
	<liquid:crude_oil> : stages.Locked,
	<liquid:cryotheum> : stages.Locked,
	<liquid:dark_steel> : stages.Locked,
	<liquid:dawnstone> : stages.Locked,
	<liquid:diesel> : stages.Locked,
	<liquid:dirt> : stages.progression1,
	<liquid:draconium> : stages.Locked,
	<liquid:dragonsteel_fire> : stages.Locked,
	<liquid:dragonsteel_ice> : stages.Locked,
	<liquid:electrical_steel> : stages.Locked,
	<liquid:electrum> : stages.Locked,
	<liquid:elementium> : stages.Locked,
	<liquid:emerald> : stages.progression1,
	<liquid:end_steel> : stages.Locked,
	<liquid:ender> : stages.progression1,
	<liquid:ender_distillation> : stages.Locked,
	<liquid:enderium> : stages.Locked,
	<liquid:energetic_alloy> : stages.Locked,
	<liquid:enrichedlava> : stages.Locked,
	<liquid:essence> : stages.Locked,
	<liquid:experience> : stages.Locked,
	<liquid:fire_water> : stages.Locked,
	<liquid:flux_goo> : stages.Locked,
	<liquid:fuel> : stages.Locked,
	<liquid:gasoline> : stages.Locked,
	<liquid:glass> : stages.progression1,
	<liquid:glowstone> : stages.progression1,
	<liquid:gold> : stages.progression1,
	<liquid:heavy_oil> : stages.Locked,
	<liquid:heavywater> : stages.Locked,
	<liquid:for.honey> : stages.progression1,
	<liquid:honey> : stages.progression1,
	<liquid:hootch> : stages.Locked,
	<liquid:hot_crude> : stages.Locked,
	<liquid:hot_spring_water> : stages.progression1,
	<liquid:hydrogen> : stages.Locked,
	<liquid:ice> : stages.progression1,
	<liquid:invar> : stages.Locked,
	<liquid:iridium> : stages.Locked,
	<liquid:iron> : stages.progression1,
	<liquid:juice> : stages.progression1,
	<liquid:kerosene> : stages.Locked,
	<liquid:knightslime> : stages.Locked,
	<liquid:latex> : stages.Locked,
	<liquid:lava> : stages.progression1,
	<liquid:lead> : stages.Locked,
	<liquid:lifeessence> : stages.BloodMagic1,
	<liquid:light_oil> : stages.Locked,
	<liquid:liquid_death> : stages.Thaumcraft1,
	<liquid:liquid_sunshine> : stages.Locked,
	<liquid:liquidchlorine> : stages.Locked,
	<liquid:liquiddeuterium> : stages.Locked,
	<liquid:liquidethene> : stages.Locked,
	<liquid:liquidfusionfuel> : stages.Locked,
	<liquid:liquidhydrogen> : stages.Locked,
	<liquid:liquidhydrogenchloride> : stages.Locked,
	<liquid:liquidlithium> : stages.Locked,
	<liquid:liquidoxygen> : stages.Locked,
	<liquid:liquidsodium> : stages.Locked,
	<liquid:liquidsulfurdioxide> : stages.Locked,
	<liquid:liquidsulfurtrioxide> : stages.Locked,
	<liquid:liquidtritium> : stages.Locked,
	<liquid:lpg> : stages.Locked,
	<liquid:lubricant> : stages.Locked,
	<liquid:lumium> : stages.Locked,
	<liquid:mana> : stages.Locked,
	<liquid:manasteel> : stages.Locked,
	<liquid:manyullyn> : stages.Locked,
	<liquid:meat> : stages.Locked,
	<liquid:milk> : stages.progression1,
	<liquid:mithril> : stages.Locked,
	<liquid:awakened_draconium> : stages.Locked,
	<liquid:black_iron> : stages.progression1,
	<liquid:crude_steel> : stages.progression1,
	<liquid:modularium> : stages.progression1,
	<liquid:molten_reinforced_pink_slime> : stages.Locked,
	<liquid:mushroom_stew> : stages.progression1,
	<liquid:naphtha> : stages.Locked,
	<liquid:natural_gas> : stages.Locked,
	<liquid:necrodermis> : stages.Locked,
	<liquid:nickel> : stages.Locked,
	<liquid:nitrogen> : stages.Locked,
	<liquid:nutrient_distillation> : stages.Locked,
	<liquid:obsidian> : stages.progression1,
	<liquid:oil> : stages.Locked,
	<liquid:oil_residue> : stages.Locked,
	<liquid:osmium> : stages.Locked,
	<liquid:oxygen> : stages.Locked,
	<liquid:petrotheum> : stages.Locked,
	<liquid:pewterfluid> : stages.Locked,
	<liquid:pigiron> : stages.progression1,
	<liquid:plastic> : stages.Locked,
	<liquid:platinum> : stages.Locked,
	<liquid:poison> : stages.progression1,
	<liquid:potato_soup> : stages.progression1,
	<liquid:potion> : stages.progression1,
	<liquid:potion_lingering> : stages.progression1,
	<liquid:potion_splash> : stages.progression1,
	<liquid:pulsating_iron> : stages.progression1,
	<liquid:purifying_fluid> : stages.Locked,
	<liquid:purpleslime> : stages.Locked,
	<liquid:pyrotheum> : stages.Locked,
	<liquid:rabbit_stew> : stages.progression1,
	<liquid:redstone> : stages.progression1,
	<liquid:redstone_alloy> : stages.progression1,
	<liquid:refined_biofuel> : stages.Locked,
	<liquid:refined_fuel> : stages.Locked,
	<liquid:refined_oil> : stages.Locked,
	<liquid:resin> : stages.Locked,
	<liquid:rocket_fuel> : stages.Locked,
	<liquid:rocketfuel> : stages.Locked,
	<liquid:sand> : stages.progression1,
	<liquid:sap> : stages.Locked,
	<liquid:seed_oil> : stages.Locked,
	<liquid:sewage> : stages.Locked,
	<liquid:signalum> : stages.Locked,
	<liquid:silver> : stages.Locked,
	<liquid:sludge> : stages.Locked,
	<liquid:soularium> : stages.Locked,
	<liquid:starmetal> : stages.Locked,
	<liquid:steam> : stages.Locked,
	<liquid:steel> : stages.Locked,
	<liquid:stone> : stages.progression1,
	<liquid:sulfuricacid> : stages.Locked,
	<liquid:syrup> : stages.Locked,
	<liquid:terrasteel> : stages.Locked,
	<liquid:thaumium> : stages.Locked,
	<liquid:thorium> : stages.Locked,
	<liquid:tin> : stages.Locked,
	<liquid:titanium> : stages.Locked,
	<liquid:tree_oil> : stages.Locked,
	<liquid:bone_marrow> : stages.Locked,
	<liquid:tungsten> : stages.Locked,
	<liquid:uranium> : stages.Locked,
	<liquid:vapor_of_levity> : stages.Locked,
	<liquid:vibranium> : stages.Locked,
	<liquid:vibrant_alloy> : stages.Locked,
	<liquid:voidmetal> : stages.Locked,
	<liquid:wood_gas> : stages.Locked,
	<liquid:xpjuice> : stages.Locked,
	<liquid:xu_demonic_metal> : stages.Locked,
	<liquid:xu_enchanted_metal> : stages.Locked,
	<liquid:xu_evil_metal> : stages.Locked,
	<liquid:yellorium> : stages.Locked,
	<liquid:zinc> : stages.Locked,
	<liquid:if.pink_slime> : stages.Locked,
	<liquid:if.ore_fluid_raw> : stages.Locked,
	<liquid:if.ore_fluid_fermented> : stages.Locked,
	<liquid:vivid_alloy> : stages.Locked,
	<liquid:energetic_silver> : stages.Locked,
	<liquid:crystalline_pink_slime> : stages.Locked,
	<liquid:stellar_alloy> : stages.Locked,
	<liquid:melodic_alloy> : stages.Locked,
	<liquid:crystalline_alloy> : stages.Locked,
	<liquid:crude_steel> : stages.progression1,
	<liquid:if.protein> : stages.Locked
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
