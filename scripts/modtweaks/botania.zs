import crafttweaker.oredict.IOreDict;

print("~~~ Begin Botania Init ~~~");

//Remove Ores from OreChid
val oreChidOres =
[
  "oreAluminum",
  "oreIron",
  "oreOsmium",
  "oreMythril",
  "oreInfusedFire",
  "oreTin",
  "oreCertusQuartz",
  "oreMCropsEssence",
  "oreChimerite",
  "oreRuby",
  "oreCinnabar",
  "oreLead",
  "oreSapphire",
  "oreCoal",
  "oreVinteum",
  "oreDiamond",
  "oreTungsten",
  "oreEmerald",
  "orePlatinum",
  "oreDarkIron",
  "oreUranium",
  "oreNickel",
  "oreLapis",
  "oreInfusedEntropy",
  "oreAdamantium",
  "oreInfusedAir",
  "oreInfusedEarth",
  "oreFzDarkIron",
  "oreAmber",
  "oreOlivine",
  "oreMithril",
  "oreSilver",
  "oreInfusedOrder",
  "oreGold",
  "oreGalena",
  "oreBlueTopaz",
  "oreDark",
  "oreInfusedWater",
  "oreZinc",
  "oreQuartzBlack",
  "oreRedstone",
  "oreSulfur",
  "oreCopper",
  "oreYellorite",
  "oreApatite"
] as string[];

for materialString, oreValue in oreChidOres
{
  var oreBlock = oreDict.get("ore" ~ craftingMaterial);
  var oreGem = oreDict.get("gem" ~ craftingMaterial);
  var oreIngot = oreDict.get("ingot" ~ craftingMaterial);

  if(oreValue <= 1)
  {
    if(!oreBlock.empty)
    {
      if(!oreIngot.empty)
      {
        mods.botania.Orechid.addOre(oreBlock, (2 - (oreValue + 1)) * 1500);
      }
      else if (!oreGem.empty)
      {
        mods.botania.Orechid.addOre(oreBlock, (2 - (oreValue + 1)) * 150);
      }
      else
      {
        print("Could not add orechid ore for " ~ materialString);
      }
    }
    else
    {
      print("Could not find ore block for " ~ materialString);
    }
  }
}

//Add back certain ores to the OreChid
for ore in scripts.modtweaks.basescripts.oreprocessing.OreTypes
{

}

print("### Botania Init Complete ###");
