
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
mods.thaumcraft.Crucible.registerRecipe("thaumiumIngot", "BASEALCHEMY", <thaumcraft:ingot>, <ore:ingotSteel>, [<aspect:praecantatio> * 5]);
mods.thaumcraft.Crucible.registerRecipe("thaumiumIngotCrude", "BASEALCHEMY", <thaumcraft:ingot>, <ore:ingotCrudeSteel>, [<aspect:terra> * 5, <aspect:praecantatio> * 5]);

//Add Recipe for Thamic Energy Converter Multiblock
recipes.addShaped(scripts.helpers.createRecipeName(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:thaumic_energy_converter"})) ~ "_tec", <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:thaumic_energy_converter"}), [[<thaumcraft:candle_white>, <ore:paperBlack>, <thaumcraft:candle_white>], [<ore:paperBlack>, <thaumcraft:alumentum>, <ore:paperBlack>], [<thaumcraft:candle_white>, <ore:paperBlack>, <thaumcraft:candle_white>]]);
scripts.helpers.AddTooltip(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:thaumic_energy_converter"}), ["Requires an Energy Output and both an item Input + Output.", "Can be put on either side."]);

//Remove Thaumcraft-Specific items from loot chests
val thaumcraftLoot_Remove as int[][crafttweaker.item.IItemStack] = {
	<thaumcraft:primordial_pearl:*> : [0,1,2],
	<minecraft:potion> : [0,1,2],
	<minecraft:splash_potion> : [0,1,2],
	<minecraft:lingering_potion> : [0,1,2],
	<thaumcraft:salis_mundus> : [0,1,2],
	<thaumcraft:amulet_vis> : [0,1,2],
	<minecraft:gold_nugget> : [0,1,2],
	<minecraft:iron_sword> : [1,2],
};

for item, bagTiers in thaumcraftLoot_Remove {
    mods.thaumcraft.LootBag.removeLoot(item, bagTiers);
}

//Add technological loot to the loot bags instead
val thaumcraftLoot_Add as int[][crafttweaker.item.WeightedItemStack] = {
    <ore:gemRuby>.firstItem % 15 : [0,1],
	<ore:gemPeridot>.firstItem % 15 : [0,1],
	<ore:gemTopaz>.firstItem % 15 : [0,1],
	<ore:gemTanzanite>.firstItem % 15 : [0,1],
	<ore:gemMalachite>.firstItem % 15 : [0,1],
	<ore:gemSapphire>.firstItem % 15 : [0,1],
	<ore:gemAmber>.firstItem % 15 : [0,1],
	<ore:blockRuby>.firstItem % 5 : [1,2],
	<ore:blockPeridot>.firstItem % 5 : [1,2],
	<ore:blockTopaz>.firstItem % 5 : [1,2],
	<ore:blockTanzanite>.firstItem % 5 : [1,2],
	<ore:blockMalachite>.firstItem % 5 : [1,2],
	<ore:blockSapphire>.firstItem % 5 : [1,2],
	<ore:blockAmber>.firstItem % 5 : [1,2],
	<ore:gearWood>.firstItem % 20 : [0,1],
	<ore:gearStone>.firstItem % 20 : [0,1],
	<ore:gearIron>.firstItem % 20 : [0,1,2],
	<ore:gearGold>.firstItem % 20 : [0,1,2],
	<ore:gearDiamond>.firstItem % 12 : [0,1,2],
	<ore:gearEmerald>.firstItem % 12 : [0,1,2],
    <contenttweaker:elemental_mote_water> % 4 : [1, 2],
	<contenttweaker:elemental_mote_fire> % 4 : [1, 2],
	<contenttweaker:elemental_mote_earth> % 4 : [1, 2],
	<contenttweaker:elemental_mote_air> % 4 : [1, 2],
    <ore:ingotBlackIron>.firstItem % 15 : [0, 1, 2],
    <ore:blockBlackIron>.firstItem % 5 : [1, 2],
    <ore:ingotPulsatingIron>.firstItem * 4 % 15 : [0, 1, 2],
    <ore:blockPulsatingIron>.firstItem * 2 % 5 : [1, 2],
    <ore:platePulsatingIron>.firstItem * 2 % 8 : [1, 2],
    <ore:gearPulsatingIron>.firstItem % 25 : [1, 2],
    <ore:ingotConductiveIron>.firstItem * 4 % 15 : [0, 1, 2],
    <ore:blockConductiveIron>.firstItem * 2 % 5 : [1, 2],
    <ore:plateConductiveIron>.firstItem * 2 % 8 : [1, 2],
    <ore:gearConductiveIron>.firstItem % 25 : [1, 2],
    <ore:ingotRedstoneAlloy>.firstItem * 4 % 15 : [0, 1, 2],
    <ore:blockRedstoneAlloy>.firstItem * 2 % 5 : [1, 2],
    <ore:plateRedstoneAlloy>.firstItem * 2 % 8 : [1, 2],
    <ore:gearRedstoneAlloy>.firstItem % 25 : [1, 2],
    <ore:ingotCrudeSteel>.firstItem * 4 % 15 : [0, 1, 2],
    <ore:blockCrudeSteel>.firstItem * 2 % 5 : [1, 2],
    <ore:plateCrudeSteel>.firstItem * 2 % 8 : [1, 2],
    <ore:gearCrudeSteel>.firstItem % 12 : [1, 2],
    <modularmachinery:itemmodularium> % 20 : [0, 1, 2],
    <modularmachinery:itemmodularium> * 9 % 5 : [1, 2],
    scripts.helpers.MotorTiers[0] * 2 % 3 : [1, 2],
	<ore:nuggetRuby>.firstItem * 4 % 33 : [0],
	<ore:nuggetPeridot>.firstItem * 4 % 33 : [0],
	<ore:nuggetTopaz>.firstItem * 4 % 33 : [0],
	<ore:nuggetTanzanite>.firstItem * 4 % 33 : [0],
	<ore:nuggetMalachite>.firstItem * 4 % 33 : [0],
	<ore:nuggetSapphire>.firstItem * 4 % 33 : [0],
	<ore:nuggetAmber>.firstItem * 4 % 33 : [0],
	<ore:nuggetBlackIron>.firstItem * 4 % 25 : [0, 1],
	<ore:nuggetPulsatingIron>.firstItem * 4 % 30 : [0, 1],
	<ore:nuggetConductiveIron>.firstItem * 4 % 30 : [0, 1],
	<ore:nuggetRedstoneAlloy>.firstItem * 4 % 30 : [0, 1],
	<ore:nuggetCrudeSteel>.firstItem * 4 % 20 : [0, 1],
	<ore:obsidian>.firstItem % 20 : [0, 1, 2],
};

for item, bagTiers in thaumcraftLoot_Add {
    mods.thaumcraft.LootBag.addLoot(item, bagTiers);
}

//Create Liquid Death Mechanically
scripts.mmhelper.IndustrialMixerFactoryRecipe("liquid_death", 5000, 80, <liquid:liquid_death> * 250, null, <liquid:water> * 250, null, null, null, <enderio:item_material:20>, <appliedenergistics2:material:45>, null);

print("### Thaumcraft Init Complete ###");
