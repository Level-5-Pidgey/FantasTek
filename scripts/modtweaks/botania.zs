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
mods.botania.RuneAltar.addRecipe(<botania:rune> * 2, [<ore:powderMana>, scripts.helpers.T1MagicWaterIngredients[0], scripts.helpers.T1MagicWaterIngredients[1], scripts.helpers.T1MagicWaterIngredients[2], scripts.helpers.T1MagicWaterIngredients[3]], 5000); //Water
mods.botania.RuneAltar.addRecipe(<botania:rune:1> * 2, [<ore:powderMana>, scripts.helpers.T1MagicFireIngredients[0], scripts.helpers.T1MagicFireIngredients[1], scripts.helpers.T1MagicFireIngredients[2], scripts.helpers.T1MagicFireIngredients[3]], 5000); //Fire
mods.botania.RuneAltar.addRecipe(<botania:rune:2> * 2, [<ore:powderMana>, scripts.helpers.T1MagicEarthIngredients[0], scripts.helpers.T1MagicEarthIngredients[1], scripts.helpers.T1MagicEarthIngredients[2], scripts.helpers.T1MagicEarthIngredients[3]], 5000); //Earth
mods.botania.RuneAltar.addRecipe(<botania:rune:3> * 2, [<ore:powderMana>, scripts.helpers.T1MagicAirIngredients[0], scripts.helpers.T1MagicAirIngredients[1], scripts.helpers.T1MagicAirIngredients[2], scripts.helpers.T1MagicAirIngredients[3]], 5000); //Air

//T2 Runes
mods.botania.RuneAltar.addRecipe(<botania:rune:4>, [<ore:powderMana>, <botania:rune>, <botania:rune:1>, <minecraftfuture:bamboo>, <ore:treeSapling>, <ore:fish>], 8000); //Spring
mods.botania.RuneAltar.addRecipe(<botania:rune:5>, [<ore:powderMana>, <botania:rune:2>, <botania:rune:3>, <ore:slimeball>, <minecraft:melon>, <ore:gemPrismarine>], 8000); //Summer
mods.botania.RuneAltar.addRecipe(<botania:rune:6>, [<ore:powderMana>, <botania:rune:1>, <botania:rune:3>, <minecraft:lit_pumpkin>, <ore:treeLeaves>, <minecraft:web>], 8000); //Autumn
mods.botania.RuneAltar.addRecipe(<botania:rune:7>, [<ore:powderMana>, <botania:rune>, <botania:rune:2>, <minecraftfuture:sweetberry>, <ore:quartzMana>, <minecraft:snow>, <minecraft:snow>, <minecraft:snow>], 8000); //Winter
mods.botania.RuneAltar.addRecipe(<botania:rune:8>, [<ore:powderMana>, <ore:manaPearl>, <ore:manaDiamond>, <ore:quartzMana>], 8000); //Mana

//Make Manasteel require actual steel
mods.botania.ManaInfusion.removeRecipe(<botania:manaresource>);
mods.botania.ManaInfusion.removeRecipe(<botania:storage>);
mods.botania.ManaInfusion.addInfusion(<botania:manaresource>, <ore:ingotSteel>, 3000);
mods.botania.ManaInfusion.addInfusion(<botania:manaresource>, <ore:ingotCrudeSteel>, 4000);
mods.botania.ManaInfusion.addInfusion(<botania:storage>, <ore:blockSteel>, 3000 * 9);
mods.botania.ManaInfusion.addInfusion(<botania:storage>, <ore:blockCrudeSteel>, 4000 * 9);

