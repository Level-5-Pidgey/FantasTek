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

for oreString in oreChidOres
{
	mods.botania.Orechid.removeOre(oreString);
}

for materialString, oreValue in scripts.modtweaks.basescripts.oreprocessing.OreTypes
{
  var oreBlock = oreDict.get("ore" ~ materialString);
  var oreGem = oreDict.get("gem" ~ materialString);
  var oreIngot = oreDict.get("ingot" ~ materialString);

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

print("### Botania Init Complete ###");
