#priority -1
import scripts.staging.stages;
import crafttweaker.liquid.ILiquidStack;

print("~~~ Begin TicMat Staging ~~~");

//Hiding tool parts
function HideMaterialParts(ticMat as string, zenStageObject as mods.zenstages.Stage)
{
	var materialParts = [
		<tconstruct:shard>,
		<tconstruct:sharpening_kit>,
		<tconstruct:pick_head>,
		<tconstruct:shovel_head>,
		<tconstruct:axe_head>,
		<tconstruct:broad_axe_head>,
		<tconstruct:sword_blade>,
		<tconstruct:large_sword_blade>,
		<tconstruct:hammer_head>,
		<tconstruct:excavator_head>,
		<tconstruct:kama_head>,
		<tconstruct:pan_head>,
		<tconstruct:sign_head>,
		<tconstruct:tool_rod>,
		<tconstruct:binding>,
		<tconstruct:tough_tool_rod>,
		<tconstruct:tough_binding>,
		<tconstruct:wide_guard>,
		<tconstruct:cross_guard>,
		<tconstruct:hand_guard>,
		<tconstruct:large_plate>,
		<tconstruct:knife_blade>,
		<tconstruct:bow_limb>,
		<tconstruct:bow_string>,
		<tconstruct:arrow_head>,
		<tconstruct:arrow_shaft>,
		<tconstruct:fletching>
	] as crafttweaker.item.IItemStack[];

	for part in materialParts
	{
		mods.ItemStages.addItemStage(zenStageObject.stage, part.withTag({Material: ticMat}));
	}
}

//Hiding full tools
function HideTools(ticMat as string, zenStageObject as mods.zenstages.Stage)
{
	var tools =
	[
		<tconstruct:pickaxe>,
		<tconstruct:shovel>,
		<tconstruct:hatchet>,
		<tconstruct:mattock>,
		<tconstruct:kama>,
		<tconstruct:hammer>,
		<tconstruct:excavator>,
		<tconstruct:lumberaxe>,
		<tconstruct:scythe>,
		<tconstruct:broadsword>,
		<tconstruct:longsword>,
		<tconstruct:rapier>,
		<tconstruct:frypan>,
		<tconstruct:battlesign>,
		<tconstruct:cleaver>,
		<tconstruct:shortbow>,
		<tconstruct:crossbow>,
		<tconstruct:longbow>,
		<tconstruct:crossbow>,
		<tconstruct:arrow>,
		<tconstruct:shuriken>
	] as crafttweaker.item.IItemStack[];

	for tool in tools
	{
		//mods.ItemStages.addItemStage(zenStageObject.stage, tool.withTag({TinkerData: {Materials: [ticMat]}}));
		mods.jei.JEI.hide(tool);
	}
}

var ticMatStages as mods.zenstages.Stage[string] =
{
	"electrical_steel" : stages.progression1,
	"energetic_alloy" : stages.progression2,
	"vibrant_alloy" : stages.progression2,
	"redstone_alloy" : stages.progression1,
	"conductive_iron" : stages.progression1,
	"pulsating_iron" : stages.progression1,
	"dark_steel" : stages.progression2,
	"soularium" : stages.progression2,
	"end_steel" : stages.progression2,
	"construction_alloy" : stages.progression2,
	"wood" : stages.progression1,
	"stone" : stages.progression1,
	"flint" : stages.progression1,
	"cactus" : stages.progression1,
	"bone" : stages.progression1,
	"obsidian" : stages.progression1,
	"prismarine" : stages.progression1,
	"endstone" : stages.progression1,
	"paper" : stages.progression1,
	"sponge" : stages.progression1,
	"firewood" : stages.progression1,
	"iron" : stages.progression1,
	"pigiron" : stages.progression1,
	"knightslime" : stages.progression2,
	"slime" : stages.progression1,
	"blueslime" : stages.progression2,
	"magmaslime" : stages.progression2,
	"netherrack" : stages.progression1,
	"cobalt" : stages.progression2,
	"ardite" : stages.progression2,
	"manyullyn" : stages.progression2,
	"copper" : stages.progression2,
	"bronze" : stages.progression2,
	"lead" : stages.progression2,
	"silver" : stages.progression2,
	"electrum" : stages.progression2,
	"steel" : stages.progression2,
	"string" : stages.progression1,
	"slimevine_blue" : stages.progression2,
	"slimevine_purple" : stages.progression2,
	"vine" : stages.progression1,
	"blaze" : stages.progression1,
	"reed" : stages.progression1,
	"ice" : stages.progression1,
	"endrod" : stages.progression1,
	"feather" : stages.progression1,
	"slimeleaf_blue" : stages.progression2,
	"slimeleaf_orange" : stages.progression2,
	"slimeleaf_purple" : stages.progression2,
	"leaf" : stages.progression1,
	"yellorium" : stages.progression2,
	"necrodermis" : stages.progression2,
	"xu_magical_wood" : stages.progression1,
	"xu_evil_metal" : stages.progression1,
	"xu_enchanted_metal" : stages.progression1,
	"xu_demonic_metal" : stages.progression1,
	"dragonbone" : stages.progression2,
	"desert_myrmex" : stages.progression2,
	"jungle_myrmex" : stages.progression2,
	"dragonsteel_fire" : stages.progression2,
	"dragonsteel_ice" : stages.progression2,
	"stymph_feather" : stages.progression2,
	"amphithere_feather" : stages.progression2,
	"weezer" : stages.progression2,
	"integrationforegoing.plastic" : stages.progression2,
	"integrationforegoing.pink_slime" : stages.progression2,
	"integrationforegoing.reinforced_pink_slime" : stages.progression2,
	"osmium" : stages.progression2,
	"starmetal" : stages.AstralSorcery1,
	"livingwood" : stages.Botania1,
	"livingrock" : stages.Botania1,
	"manasteel" : stages.Botania1,
	"elementium" : stages.Botania2,
	"terrasteel" : stages.Botania2,
	"manastring" : stages.Botania1,
	"ashenfabric" : stages.Embers1,
	"dawnstone" : stages.Embers2,
	"thaumium" : stages.Thaumcraft1,
	"voidmetal" : stages.Thaumcraft2,
	"magical_fabric" : stages.Thaumcraft1,
};

for ticMat, zenStageObject in ticMatStages
{
	if(zenStageObject.stage != "stage_i")
	{
		mods.TinkerStages.addMaterialStage(zenStageObject.stage, ticMat);

		HideMaterialParts(ticMat, zenStageObject);

		HideTools(ticMat, zenStageObject);
	}
}

print("### TicMat Staging Complete ###");
