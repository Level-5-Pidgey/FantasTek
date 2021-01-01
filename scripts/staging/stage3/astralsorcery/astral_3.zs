#priority 98
import scripts.staging.stages;

print("~~~ Begin Stage 3 Astral Sorcery Staging ~~~");

var stageString = stages.AstralSorcery3.stage;

//Items to Remove from Mod Staging
//Each time a new stage is added to the pack, move items you'd like to keep in this stage into this List
//and move the general mod staging script line to the next stage up

val Stage3AstralItems = [
    <astralsorcery:blockaltar:1>,
    <astralsorcery:blockaltar:2>,
    <astralsorcery:blockaltar:3>,
    <astralsorcery:blockritualpedestal>,
    <astralsorcery:blockgemcrystals:4>,
    <astralsorcery:blockgemcrystals:3>,
    <astralsorcery:blockgemcrystals:2>,
    <astralsorcery:blockgemcrystals:1>,
    <astralsorcery:blockgemcrystals>,
    <astralsorcery:blockcelestialcrystals>,
    <astralsorcery:blockcelestialcrystals:1>,
    <astralsorcery:blockcelestialcrystals:2>,
    <astralsorcery:blockcelestialcrystals:3>,
    <astralsorcery:blockcelestialcrystals:4>,
    <astralsorcery:blockmachine>,
    <astralsorcery:blockborehead>,
    <astralsorcery:blockborehead:1>,
    <astralsorcery:blockattunementaltar>,
    <astralsorcery:blockbore>,
    <astralsorcery:blockchalice>,
    <astralsorcery:itemenchantmentamulet>,
    <astralsorcery:itemcape>,
    <astralsorcery:itemcape>.withTag({astralsorcery: {}}),
    <astralsorcery:itemcape>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.pelotrio"}}),
    <astralsorcery:itemcape>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.fornax"}}),
    <astralsorcery:itemcape>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.bootes"}}),
    <astralsorcery:itemcape>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.octans"}}),
    <astralsorcery:itemcape>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.horologium"}}),
    <astralsorcery:itemcape>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.mineralis"}}),
    <astralsorcery:itemcape>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.lucerna"}}),
    <astralsorcery:itemcape>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.evorsio"}}),
    <astralsorcery:itemcape>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.aevitas"}}),
    <astralsorcery:itemcape>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.vicio"}}),
    <astralsorcery:itemcape>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.armara"}}),
    <astralsorcery:itemcape>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.discidia"}}),
    <astralsorcery:itemchargedcrystalshovel>.withTag({astralsorcery: {size: 900, fract: 0, purity: 100, sizeOverride: -1, collect: 100}}),
    <astralsorcery:itemchargedcrystalpickaxe>.withTag({astralsorcery: {size: 2700, fract: 0, purity: 100, sizeOverride: -1, collect: 100}}),
    <astralsorcery:itemchargedcrystalsword>.withTag({astralsorcery: {size: 1800, fract: 0, purity: 100, sizeOverride: -1, collect: 100}}),
    <astralsorcery:itemchargedcrystalaxe>.withTag({astralsorcery: {size: 2700, fract: 0, purity: 100, sizeOverride: -1, collect: 100}}),
    <astralsorcery:itemchargedcrystalshovel>,
    <astralsorcery:itemchargedcrystalpickaxe>,
    <astralsorcery:itemchargedcrystalsword>,
    <astralsorcery:itemchargedcrystalaxe>,
    <astralsorcery:itemperkgem:2>,
    <astralsorcery:itemperkgem:1>,
    <astralsorcery:itemperkgem>,
    <astralsorcery:itemperkseal>,
    <astralsorcery:itemskyresonator>.withTag({astralsorcery: {enhanced: 1 as byte}}),
    <astralsorcery:itemknowledgeshare>,
    <astralsorcery:itemgrapplewand>,
    <astralsorcery:itemexchangewand>,
    <astralsorcery:itemarchitectwand>,
    <astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.aevitas"}}),
    <astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.vicio"}}),
    <astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.armara"}}),
    <astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.discidia"}}),
    <astralsorcery:itemshiftingstar>,
    <astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.evorsio"}}),
    <astralsorcery:itemilluminationwand>.withTag({astralsorcery: {}}),
    <astralsorcery:itemsextant>.withTag({astralsorcery: {advanced: 1 as byte}}),
    <astralsorcery:itemwand>.withTag({astralsorcery: {AugmentName: "astralsorcery.constellation.evorsio"}}),
    <astralsorcery:itemwand>.withTag({astralsorcery: {AugmentName: "astralsorcery.constellation.armara"}}),
    <astralsorcery:itemwand>.withTag({astralsorcery: {AugmentName: "astralsorcery.constellation.vicio"}}),
    <astralsorcery:itemwand>.withTag({astralsorcery: {AugmentName: "astralsorcery.constellation.discidia"}}),
    <astralsorcery:itemwand>.withTag({astralsorcery: {AugmentName: "astralsorcery.constellation.aevitas"}}),
    <astralsorcery:itemlinkingtool>,
    <astralsorcery:iteminfusedglass>.withTag({astralsorcery: {}}),
    <astralsorcery:itemcraftingcomponent:4>,
    <astralsorcery:itemcoloredlens>,
    <astralsorcery:itemcoloredlens:1>,
    <astralsorcery:itemcoloredlens:2>,
    <astralsorcery:itemcoloredlens:3>,
    <astralsorcery:itemcoloredlens:4>,
    <astralsorcery:itemcoloredlens:5>,
    <astralsorcery:itemcoloredlens:6>,
    <astralsorcery:blockstarlightinfuser>,
    <astralsorcery:blockrituallink>,
    <astralsorcery:blocktreebeacon>,
    <astralsorcery:blockmapdrawingtable>,
    <astralsorcery:blockcelestialgateway>,
    <astralsorcery:blockobservatory>,
    <astralsorcery:blocklens>,
    <astralsorcery:blockprism>,
] as crafttweaker.item.IItemStack[];

for item in Stage3AstralItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stageString);
}

print("### Stage 3 Astral Sorcery Complete ###");
