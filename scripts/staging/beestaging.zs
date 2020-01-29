#priority 50
import scripts.staging.stages;

print("~~~ Begin Bee Staging ~~~");

var beeStages as mods.zenstages.Stage[string] =
{
	"forestry.speciesForest" : stages.progression1,
	"forestry.speciesMeadows" : stages.progression1,
	"forestry.speciesCommon" : stages.Locked,
	"forestry.speciesCultivated" : stages.progression1,
	"forestry.speciesNoble" : stages.progression1,
	"forestry.speciesMajestic" : stages.progression1,
	"forestry.speciesImperial" : stages.progression1,
	"forestry.speciesDiligent" : stages.progression1,
	"forestry.speciesUnweary" : stages.progression1,
	"forestry.speciesIndustrious" : stages.progression1,
	"forestry.speciesSteadfast" : stages.progression1,
	"forestry.speciesValiant" : stages.progression1,
	"forestry.speciesHeroic" : stages.progression1,
	"forestry.speciesSinister" : stages.progression1,
	"forestry.speciesFiendish" : stages.progression1,
	"forestry.speciesDemonic" : stages.progression1,
	"forestry.speciesModest" : stages.progression1,
	"forestry.speciesFrugal" : stages.progression1,
	"forestry.speciesAustere" : stages.progression1,
	"forestry.speciesTropical" : stages.progression1,
	"forestry.speciesExotic" : stages.progression1,
	"forestry.speciesEdenic" : stages.progression1,
	"forestry.speciesEnded" : stages.progression1,
	"forestry.speciesSpectral" : stages.progression1,
	"forestry.speciesPhantasmal" : stages.progression1,
	"forestry.speciesWintry" : stages.progression1,
	"forestry.speciesIcy" : stages.progression1,
	"forestry.speciesGlacial" : stages.progression1,
	"forestry.speciesVindictive" : stages.progression1,
	"forestry.speciesVengeful" : stages.progression1,
	"forestry.speciesAvenging" : stages.progression1,
	"forestry.speciesLeporine" : stages.progression1,
	"forestry.speciesMerry" : stages.progression1,
	"forestry.speciesTipsy" : stages.progression1,
	"forestry.speciesTricky" : stages.progression1,
	"forestry.speciesRural" : stages.progression1,
	"forestry.speciesFarmerly" : stages.progression1,
	"forestry.speciesAgrarian" : stages.progression1,
	"forestry.speciesMarshy" : stages.progression1,
	"forestry.speciesMiry" : stages.progression1,
	"forestry.speciesBoggy" : stages.progression1,
	"forestry.speciesMonastic" : stages.progression1,
	"forestry.speciesSecluded" : stages.progression1,
	"forestry.speciesHermitic" : stages.progression1,
	"extrabees.species.arid" : stages.Locked,
	"extrabees.species.barren" : stages.Locked,
	"extrabees.species.desolate" : stages.Locked,
	"extrabees.species.decomposing" : stages.Locked,
	"extrabees.species.gnawing" : stages.Locked,
	"extrabees.species.rotten" : stages.Locked,
	"extrabees.species.bone" : stages.Locked,
	"extrabees.species.creeper" : stages.Locked,
	"extrabees.species.rock" : stages.Locked,
	"extrabees.species.stone" : stages.Locked,
	"extrabees.species.granite" : stages.Locked,
	"extrabees.species.mineral" : stages.Locked,
	"extrabees.species.copper" : stages.Locked,
	"extrabees.species.tin" : stages.Locked,
	"extrabees.species.iron" : stages.Locked,
	"extrabees.species.lead" : stages.Locked,
	"extrabees.species.zinc" : stages.Locked,
	"extrabees.species.titanium" : stages.Locked,
	"extrabees.species.tungstate" : stages.Locked,
	"extrabees.species.nickel" : stages.Locked,
	"extrabees.species.gold" : stages.Locked,
	"extrabees.species.silver" : stages.Locked,
	"extrabees.species.platinum" : stages.Locked,
	"extrabees.species.lapis" : stages.Locked,
	"extrabees.species.sodalite" : stages.Locked,
	"extrabees.species.pyrite" : stages.Locked,
	"extrabees.species.bauxite" : stages.Locked,
	"extrabees.species.cinnabar" : stages.Locked,
	"extrabees.species.sphalerite" : stages.Locked,
	"extrabees.species.emerald" : stages.Locked,
	"extrabees.species.ruby" : stages.Locked,
	"extrabees.species.sapphire" : stages.Locked,
	"extrabees.species.diamond" : stages.Locked,
	"extrabees.species.unstable" : stages.Locked,
	"extrabees.species.nuclear" : stages.Locked,
	"extrabees.species.radioactive" : stages.Locked,
	"extrabees.species.yellorium" : stages.Locked,
	"extrabees.species.cyanite" : stages.Locked,
	"extrabees.species.blutonium" : stages.Locked,
	"extrabees.species.ancient" : stages.Locked,
	"extrabees.species.primeval" : stages.Locked,
	"extrabees.species.prehistoric" : stages.Locked,
	"extrabees.species.relic" : stages.Locked,
	"extrabees.species.coal" : stages.Locked,
	"extrabees.species.resin" : stages.Locked,
	"extrabees.species.oil" : stages.Locked,
	"extrabees.species.distilled" : stages.Locked,
	"extrabees.species.fuel" : stages.Locked,
	"extrabees.species.creosote" : stages.Locked,
	"extrabees.species.latex" : stages.Locked,
	"extrabees.species.water" : stages.Locked,
	"extrabees.species.river" : stages.Locked,
	"extrabees.species.ocean" : stages.Locked,
	"extrabees.species.ink" : stages.Locked,
	"extrabees.species.growing" : stages.Locked,
	"extrabees.species.farm" : stages.Locked,
	"extrabees.species.thriving" : stages.Locked,
	"extrabees.species.blooming" : stages.Locked,
	"extrabees.species.sweet" : stages.Locked,
	"extrabees.species.sugar" : stages.Locked,
	"extrabees.species.ripening" : stages.Locked,
	"extrabees.species.fruit" : stages.Locked,
	"extrabees.species.alcohol" : stages.Locked,
	"extrabees.species.milk" : stages.Locked,
	"extrabees.species.coffee" : stages.Locked,
	"extrabees.species.swamp" : stages.Locked,
	"extrabees.species.boggy" : stages.Locked,
	"extrabees.species.fungal" : stages.Locked,
	"extrabees.species.marble" : stages.Locked,
	"extrabees.species.roman" : stages.Locked,
	"extrabees.species.greek" : stages.Locked,
	"extrabees.species.classical" : stages.Locked,
	"extrabees.species.basalt" : stages.Locked,
	"extrabees.species.tempered" : stages.Locked,
	"extrabees.species.volcanic" : stages.Locked,
	"extrabees.species.glowstone" : stages.Locked,
	"extrabees.species.malicious" : stages.Locked,
	"extrabees.species.infectious" : stages.Locked,
	"extrabees.species.virulent" : stages.Locked,
	"extrabees.species.viscous" : stages.Locked,
	"extrabees.species.glutinous" : stages.Locked,
	"extrabees.species.sticky" : stages.Locked,
	"extrabees.species.corrosive" : stages.Locked,
	"extrabees.species.caustic" : stages.Locked,
	"extrabees.species.acidic" : stages.Locked,
	"extrabees.species.excited" : stages.Locked,
	"extrabees.species.energetic" : stages.Locked,
	"extrabees.species.ecstatic" : stages.Locked,
	"extrabees.species.artic" : stages.Locked,
	"extrabees.species.freezing" : stages.Locked,
	"extrabees.species.shadow" : stages.Locked,
	"extrabees.species.darkened" : stages.Locked,
	"extrabees.species.abyss" : stages.Locked,
	"extrabees.species.red" : stages.Locked,
	"extrabees.species.yellow" : stages.Locked,
	"extrabees.species.blue" : stages.Locked,
	"extrabees.species.green" : stages.Locked,
	"extrabees.species.black" : stages.Locked,
	"extrabees.species.white" : stages.Locked,
	"extrabees.species.brown" : stages.Locked,
	"extrabees.species.orange" : stages.Locked,
	"extrabees.species.cyan" : stages.Locked,
	"extrabees.species.purple" : stages.Locked,
	"extrabees.species.gray" : stages.Locked,
	"extrabees.species.lightblue" : stages.Locked,
	"extrabees.species.pink" : stages.Locked,
	"extrabees.species.limegreen" : stages.Locked,
	"extrabees.species.magenta" : stages.Locked,
	"extrabees.species.lightgray" : stages.Locked,
	"extrabees.species.celebratory" : stages.Locked,
	"extrabees.species.jaded" : stages.Locked,
	"extrabees.species.hazardous" : stages.Locked,
	"extrabees.species.quantum" : stages.Locked,
	"extrabees.species.unusual" : stages.Locked,
	"extrabees.species.spatial" : stages.Locked,
	"extrabees.species.mystical" : stages.Locked,
	"magicbees.speciesMystical" : stages.Locked,
	"magicbees.speciesSorcerous" : stages.Locked,
	"magicbees.speciesUnusual" : stages.Locked,
	"magicbees.speciesAttuned" : stages.Locked,
	"magicbees.speciesEldritch" : stages.Locked,
	"magicbees.speciesEsoteric" : stages.Locked,
	"magicbees.speciesMysterious" : stages.Locked,
	"magicbees.speciesArcane" : stages.Locked,
	"magicbees.speciesCharmed" : stages.Locked,
	"magicbees.speciesEnchanted" : stages.Locked,
	"magicbees.speciesSupernatural" : stages.Locked,
	"magicbees.speciesEthereal" : stages.Locked,
	"magicbees.speciesWatery" : stages.Locked,
	"magicbees.speciesEarthy" : stages.Locked,
	"magicbees.speciesFirey" : stages.Locked,
	"magicbees.speciesWindy" : stages.Locked,
	"magicbees.speciesPupil" : stages.Locked,
	"magicbees.speciesScholarly" : stages.Locked,
	"magicbees.speciesSavant" : stages.Locked,
	"magicbees.speciesAware" : stages.Locked,
	"magicbees.speciesSpirit" : stages.Locked,
	"magicbees.speciesSoul" : stages.Locked,
	"magicbees.speciesSkulking" : stages.Locked,
	"magicbees.speciesGhastly" : stages.Locked,
	"magicbees.speciesSpidery" : stages.Locked,
	"magicbees.speciesSmouldering" : stages.Locked,
	"magicbees.speciesBigbad" : stages.Locked,
	"magicbees.speciesChicken" : stages.Locked,
	"magicbees.speciesBeef" : stages.Locked,
	"magicbees.speciesPork" : stages.Locked,
	"magicbees.speciesBatty" : stages.Locked,
	"magicbees.speciesSheepish" : stages.Locked,
	"magicbees.speciesHorse" : stages.Locked,
	"magicbees.speciesCatty" : stages.Locked,
	"magicbees.speciesTimely" : stages.Locked,
	"magicbees.speciesLordly" : stages.Locked,
	"magicbees.speciesDoctoral" : stages.Locked,
	"magicbees.speciesInfernal" : stages.Locked,
	"magicbees.speciesHateful" : stages.Locked,
	"magicbees.speciesSpiteful" : stages.Locked,
	"magicbees.speciesWithering" : stages.Locked,
	"magicbees.speciesOblivion" : stages.Locked,
	"magicbees.speciesNameless" : stages.Locked,
	"magicbees.speciesAbandoned" : stages.Locked,
	"magicbees.speciesForlorn" : stages.Locked,
	"magicbees.speciesDraconic" : stages.Locked,
	"magicbees.speciesMutable" : stages.Locked,
	"magicbees.speciesTransmuting" : stages.Locked,
	"magicbees.speciesCrumbling" : stages.Locked,
	"magicbees.speciesInvisible" : stages.Locked,
	"magicbees.speciesIron" : stages.Locked,
	"magicbees.speciesGold" : stages.Locked,
	"magicbees.speciesCopper" : stages.Locked,
	"magicbees.speciesTin" : stages.Locked,
	"magicbees.speciesSilver" : stages.Locked,
	"magicbees.speciesLead" : stages.Locked,
	"magicbees.speciesAluminium" : stages.Locked,
	"magicbees.speciesArdite" : stages.Locked,
	"magicbees.speciesCobalt" : stages.Locked,
	"magicbees.speciesManyullyn" : stages.Locked,
	"magicbees.speciesOsmium" : stages.Locked,
	"magicbees.speciesElectrum" : stages.Locked,
	"magicbees.speciesPlatinum" : stages.Locked,
	"magicbees.speciesNickel" : stages.Locked,
	"magicbees.speciesInvar" : stages.Locked,
	"magicbees.speciesBronze" : stages.Locked,
	"magicbees.speciesDiamond" : stages.Locked,
	"magicbees.speciesEmerald" : stages.Locked,
	"magicbees.speciesApatite" : stages.Locked,
	"magicbees.speciesSilicon" : stages.Locked,
	"magicbees.speciesCertus" : stages.Locked,
	"magicbees.speciesFluix" : stages.Locked,
	"magicbees.speciesTEBlizzy" : stages.Locked,
	"magicbees.speciesTEGelid" : stages.Locked,
	"magicbees.speciesTEDante" : stages.Locked,
	"magicbees.speciesTEPyro" : stages.Locked,
	"magicbees.speciesTEShocking" : stages.Locked,
	"magicbees.speciesTEAmped" : stages.Locked,
	"magicbees.speciesTEGrounded" : stages.Locked,
	"magicbees.speciesTERocking" : stages.Locked,
	"magicbees.speciesTECoal" : stages.Locked,
	"magicbees.speciesTEDestabilized" : stages.Locked,
	"magicbees.speciesTELux" : stages.Locked,
	"magicbees.speciesTEWinsome" : stages.Locked,
	"magicbees.speciesTEEndearing" : stages.Locked,
	"magicbees.speciesRSAFluxed" : stages.Locked,
	"magicbees.speciesBOTRooted" : stages.Locked,
	"magicbees.speciesBOTBotanic" : stages.Locked,
	"magicbees.speciesBOTBlossom" : stages.Locked,
	"magicbees.speciesBOTFloral" : stages.Locked,
	"magicbees.speciesBOTVazbee" : stages.Locked,
	"magicbees.speciesBOTSomnolent" : stages.Locked,
	"magicbees.speciesBOTDreaming" : stages.Locked,
	"magicbees.speciesBOTAlfheim" : stages.Locked,
	"magicbees.speciesAESkystone" : stages.Locked,
	"morebees.species.rock" : stages.Locked,
	"morebees.species.hardened" : stages.Locked,
	"morebees.species.obsidian" : stages.Locked,
	"morebees.species.lapis" : stages.Locked,
	"morebees.species.dirt" : stages.Locked,
	"morebees.species.clay" : stages.Locked,
	"morebees.species.redsand" : stages.Locked,
	"morebees.species.quartz" : stages.Locked,
	"morebees.species.certus" : stages.Locked,
	"morebees.species.redstone" : stages.Locked,
	"morebees.species.emerald" : stages.Locked,
	"morebees.species.diamond" : stages.Locked,
	"morebees.species.ruby" : stages.Locked,
	"morebees.species.sapphire" : stages.Locked,
	"morebees.species.sulfur" : stages.Locked,
	"morebees.species.apatite" : stages.Locked,
	"morebees.species.metallic" : stages.Locked,
	"morebees.species.iron" : stages.Locked,
	"morebees.species.copper" : stages.Locked,
	"morebees.species.tin" : stages.Locked,
	"morebees.species.aluminium" : stages.Locked,
	"morebees.species.gold" : stages.Locked,
	"morebees.species.silver" : stages.Locked,
	"morebees.species.lead" : stages.Locked,
	"morebees.species.cobalt" : stages.Locked,
	"morebees.species.ardite" : stages.Locked,
	"morebees.species.osmium" : stages.Locked,
	"morebees.species.nickel" : stages.Locked,
	"morebees.species.platinum" : stages.Locked,
	"morebees.species.iridium" : stages.Locked,
	"morebees.species.radioactive" : stages.Locked,
	"morebees.species.resonating" : stages.Locked,
	"morebees.species.yellorite" : stages.Locked,
	"morebees.species.uranium" : stages.Locked,
	"morebees.species.prismarine" : stages.Locked,
	"morebees.species.apocalyptic" : stages.Locked,
	"morebees.species.wither" : stages.Locked,
	"morebees.species.netherstar" : stages.Locked,
	"morebees.species.slimy" : stages.Locked,
	"morebees.species.blueslimy" : stages.Locked,
	"morebees.species.purpleslimy" : stages.Locked,
	"morebees.species.magmaslimy" : stages.Locked,
	"morebees.species.stringy" : stages.Locked,
	"morebees.species.draconic" : stages.Locked
};