//Change Recipes of Botania Flowers
val botaniaFlowers = {
  <botania:specialflower>.withTag({type: "endoflame"}) : [<ore:petalBrown>, <ore:petalBrown>, <ore:petalRed>, <ore:petalLightGray>, <ore:runeFireB>],
  <botania:specialflower>.withTag({type: "hydroangeas"}) : [<ore:petalBlue>, <ore:petalBlue>, <ore:petalCyan>, <ore:petalCyan>],
  <botania:specialflower>.withTag({type: "thermalily"}) : [<ore:petalRed>, <ore:petalOrange>, <ore:petalOrange>, <ore:runeFireB>],
  <botania:specialflower>.withTag({type: "munchdew"}) : [<ore:petalGreen>, <ore:petalGreen>, <ore:petalLime>, <ore:petalLime>, <ore:runeEarthB>],
  <botania:specialflower>.withTag({type: "entropinnyum"}) : [<ore:petalRed>, <ore:petalRed>, <ore:petalWhite>, <ore:petalWhite>, <ore:petalGray>, <ore:petalGray>, <ore:runeAutumnB>],
  <botania:specialflower>.withTag({type: "kekimurus"}) : [<ore:petalBrown>, <ore:petalBrown>, <ore:petalOrange>, <ore:petalOrange>, <ore:petalWhite>, <ore:petalWhite>, <ore:runeGluttonyB>],
  <botania:specialflower>.withTag({type: "gourmaryllis"}) : [<ore:petalLightGray>, <ore:petalLightGray>, <ore:petalYellow>, <ore:petalYellow>, <ore:petalRed>, <ore:runeAirB>],
  <botania:specialflower>.withTag({type: "narslimmus"}) : [<ore:petalLime>, <ore:petalLime>, <ore:petalGreen>, <ore:petalGreen>, <ore:petalBlack>, <ore:runeEarthB>],
  <botania:specialflower>.withTag({type: "spectrolus"}) : [<ore:petalRed>, <ore:petalRed>, <ore:petalBlue>, <ore:petalBlue>, <ore:petalGreen>, <ore:petalGreen>, <ore:petalWhite>, <ore:petalWhite>, <ore:runeWinterB>],
  <botania:specialflower>.withTag({type: "rafflowsia"}) : [<ore:petalGreen>, <ore:petalGreen>, <ore:petalPurple>, <ore:petalPurple>, <ore:runeEarthB>],
  <botania:specialflower>.withTag({type: "shulk_me_not"}) : [<ore:petalPurple>, <ore:petalPurple>, <ore:petalMagenta>, <ore:petalMagenta>, <ore:petalLightGray>, <ore:runeWrathB>, <darkutils:shulker_pearl>],
  <botania:specialflower>.withTag({type: "dandelifeon"}) : [<ore:petalLime>, <ore:petalPink>, <ore:petalGreen>, <ore:petalPurple>, <ore:netherStar>, <ore:runeWaterB>, <ore:runeFireB>, <ore:runeEarthB>, <ore:runeAirB>]
} as crafttweaker.item.IIngredient[][crafttweaker.item.IItemStack];

for key, value in botaniaFlowers {
	mods.botania.Apothecary.removeRecipe(key);
  mods.botania.Apothecary.addRecipe(key, value);
}

//Change Pure Daisy Recipes
mods.botania.PureDaisy.removeRecipe(<minecraft:packed_ice>);
mods.botania.PureDaisy.removeRecipe(<botania:livingrock>);
mods.botania.PureDaisy.removeRecipe(<botania:livingwood>);
mods.botania.PureDaisy.addRecipe(<ore:stoneMarble>, <botania:livingrock>);
mods.botania.PureDaisy.addRecipe(<ore:plankSealedWood>, <botania:livingwood>);

//Add Early-Game alternate livingwood recipe
mods.recipestages.Recipes.addShaped("reinforced_sealed_planks", scripts.helpers.stages.Locked.stage, <embers:wrapped_sealed_planks> * 4, [[<ore:ingotSteel>, <embers:sealed_planks>, <ore:ingotSteel>],[<embers:sealed_planks>, null, <embers:sealed_planks>], [<ore:ingotSteel>, <embers:sealed_planks>, <ore:ingotSteel>]]);
print("### Botania Init Complete ###");
