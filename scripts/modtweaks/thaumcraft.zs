
print("~~~ Begin Thaumcraft Init ~~~");

/*
 Research Strings List:
	UNLOCKARTIFICE
	ORE
	FLUX
	UNLOCKAUROMANCY
	!Wisp
	CRYSTALFARMER
	UNLOCKALCHEMY
	!CrimsonCultist
	!EldritchCrab
	PRIMPEARL
	UNLOCKELDRITCH
	FLUXRIFT
	FIRSTSTEPS
	KNOWLEDGETYPES
	UNLOCKGOLEMANCY
	WARP
	THEORYRESEARCH
	!Firebat
	UNLOCKINFUSION
	CELESTIALSCANNING
	FLUXCLEANUP
	!EldritchGuardian
	!Pech
	!Taintacle
	!TaintCrawler
	!BrainyZombie
	RIFTCLOSER
	CrimsonRites
	!TaintSwarm
	!ThaumSlime
	PLANTS
	!TaintSeed
	FOCUSPOUCH
	WORKBENCHCHARGER
	FOCUSRIFT
	FOCUSSCATTER
	FOCUSEXCHANGE
	FOCUSGREATER
	FOCUSSPLIT
	BASEAUROMANCY
	FOCUSELEMENTAL
	FOCUSFLUX
	VISBATTERY
	FOCUSHEAL
	FOCUSCLOUD
	FOCUSPLAN
	FOCUSCURSE
	FOCUSBREAK
	FOCUSADVANCED
	FOCUSPROJECTILE
	VISAMULET
	FOCUSBOLT
	FOCUSMINE
	FOCUSSPELLBAT
	RECHARGEPEDESTAL
	ALUMENTUM
	POTIONSPRAYER
	HEDGEALCHEMY
	BATHSALTS
	BASEALCHEMY
	ESSENTIASMELTERTHAUMIUM
	ESSENTIASMELTERVOID
	ARCANESPA
	THAUMATORIUM
	ESSENTIATRANSPORT
	LIQUIDDEATH
	TUBES
	IMPROVEDSMELTING
	CENTRIFUGE
	WARDEDJARS
	IMPROVEDSMELTING2
	BOTTLETAINT
	EVERFULLURN
	METALLURGY
	SANESOAP
	ESSENTIASMELTER
	METALPURIFICATION
	MIRRORHAND
	ARCANELAMP
	BELLOWS
	MIRRORESSENTIA
	DIOPTRA
	HUNGRYCHEST
	ARCANEEAR
	GRAPPLEGUN
	ARCANEPATTERNCRAFTER
	MIRROR
	INFERNALFURNACE
	BASICTURRET
	LAMPFERTILITY
	LEVITATOR
	LAMPGROWTH
	VISGENERATOR
	ADVANCEDTURRET
	BASEARTIFICE
	ARCANEBORE
	REDSTONERELAY
	RUNICSHIELDING
	INFUSIONBOOST
	ARMORFORTRESS
	INFUSIONSTABLE
	INFUSIONELDRITCH
	INFUSIONANCIENT
	INFUSION
	PAVINGSTONES
	CURIOSITYBAND
	FORTRESSMASK
	CHARMUNDYING
	VERDANTCHARMS
	BASEINFUSION
	CLOUDRING
	BOOTSTRAVELLER
	ELEMENTALTOOLS
	INFUSIONENCHANTMENT
	BASEGOLEMANCY
	SEALLUMBER
	MINDCLOCKWORK
	GOLEMBREAKER
	SEALBUTCHER
	MATSTUDCLAY
	SEALBREAK
	MATSTUDBRASS
	SEALUSE
	GOLEMCLIMBER
	SEALSTORE
	SEALCOLLECT
	MATSTUDIRON
	SEALEMPTY
	SEALSTOCK
	MATSTUDVOID
	SEALPROVIDE
	MATSTUDTHAUMIUM
	CONTROLSEALS
	SEALHARVEST
	MINDBIOTHAUMIC
	GOLEMVISION
	GOLEMFLYER
	GOLEMDIRECT
	GOLEMCOMBATADV
	JARBRAIN
	GOLEMLOGISTICS
	MATSTUDWOOD
	SEALGUARD
	VOIDSEERPEARL
	VOIDROBEARMOR
	PRIMALCRUSHER
	VOIDSIPHON
	BASEELDRITCH
	MALIGNANTHEART
	MAGICQUIVER
	CASTEREMBER
	BASEPERIPHERY
	CASTERELEMENTIUM
	VISPHYLACTERY
	PAULDRONREPULSION
*/
//Hide Iron Plate (since it has no recipes)
scripts.helpers.unstageAndHide(<thaumcraft:plate:1>);

//Thaumonomicon First Recipe
recipes.addShapeless(scripts.helpers.createRecipeName(<thaumcraft:thaumonomicon>), <thaumcraft:thaumonomicon>, [<ore:book>, <thaumcraft:shimmerleaf> | <thaumcraft:cinderpearl> | <thaumcraft:vishroom>]);

//Remove easier Thaumcraft Scribing Tools Recipe
recipes.removeByRecipeName("thaumcraft:scribingtoolscraft2");

//Thaumometer
mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumcraft:thaumometer>);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("thaumometer", "FIRSTSTEPS", 20, [<aspect:aer> * 2, <aspect:terra> * 2, <aspect:aqua> * 2, <aspect:ignis> * 2, <aspect:ordo> * 2, <aspect:perditio> * 2], <thaumcraft:thaumometer>, [[null, <ore:plateGold>, null], [<ore:plateGold>, <ore:paneGlassColorless>, <ore:plateGold>], [null, <ore:plateGold>, null]]);

//Thaumium requires steel instead of Iron
mods.thaumcraft.Crucible.removeRecipe(<thaumcraft:ingot>);
mods.thaumcraft.Crucible.registerRecipe("thaumiumIngot", "BASEALCHEMY", <thaumcraft:ingot>, <ore:ingotSteel>, [<aspect:terra> * 5, <aspect:praecantatio> * 5]);
mods.thaumcraft.Crucible.registerRecipe("thaumiumIngotCrude", "BASEALCHEMY", <thaumcraft:ingot>, <ore:ingotCrudeSteel>, [<aspect:terra> * 5, <aspect:praecantatio> * 5]);

//Add Recipe for Thamic Energy Converter Multiblock
recipes.addShaped(scripts.helpers.createRecipeName(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:thaumic_energy_converter"})), <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:thaumic_energy_converter"}), [[<thaumcraft:candle_white>, <ore:paperBlack>, <thaumcraft:candle_white>], [<ore:paperBlack>, <thaumcraft:alumentum>, <ore:paperBlack>], [<thaumcraft:candle_white>, <ore:paperBlack>, <thaumcraft:candle_white>]]);

print("### Thaumcraft Init Complete ###");