for beeSpecies, zenStageObject in beeStages
{
	var MateData as crafttweaker.data.IData = {UID1: beeSpecies as string, UID0: beeSpecies as string, Slot: 0 as byte};
	print("Handling species " ~ beeSpecies ~ " with NBT: " ~ MateData);

	if(zenStageObject.stage != "stage_i")
	{
		mods.ItemStages.addItemStage(zenStageObject.stage, <forestry:bee_drone_ge>.withTag(MateData));
		mods.ItemStages.addItemStage(zenStageObject.stage, <forestry:bee_queen_ge>.withTag(MateData));
		mods.ItemStages.addItemStage(zenStageObject.stage, <forestry:bee_princess_ge>.withTag(MateData));
	}
}

//Change Text for Unknown Species
mods.ItemStages.setUnfamiliarName("Unknown Bee Princess", <forestry:bee_princess_ge>);
mods.ItemStages.setUnfamiliarName("Unknown Bee Queen", <forestry:bee_queen_ge>);
mods.ItemStages.setUnfamiliarName("Unknown Bee Drone", <forestry:bee_drone_ge>);

/*
<forestry:bee_drone_ge>.withTag(
{
	MaxH: 20,
	Mate:
		{
			Chromosomes:
				[
					{
						UID1: "forestry.speciesCommon", UID0: "forestry.speciesCommon", Slot: 0 as byte
					},
					{
						UID1: "forestry.speedSlower", UID0: "forestry.speedSlower", Slot: 1 as byte
					},
					{
						UID1: "forestry.lifespanShorter", UID0: "forestry.lifespanShorter", Slot: 2 as byte
					},
					{
						UID1: "forestry.fertilityNormal", UID0: "forestry.fertilityNormal", Slot: 3 as byte
					},
					{
						UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 4 as byte
					},
					{
						UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 5 as byte
					},
					{
						UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 6 as byte
					},
					{
						UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 7 as byte
					},
					{
						UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 8 as byte
					},
					{
						UID1: "forestry.flowersVanilla", UID0: "forestry.flowersVanilla", Slot: 9 as byte
					},
					{
						UID1: "forestry.floweringSlowest", UID0: "forestry.floweringSlowest", Slot: 10 as byte
					},
					{
						UID1: "forestry.territoryAverage", UID0: "forestry.territoryAverage", Slot: 11 as byte
					},
					{
						UID1: "forestry.effectNone", UID0: "forestry.effectNone", Slot: 12 as byte
					}
				]
		},
		Health: 20,
		IsAnalyzed: 0 as byte,
		Genome:
			{
				Chromosomes:
					[
						{
							UID1: "forestry.speciesCommon", UID0: "forestry.speciesCommon", Slot: 0 as byte
						},
						{UID1: "forestry.speedSlower", UID0: "forestry.speedSlower", Slot: 1 as byte},
						{UID1: "forestry.lifespanShorter", UID0: "forestry.lifespanShorter", Slot: 2 as byte},
						{UID1: "forestry.fertilityNormal", UID0: "forestry.fertilityNormal", Slot: 3 as byte},
						{UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 4 as byte},
						{UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 5 as byte},
						{UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 6 as byte},
						{UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 7 as byte},
						{UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 8 as byte},
						{UID1: "forestry.flowersVanilla", UID0: "forestry.flowersVanilla", Slot: 9 as byte},
						{UID1: "forestry.floweringSlowest", UID0: "forestry.floweringSlowest", Slot: 10 as byte},
						{UID1: "forestry.territoryAverage", UID0: "forestry.territoryAverage", Slot: 11 as byte},
						{UID1: "forestry.effectNone", UID0: "forestry.effectNone", Slot: 12 as byte}
					]
			}
});
*/

print("### Bee Staging Complete ###");
