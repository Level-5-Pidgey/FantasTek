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

for materialString, oreValue in scripts.helpers.OresWithProcessingTier
{
  var oreBlock = oreDict.get("ore" ~ materialString);
  var oreGem = oreDict.get("gem" ~ materialString);
  var oreIngot = oreDict.get("ingot" ~ materialString);

  if(oreValue <= 1 | materialString == "Mithril")
  {
    if(!oreBlock.empty)
    {
      if(!oreIngot.empty)
      {
		  if(materialString == "Mithril")
		  {
        	mods.botania.Orechid.addOre(oreBlock, (2 - (oreValue + 1)) * 1800);
		  }
		  else
		  {
		  	mods.botania.Orechid.addOre(oreBlock, (2 - (oreValue + 1)) * 1500);
		  }
      }
      else if (!oreGem.empty)
      {
	  	if(materialString == "Coal")
		{
			mods.botania.Orechid.addOre(oreBlock, (2 - (oreValue + 1)) * 1800);
		}
		else
		{
			mods.botania.Orechid.addOre(oreBlock, (2 - (oreValue + 1)) * 425);
		}
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

//Change Rune Crafting

//Crafting Runes
mods.botania.RuneAltar.removeRecipe(<botania:rune>);
mods.botania.RuneAltar.removeRecipe(<botania:rune:1>);
mods.botania.RuneAltar.removeRecipe(<botania:rune:2>);
mods.botania.RuneAltar.removeRecipe(<botania:rune:3>);
mods.botania.RuneAltar.removeRecipe(<botania:rune:4>);
mods.botania.RuneAltar.removeRecipe(<botania:rune:5>);
mods.botania.RuneAltar.removeRecipe(<botania:rune:6>);
mods.botania.RuneAltar.removeRecipe(<botania:rune:7>);
mods.botania.RuneAltar.removeRecipe(<botania:rune:8>);

//T1 Runes
mods.botania.RuneAltar.addRecipe(<botania:rune> * 2, [<ore:powderMana>, <contenttweaker:prismarine_nugget>, <ore:sugarcane>, <ore:gemLapis>, <ore:dyeLightBlue>], 5000); //Water
mods.botania.RuneAltar.addRecipe(<botania:rune:1> * 2, [<ore:powderMana>, <ore:cropNetherWart>, <ore:ingotBrickNether>, <ore:gunpowder>, <ore:dyeOrange>], 5000); //Fire
mods.botania.RuneAltar.addRecipe(<botania:rune:2> * 2, [<ore:powderMana>, <ore:obsidian>, <ore:cropWheat>, <ore:treeLeaves>, <ore:dyeLime>], 5000); //Earth
mods.botania.RuneAltar.addRecipe(<botania:rune:3> * 2, [<ore:powderMana>, <ore:feather>, <ore:string>, <ore:blockGlassColorless>, <ore:dyeGray>], 5000); //Air

//T2 Runes
mods.botania.RuneAltar.addRecipe(<botania:rune:4>, [<ore:powderMana>, <botania:rune>, <botania:rune:1>, <minecraftfuture:bamboo>, <ore:treeSapling>, <ore:fish>], 8000); //Spring
mods.botania.RuneAltar.addRecipe(<botania:rune:5>, [<ore:powderMana>, <botania:rune:2>, <botania:rune:3>, <ore:slimeball>, <minecraft:melon>, <ore:gemPrismarine>], 8000); //Summer
mods.botania.RuneAltar.addRecipe(<botania:rune:6>, [<ore:powderMana>, <botania:rune:1>, <botania:rune:3>, <minecraft:lit_pumpkin>, <ore:treeLeaves>, <minecraft:web>], 8000); //Autumn
mods.botania.RuneAltar.addRecipe(<botania:rune:7>, [<ore:powderMana>, <botania:rune>, <botania:rune:2>, <minecraftfuture:sweetberry>, <ore:quartzMana>, <minecraft:snow>, <minecraft:snow>, <minecraft:snow>], 8000); //Winter
mods.botania.RuneAltar.addRecipe(<botania:rune:8>, [<ore:powderMana>, <ore:manaPearl>, <ore:manaDiamond>, <ore:quartzMana>], 8000); //Mana

print("### Botania Init Complete ###");
