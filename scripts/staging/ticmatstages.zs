#priority 50
import scripts.staging.stages;
import crafttweaker.liquid.ILiquidStack;

print("~~~ Begin TicMat Staging ~~~");

var liquidStages as mods.zenstages.Stage[string] =
{
	"electrical_steel"  : stages.progression1,
	"energetic_alloy"  : stages.Locked,
	"vibrant_alloy"  : stages.Locked,
	"redstone_alloy"  : stages.progression1,
	"conductive_iron"  : stages.progression1,
	"pulsating_iron"  : stages.progression1,
	"dark_steel"  : stages.Locked,
	"soularium"  : stages.Locked,
	"end_steel"  : stages.Locked,
	"construction_alloy"  : stages.Locked,
	"wood"  : stages.progression1,
	"stone"  : stages.progression1,
	"flint"  : stages.progression1,
	"cactus"  : stages.progression1,
	"bone"  : stages.progression1,
	"obsidian"  : stages.progression1,
	"prismarine"  : stages.progression1,
	"endstone"  : stages.progression1,
	"paper"  : stages.progression1,
	"sponge"  : stages.progression1,
	"firewood"  : stages.progression1,
	"iron"  : stages.progression1,
	"pigiron"  : stages.progression1,
	"knightslime"  : stages.Locked,
	"slime"  : stages.progression1,
	"blueslime"  : stages.Locked,
	"magmaslime"  : stages.Locked,
	"netherrack"  : stages.progression1,
	"cobalt"  : stages.Locked,
	"ardite"  : stages.Locked,
	"manyullyn"  : stages.Locked,
	"copper"  : stages.Locked,
	"bronze"  : stages.Locked,
	"lead"  : stages.Locked,
	"silver"  : stages.Locked,
	"electrum"  : stages.Locked,
	"steel"  : stages.Locked,
	"string"  : stages.progression1,
	"slimevine_blue"  : stages.Locked,
	"slimevine_purple"  : stages.Locked,
	"vine"  : stages.progression1,
	"blaze"  : stages.progression1,
	"reed"  : stages.progression1,
	"ice"  : stages.progression1,
	"endrod"  : stages.progression1,
	"feather"  : stages.progression1,
	"slimeleaf_blue"  : stages.Locked,
	"slimeleaf_orange"  : stages.Locked,
	"slimeleaf_purple"  : stages.Locked,
	"leaf"  : stages.progression1,
	"yellorium"  : stages.Locked,
	"necrodermis"  : stages.Locked,
	"xu_magical_wood"  : stages.Locked,
	"xu_evil_metal"  : stages.Locked,
	"xu_enchanted_metal"  : stages.Locked,
	"xu_demonic_metal"  : stages.Locked,
	"dragonbone"  : stages.Locked,
	"desert_myrmex"  : stages.Locked,
	"jungle_myrmex"  : stages.Locked,
	"dragonsteel_fire"  : stages.Locked,
	"dragonsteel_ice"  : stages.Locked,
	"stymph_feather"  : stages.Locked,
	"amphithere_feather"  : stages.Locked,
	"integrationforegoing.plastic" : stages.Locked,
	"integrationforegoing.pink_slime" : stages.Locked,
	"integrationforegoing.reinforced_pink_slime" : stages.Locked,
	"osmium"  : stages.Locked,
	"starmetal"  : stages.AstralSorcery1,
	"livingwood"  : stages.Botania1,
	"livingrock"  : stages.Botania1,
	"manasteel"  : stages.Botania2,
	"elementium"  : stages.Botania2,
	"terrasteel"  : stages.Botania2,
	"manastring"  : stages.Botania1,
	"ashenfabric"  : stages.Embers1,
	"dawnstone"  : stages.Embers2,
	"thaumium"  : stages.Thaumcraft1,
	"voidmetal"  : stages.Thaumcraft2,
	"magical_fabric"  : stages.Thaumcraft1,
};

for ticMat, zenStageObject in liquidStages
{
	if(zenStageObject.stage != "stage_i")
	{
		zenStageObject.addTiCMaterial(ticMat);
	}
}

print("### TicMat Staging Complete ###");
