#priority 110

import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;

print("~~~ Begin Ore Processing Init ~~~");

//Remove the Resonating Redstone Crystal
<ore:gemRedstone>.remove(<extrautils2:ingredients>);
<ore:crystalRedstone>.add(<extrautils2:ingredients>);

//Remove existing methods of ore processing
function removeExistingCraftingRecipes(craftingMaterial as string)
{
	var nativeCluster = oreDict.get("cluster" ~ craftingMaterial);
	var oreDust = oreDict.get("dust" ~ craftingMaterial);
	var oreBlock = oreDict.get("ore" ~ craftingMaterial);
	var oreIngot = oreDict.get("ingot" ~ craftingMaterial);
	var oreGem = oreDict.get("gem" ~ craftingMaterial);
	var oreClump = oreDict.get("clump" ~ craftingMaterial);
	var oreShard = oreDict.get("shard" ~ craftingMaterial);
	var rockyChunk = oreDict.get("rockyChunk" ~ craftingMaterial);

	if(!oreBlock.empty)
	{
		//Remove blood magic alchemy array recipe if it exists
		if(!oreDust.empty)
		{
			for ore in oreBlock.items
			{
				mods.bloodmagic.AlchemyTable.removeRecipe([ore, <bloodmagic:cutting_fluid>]);
			}
		}

		//Remove native cluster if it exists
		if(!nativeCluster.empty)
		{
			mods.thaumcraft.Crucible.removeRecipe(nativeCluster.firstItem);
		}

		//Remove vanilla furnace recipes
		for ore in oreBlock.items
		{
			if(!oreGem.empty)
			{
				for gem in oreGem.items
				{
					furnace.remove(gem, ore);
					mods.futuremc.BlastFurnace.removeRecipe(ore);
				}
			}
			else if (!oreIngot.empty)
			{
				for ingot in oreIngot.items
				{
					furnace.remove(ingot, ore);
					mods.futuremc.BlastFurnace.removeRecipe(ore);
				}
			}
			else if (!oreDust.empty)
			{
				for dust in oreDust.items
				{
					furnace.remove(dust, ore);
					mods.futuremc.BlastFurnace.removeRecipe(ore);
				}
			}
		}

		//Remove Pulverizer Recipe (TE Automatically OreDicts results)
		if(!oreDust.empty)
		{
			if(oreBlock.name != "oreChrome" & oreBlock.name != "oreChargedCertusQuartz")
			{
				mods.thermalexpansion.Pulverizer.removeRecipe(oreBlock.firstItem);
			}
		}
	}
	else
	{
		print("Could not find an ore for the material: " ~ craftingMaterial);
	}
}

function addNewRecipe(craftingMaterial as string, tier as int)
{
	//Get all of the oreDicts necessary
	var nativeCluster = oreDict.get("cluster" ~ craftingMaterial);
	var oreDust = oreDict.get("dust" ~ craftingMaterial);
	var oreBlock = oreDict.get("ore" ~ craftingMaterial);
	var oreIngot = oreDict.get("ingot" ~ craftingMaterial);
	var oreGem = oreDict.get("gem" ~ craftingMaterial);
	var oreClump = oreDict.get("clump" ~ craftingMaterial);
	var oreShard = oreDict.get("shard" ~ craftingMaterial);
	var oreDirtyDust = oreDict.get("dirtyDust" ~ craftingMaterial);
	var oreCrystal = oreDict.get("crystal" ~ craftingMaterial);
	var orePoor = oreDict.get("poorOre" ~ craftingMaterial);
	var oreDustSmall = oreDict.get("dustSmall" ~ craftingMaterial);
	var oreNugget = oreDict.get("nugget" ~ craftingMaterial);
	var rockyChunk = oreDict.get("rockyChunk" ~ craftingMaterial);
	var processedChunk = oreDict.get("chunk" ~ craftingMaterial);
	var oreDouble = oreDict.get("denseOre" ~ craftingMaterial);

	//Get the base output
	var baseMultiplier = 1;

	//Modify Base Output for certain ores
	if(craftingMaterial == "Apatite")
	{
		baseMultiplier = 8;
	}
	else if(craftingMaterial == "Redstone")
	{
		baseMultiplier = 4;
	}
	else if(craftingMaterial == "Coal")
	{
		baseMultiplier = 2;
	}
	else if(craftingMaterial == "LapisLazuli")
	{
		baseMultiplier = 6;
	}

	//Double Gem Output vs Ingot
	if(!oreGem.empty && oreIngot.empty)
	{
		baseMultiplier *= 2;
	}

	if(!oreBlock.empty)
	{
		//Furnace -- Tier 0 (1x)
		if(tier == 0)
		{
			//Iterate through all varieties of the ore and add furnace recipes
			for ore in oreBlock.items
			{
				if(!oreGem.empty)
				{
					furnace.addRecipe(oreGem.firstItem * baseMultiplier, ore, 0.7);
					mods.futuremc.BlastFurnace.addRecipe(ore, oreGem.firstItem * baseMultiplier);
				}
				else if (!oreIngot.empty)
				{
					furnace.addRecipe(oreIngot.firstItem * baseMultiplier, ore, 0.7);
					mods.futuremc.BlastFurnace.addRecipe(ore, oreIngot.firstItem * baseMultiplier);
				}
				else if (!oreDust.empty & oreIngot.empty)
				{
					furnace.addRecipe(oreDust.firstItem * baseMultiplier, ore, 0.7);
					mods.futuremc.BlastFurnace.addRecipe(ore, oreDust.firstItem * baseMultiplier);
				}
				else
				{
					print("Unable to add furnace recipe for " ~ craftingMaterial);
				}
			}

			//Add Poor Ore Smelting if Available
			if(!orePoor.empty)
			{
				for poorOre in orePoor.items
				{
					if(!oreDustSmall.empty)
					{
						furnace.addRecipe(oreDustSmall.firstItem * (2 * baseMultiplier), poorOre, 0.1);
					}
					else
					{
						if(!oreNugget.empty)
						{
							furnace.addRecipe(oreNugget.firstItem * (2 * baseMultiplier), poorOre, 0.1);
						}
						else
						{
							print("Could not create poor ore smelting recipe for " ~ craftingMaterial ~ " as no nuggets or small dust oreDict was found.");
						}
					}
				}
			}
			else
			{
				print("Skipped poor ore furnace recipes for " ~ craftingMaterial ~ " as no ore was found.");
			}
		}

		//Thaumcraft Crucible -- Tier 1 (2x)
		if(tier <= 1)
		{
			//Standard Ore
			for ore in oreBlock.items
			{
				if(!nativeCluster.empty)
				{
					mods.thaumcraft.Crucible.registerRecipe("fantastek:metalpurification/" ~ craftingMaterial, "METALPURIFICATION", nativeCluster.firstItem * baseMultiplier, ore, [<aspect:ordo> * 3]);
				}
				else if (!oreDust.empty)
				{
					mods.thaumcraft.Crucible.registerRecipe("fantastek:metalpurification/" ~ craftingMaterial, "METALPURIFICATION", oreDust.firstItem * (2 * baseMultiplier), ore, [<aspect:ordo> * 3]);
				}
				else if (!oreGem.empty)
				{
					mods.thaumcraft.Crucible.registerRecipe("fantastek:metalpurification/" ~ craftingMaterial, "METALPURIFICATION", oreGem.firstItem * baseMultiplier, ore, [<aspect:ordo> * 3]);
				}
				else
				{
					print("Skipped thaumcraft Crucible outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}

			//Dense Ore
			for oreDense in oreDouble.items
			{
				if(!nativeCluster.empty)
				{
					mods.thaumcraft.Crucible.registerRecipe("fantastek:metalpurification/" ~ craftingMaterial, "METALPURIFICATION", nativeCluster.firstItem * (2 * baseMultiplier), oreDense, [<aspect:metallum> * 5, <aspect:ordo> * 5]);
				}
				else if (!oreDust.empty)
				{
					mods.thaumcraft.Crucible.registerRecipe("fantastek:metalpurification/" ~ craftingMaterial, "METALPURIFICATION", oreDust.firstItem * (4 * baseMultiplier), oreDense, [<aspect:metallum> * 5, <aspect:ordo> * 5]);
				}
				else if (!oreGem.empty)
				{
					mods.thaumcraft.Crucible.registerRecipe("fantastek:metalpurification/" ~ craftingMaterial, "METALPURIFICATION", oreGem.firstItem * (2 * baseMultiplier), oreDense, [<aspect:vitreus> * 5, <aspect:ordo> * 5]);
				}
			}
		}

		//AE2 Grindstone -- Tier 1 (2x)
		if(tier <= 1)
		{
			//Standard Ore
			for ore in oreBlock.items
			{
				if (!oreDust.empty)
				{
					if(!oreDustSmall.empty)
					{
						mods.appliedenergistics2.Grinder.addRecipe(oreDustSmall.firstItem * (4 * (2 - tier)) * baseMultiplier, ore, (tier + 1) * 5, oreDustSmall.firstItem * ((2 - tier) * baseMultiplier), 0.5, oreDustSmall.firstItem  * (2 - tier), 0.5);
					}
					else
					{
						mods.appliedenergistics2.Grinder.addRecipe(oreDust.firstItem * ((2 - tier) * baseMultiplier), ore, (tier + 1) * 5, oreDust.firstItem, 0.5);
					}
				}
				else
				{
					print("Skipped AE2 Grindstone outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}

			//Dense Ore
			for oreDense in oreDouble.items
			{
				if (!oreDust.empty)
				{
					if(!oreDustSmall.empty)
					{
						mods.appliedenergistics2.Grinder.addRecipe(oreDustSmall.firstItem * ((4 * (2 - tier)) * 2) * baseMultiplier, oreDense, (tier + 1) * 10, oreDustSmall.firstItem * ((2 - tier) * (2 * baseMultiplier)), 0.5, oreDustSmall.firstItem  * ((2 - tier) * 2), 0.5);
					}
					else
					{
						mods.appliedenergistics2.Grinder.addRecipe(oreDust.firstItem * ((2 - tier) * (2 * baseMultiplier)), oreDense, (tier + 1) * 10, oreDust.firstItem * baseMultiplier, 0.5);
					}
				}
			}
		}

		//TNT Mining -- Tier 2 (2x) (Doesn't multiply dense ores)
		if(tier <= 2)
		{
			//Standard Ores
			for ore in oreBlock.items
			{
				if(!rockyChunk.empty)
				{
					mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(rockyChunk.firstItem * baseMultiplier, ore, 75);
				}
				else if (!nativeCluster.empty)
				{
					mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(nativeCluster.firstItem * baseMultiplier, ore, 75);
				}
				else if (!oreDust.empty)
				{
					mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(oreDust.firstItem * baseMultiplier, ore, 75);
				}
				else
				{
					print("Skipped Magneticraft Grinder outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}

			//Dense Ores
			for oreDense in oreDouble.items
			{
				if(!rockyChunk.empty)
				{
					mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(rockyChunk.firstItem * (2 * baseMultiplier), oreDense, 75);
				}
				else if (!nativeCluster.empty)
				{
					mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(nativeCluster.firstItem * (2 * baseMultiplier), oreDense, 75);
				}
				else if (!oreDust.empty)
				{
					mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(oreDust.firstItem * (2 * baseMultiplier), oreDense, 75);
				}
			}
		}

		//Magneticraft Grinder -- Tier 2 (2x)
		if(tier <= 2)
		{
			//Standard Ores
			for ore in oreBlock.items
			{
				if(!rockyChunk.empty)
				{
					mods.magneticraft.Grinder.addRecipe(ore, rockyChunk.firstItem * baseMultiplier, <minecraft:gravel>, 0.33, (tier + 1) * 40, true);
				}
				else if (!nativeCluster.empty)
				{
					mods.magneticraft.Grinder.addRecipe(ore, nativeCluster.firstItem * baseMultiplier, <minecraft:gravel>, 0.5, (tier + 1) * 40, true);
				}
				else if (!oreDust.empty)
				{
					mods.magneticraft.Grinder.addRecipe(ore, oreDust.firstItem * (2 * baseMultiplier), <minecraft:gravel>, 0.5, (tier + 1) * 40, true);
				}
				else
				{
					print("Skipped Magneticraft Grinder outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}

			//Dense Ores
			for oreDense in oreDouble.items
			{
				if(!rockyChunk.empty)
				{
					mods.magneticraft.Grinder.addRecipe(oreDense, rockyChunk.firstItem * 2, <minecraft:gravel>, 0.33, (tier + 1) * 80, true);
				}
				else if (!nativeCluster.empty)
				{
					mods.magneticraft.Grinder.addRecipe(oreDense, nativeCluster.firstItem * 2, <minecraft:gravel>, 0.5, (tier + 1) * 80, true);
				}
				else if (!oreDust.empty)
				{
					mods.magneticraft.Grinder.addRecipe(oreDense, oreDust.firstItem * 4, <minecraft:gravel>, 0.5, (tier + 1) * 80, true);
				}
			}
		}

		//Blood Magic Alchemy Table -- Tier 2 (2x)
		if(tier <= 2)
		{
			//Standard Ores
			for ore in oreBlock.items
			{
				if(!nativeCluster.empty)
				{
					mods.bloodmagic.AlchemyTable.addRecipe(nativeCluster.firstItem * baseMultiplier, [<bloodmagic:cutting_fluid>, ore], (tier + 1) * 4, (tier + 1) * 60, tier + 1);
				}
				else if (!oreGem.empty)
				{
					mods.bloodmagic.AlchemyTable.addRecipe(oreGem.firstItem * baseMultiplier, [<bloodmagic:cutting_fluid>, ore], (tier + 1) * 4, (tier + 1) * 60, tier + 1);
				}
				else if (!oreDust.empty)
				{
					mods.bloodmagic.AlchemyTable.addRecipe(oreDust.firstItem * (2 * baseMultiplier), [<bloodmagic:cutting_fluid>, ore], (tier + 1) * 4, (tier + 1) * 60, tier + 1);
				}
				else
				{
					print("Skipped Blood Magic Alchemy Table outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}

			//Dense Ores
			for oreDense in oreDouble.items
			{
				if(!nativeCluster.empty)
				{
					mods.bloodmagic.AlchemyTable.addRecipe(nativeCluster.firstItem * (2 * baseMultiplier), [<bloodmagic:cutting_fluid>, oreDense], (tier + 1) * 8, (tier + 1) * 120, tier + 1);
				}
				else if (!oreGem.empty)
				{
					mods.bloodmagic.AlchemyTable.addRecipe(oreGem.firstItem * (2 * baseMultiplier), [<bloodmagic:cutting_fluid>, oreDense], (tier + 1) * 8, (tier + 1) * 120, tier + 1);
				}
				else if (!oreDust.empty)
				{
					mods.bloodmagic.AlchemyTable.addRecipe(oreDust.firstItem * (4 * baseMultiplier), [<bloodmagic:cutting_fluid>, oreDense], (tier + 1) * 8, (tier + 1) * 120, tier + 1);
				}
			}
		}

		//Magneticraft Sluice Box -- Tier 2  (2.5x)
		if(tier <= 2)
		{
			//Always output 2x, 50% of the time output an additional 1x
			//Average to 2.5x output
			//Only process native clusters and rocky chunks!!
			if(!nativeCluster.empty)
			{
				//Native Cluster Based output
				if (!oreGem.empty)
				{
					mods.magneticraft.SluiceBox.addRecipe(nativeCluster.firstItem, 1.0, oreGem.firstItem * (2 * baseMultiplier), 0.5, oreGem.firstItem * baseMultiplier, 0.15, <minecraft:cobblestone>, true);
				}
				else if (!oreDust.empty)
				{
					mods.magneticraft.SluiceBox.addRecipe(nativeCluster.firstItem, 1.0, oreDust.firstItem * (2 * baseMultiplier), 0.5, oreDust.firstItem * (2 * baseMultiplier), 0.15, <minecraft:cobblestone>, true);
				}
				else
				{
					print("Skipped Magneticraft Sluice Box outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}

			if (!rockyChunk.empty)
			{
				//Rocky Chunk Based Output
				if (!oreGem.empty)
				{
					mods.magneticraft.SluiceBox.addRecipe(rockyChunk.firstItem, 1.0, oreGem.firstItem * baseMultiplier, 0.5, oreGem.firstItem * baseMultiplier, 0.15, <minecraft:cobblestone>, true);
				}
				else if (!oreDust.empty)
				{
					mods.magneticraft.SluiceBox.addRecipe(rockyChunk.firstItem, 1.0, oreDust.firstItem * (2 * baseMultiplier), 0.5, oreDust.firstItem * (2 * baseMultiplier), 0.15, <minecraft:cobblestone>, true);
				}
				else
				{
					print("Skipped Magneticraft Sluice Box outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}
		}

		//Magneticraft Sieve -- Tier 2 (2.75x)
		if(tier <= 2)
		{
			//Always output 2x, 50% of the time output an additional 1x, 25% of the time output an additonal 1x
			//Average to 2.75x output
			//Only process native clusters and rocky chunks!!
			if(!nativeCluster.empty)
			{
				if (!oreGem.empty)
				{
					mods.magneticraft.Sieve.addRecipe(nativeCluster.firstItem, oreGem.firstItem * (2 * baseMultiplier), 1.0, oreGem.firstItem * baseMultiplier, 0.5, oreGem.firstItem, 0.25, (tier + 1) * 40, true);
				}
				else if (!oreDust.empty)
				{
					mods.magneticraft.Sieve.addRecipe(nativeCluster.firstItem, oreDust.firstItem * (2 * baseMultiplier), 1.0, oreDust.firstItem * baseMultiplier, 0.5, oreDust.firstItem, 0.25, (tier + 1) * 40, true);
				}
				else
				{
					print("Skipped Magneticraft Sieve outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}

			if (!rockyChunk.empty)
			{
				if (!oreGem.empty)
				{
					mods.magneticraft.Sieve.addRecipe(rockyChunk.firstItem, oreGem.firstItem * (2 * baseMultiplier), 1.0, oreGem.firstItem * baseMultiplier, 0.5, oreGem.firstItem, 0.25, (tier + 1) * 40, true);
				}
				else if (!oreDust.empty)
				{
					mods.magneticraft.Sieve.addRecipe(rockyChunk.firstItem, oreDust.firstItem * (2 * baseMultiplier), 1.0, oreDust.firstItem * baseMultiplier, 0.5, oreDust.firstItem, 0.25, (tier + 1) * 40, true);
				}
				else
				{
					print("Skipped Magneticraft Sieve outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}
		}

		//Ore Washing Factory -- Tier 3 (3x)
		if(tier <= 3)
		{
			//Use method in mmhelper.zs file.
			scripts.mmhelper.AddOreWashingRecipe(craftingMaterial, tier);
		}

		//Astral Sorcery Starlight Infusion -- Tier 3 (3x)
		if(tier <= 3)
		{
			//Standard Ore
			for ore in oreBlock.items
			{
				if (!oreGem.empty)
				{
					mods.astralsorcery.StarlightInfusion.addInfusion(ore, oreGem.firstItem * (3 * baseMultiplier), false, 0.5, (tier+1) * 80);
				}
				else if (!oreDust.empty)
				{
					mods.astralsorcery.StarlightInfusion.addInfusion(ore, oreDust.firstItem * (3 * baseMultiplier), false, 0.5, (tier+1) * 60);
				}
				else
				{
					print("Skipped Astral Sorcery Starlight Infusion outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}

			//Dense Ore
			for oreDense in oreDouble.items
			{
				if (!oreGem.empty)
				{
					mods.astralsorcery.StarlightInfusion.addInfusion(oreDense, oreGem.firstItem * (6 * baseMultiplier), false, 0.7, ((tier+1) * 160));
				}
				else if (!oreDust.empty)
				{
					mods.astralsorcery.StarlightInfusion.addInfusion(oreDense, oreDust.firstItem * (6 * baseMultiplier), false, 0.7, ((tier+1) * 120));
				}
			}
		}

		//Thermal Expansion Pulverizer -- Tier 4 (3x)
		if(tier <= 4)
		{
			if(!oreGem.empty)
			{
				//Standard Ore
				scripts.helpers.addCrushingRecipeWithSecondary(oreGem.firstItem * (3 * baseMultiplier), oreBlock.firstItem, ((tier + 1) * 1500), oreGem.firstItem * 3, 50);

				//Dense Ore
				if(!oreDouble.empty)
				{
					scripts.helpers.addCrushingRecipeWithSecondary(oreGem.firstItem * (6 * baseMultiplier), oreBlock.firstItem, ((tier + 1) * 1500), oreGem.firstItem * 6, 50);
				}
			}
			else if(!oreDust.empty)
			{
				scripts.helpers.addCrushingRecipeWithSecondary(oreDust.firstItem * (3 * baseMultiplier), oreBlock.firstItem, ((tier + 1) * 1500), oreDust.firstItem * 3, 50);

				//Dense Ore
				if(!oreDouble.empty)
				{
					for oreDense in oreDouble.items
					{
						scripts.helpers.addCrushingRecipeWithSecondary(oreDust.firstItem * (6 * baseMultiplier), oreBlock.firstItem, ((tier + 1) * 1500), oreDust.firstItem * 6, 50);
					}
				}
			}
			else
			{
				print("Skipped Thermal Expansion Pulverizer outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
			}
		}

		//Induction Furnace (Basic Catalysts) -- Tier 4 (3x)
		if(tier <= 4)
		{
			if(!oreGem.empty)
			{
				//Standard Ores
				//Normal Slag
				scripts.helpers.addAlloySmeltingRecipeWithSecondary(oreGem.firstItem * (3 * baseMultiplier), <thermalfoundation:material:864>, oreBlock.firstItem, ((tier + 1) * 3000), oreGem.firstItem * 1, 33);
				//Rich Slag
				scripts.helpers.addAlloySmeltingRecipeWithSecondary(oreGem.firstItem * (4 * baseMultiplier), <thermalfoundation:material:865>, oreBlock.firstItem, ((tier + 1) * 3000), oreGem.firstItem * 2, 80);

				//Dense Ore
				if(!oreDouble.empty)
				{
					for oreDense in oreDouble.items
					{
						//Normal Slag
						scripts.helpers.addAlloySmeltingRecipeWithSecondary(oreGem.firstItem * (6 * baseMultiplier), <thermalfoundation:material:864>, oreBlock.firstItem, ((tier + 1) * 3000), oreGem.firstItem * 2, 33);
						//Rich Slag
						scripts.helpers.addAlloySmeltingRecipeWithSecondary(oreGem.firstItem * (8 * baseMultiplier), <thermalfoundation:material:865>, oreBlock.firstItem, ((tier + 1) * 3000), oreGem.firstItem * 4, 80);
					}
				}
			}
			else if(!oreIngot.empty)
			{
				if(!oreDustSmall.empty)
				{
					//Standard Ores
					//Normal Slag
					scripts.helpers.addAlloySmeltingRecipeWithSecondary(oreIngot.firstItem * (3 * baseMultiplier), <thermalfoundation:material:864>, oreBlock.firstItem, ((tier + 1) * 3000), oreDustSmall.firstItem * 3, 33);
					//Rich Slag
					scripts.helpers.addAlloySmeltingRecipeWithSecondary(oreIngot.firstItem * (4 * baseMultiplier), <thermalfoundation:material:865>, oreBlock.firstItem, ((tier + 1) * 3000), oreDustSmall.firstItem * 6, 80);

					//Dense Ores
					if(!oreDouble.empty)
					{
						for oreDense in oreDouble.items
						{
							//Normal Slag
							scripts.helpers.addAlloySmeltingRecipeWithSecondary(oreIngot.firstItem * (6 * baseMultiplier), <thermalfoundation:material:864>, oreBlock.firstItem, ((tier + 1) * 3000), oreDustSmall.firstItem * 6, 33);
							//Rich Slag
							scripts.helpers.addAlloySmeltingRecipeWithSecondary(oreIngot.firstItem * (8 * baseMultiplier), <thermalfoundation:material:865>, oreBlock.firstItem, ((tier + 1) * 3000), oreDustSmall.firstItem * 12, 80);
						}
					}
				}
				else
				{
					//Standard Ores
					//Normal Slag
					scripts.helpers.addAlloySmeltingRecipeWithSecondary(oreIngot.firstItem * (3 * baseMultiplier), <thermalfoundation:material:864>, oreBlock.firstItem, ((tier + 1) * 3000), oreIngot.firstItem, 33);
					//Rich Slag
					scripts.helpers.addAlloySmeltingRecipeWithSecondary(oreIngot.firstItem * (4 * baseMultiplier), <thermalfoundation:material:865>, oreBlock.firstItem, ((tier + 1) * 3000), oreIngot.firstItem * 2, 80);

					//Dense Ores
					if(!oreDouble.empty)
					{
						//Normal Slag
						scripts.helpers.addAlloySmeltingRecipeWithSecondary(oreIngot.firstItem * (6 * baseMultiplier), <thermalfoundation:material:865>, oreBlock.firstItem, ((tier + 1) * 3000), oreIngot.firstItem * 2, 80);
						//Rich Slag
						scripts.helpers.addAlloySmeltingRecipeWithSecondary(oreIngot.firstItem * (8 * baseMultiplier), <thermalfoundation:material:865>, oreBlock.firstItem, ((tier + 1) * 3000), oreIngot.firstItem * 4, 80);
					}
				}
			}
			else
			{
				print("Skipped Thermal Expansion Induction Furnace (Basic Catalysts) outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
			}
		}

		//Mekanism Purification Chamber -- Tier 5 (3x)
		if(tier <= 5)
		{
			if(!oreClump.empty)
			{
				//Standard Ores
				for ore in oreBlock.items
				{
					mods.mekanism.purification.addRecipe(ore, <gas:oxygen> * 200, oreClump.firstItem * (3 * baseMultiplier));
				}

				//Dense Ores
				for oreDense in oreDouble.items
				{
					mods.mekanism.purification.addRecipe(oreDense, <gas:oxygen> * 200, oreClump.firstItem * (6 * baseMultiplier));
				}
			}
			else if(!oreGem.empty)
			{
				//Standard Ores
				for ore in oreBlock.items
				{
					mods.mekanism.purification.addRecipe(ore, <gas:oxygen> * 200, oreGem.firstItem * (3 * baseMultiplier));
				}

				//Dense Ores
				for oreDense in oreDouble.items
				{
					mods.mekanism.purification.addRecipe(oreDense, <gas:oxygen> * 200, oreGem.firstItem * (6 * baseMultiplier));
				}
			}
			else
			{
				print("Skipped Mekanism Purification Chamber outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
			}
		}

		//Mekanism Enrichment Chamber -- Tier 5 (2x)
		if(tier <= 5)
		{
			if(!oreGem.empty)
			{
				//Standard Ores
				for ore in oreBlock.items
				{
					mods.mekanism.enrichment.addRecipe(ore, oreGem.firstItem * (2 * baseMultiplier));
				}

				//Dense Ores
				for oreDense in oreDouble.items
				{
					mods.mekanism.enrichment.addRecipe(oreDense, oreGem.firstItem * (4 * baseMultiplier));
				}
			}
			else if(!oreDust.empty)
			{
				//Standard Ores
				for ore in oreBlock.items
				{
					mods.mekanism.enrichment.addRecipe(ore, oreDust.firstItem * (2 * baseMultiplier));
				}

				//Dense Ores
				for oreDense in oreDouble.items
				{
					mods.mekanism.enrichment.addRecipe(oreDense, oreDust.firstItem * (4 * baseMultiplier));
				}
			}
			else
			{
				print("Skipped Mekanism Enrichment Chamber outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
			}
		}

		//Induction Furnace (Advanced Catalysts) -- Tier 5 (4x)
		if(tier <= 5)
		{
			//TODO
		}

		//Mekanism Chemical Injection Chamber -- Tier 6 (4x)
		if(tier <= 6)
		{
			//Standard Ores
			for ore in oreBlock.items
			{
				if(!oreShard.empty)
				{
					mods.mekanism.chemical.injection.addRecipe(ore, <gas:hydrogenchloride> * 200, oreShard.firstItem * (4 * baseMultiplier));
				}
				else if(!oreGem.empty)
				{
					mods.mekanism.chemical.injection.addRecipe(ore, <gas:hydrogenchloride> * 200, oreGem.firstItem * scripts.helpers.mathMin((8 * baseMultiplier), 64));
				}
				else
				{
					print("Skipped Mekanism Chemical Injection Chamber outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}

			//Dense Ores
			for oreDense in oreDouble.items
			{
				if(!oreShard.empty)
				{
					mods.mekanism.chemical.injection.addRecipe(oreDense, <gas:hydrogenchloride> * 200, oreShard.firstItem * (8 * baseMultiplier));
				}
				else if(!oreGem.empty)
				{
					mods.mekanism.chemical.injection.addRecipe(oreDense, <gas:hydrogenchloride> * 200, oreGem.firstItem * scripts.helpers.mathMin((16 * baseMultiplier), 64));
				}
			}
		}

		//Advanced Rocketry Arc Furnace -- Tier 6 (4x)
		if(tier <= 6)
		{
			if(!oreGem.empty)
			{
				//Standard Ores
				for ore in oreBlock.items
				{
					mods.advancedrocketry.ArcFurnace.addRecipe(oreGem.firstItem * (4 * baseMultiplier), ((tier + 1) * 120) / 3, (tier + 1) * 75, ore, <minecraft:sand>);
				}

				//Dense Ores
				for oreDense in oreDouble.items
				{
					mods.advancedrocketry.ArcFurnace.addRecipe(oreGem.firstItem * (8 * baseMultiplier), ((tier + 1) * 120) / 3, (tier + 1) * 75, oreDense, <minecraft:sand>);
				}
			}
			else if(!oreIngot.empty)
			{
				//Standard Ores
				for ore in oreBlock.items
				{
					mods.advancedrocketry.ArcFurnace.addRecipe(oreIngot.firstItem * (4 * baseMultiplier), ((tier + 1) * 120) / 3, (tier + 1) * 75, ore, <minecraft:sand>);
				}

				//Dense Ores
				for oreDense in oreDouble.items
				{
					mods.advancedrocketry.ArcFurnace.addRecipe(oreIngot.firstItem * (8 * baseMultiplier), ((tier + 1) * 120) / 3, (tier + 1) * 75, oreDense, <minecraft:sand>);
				}
			}
			else
			{
				print("Skipped Advanced Rocketry Arc Furnace outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
			}
		}

		//Mekanism Chemical Dissolution Chamber -- Tier 7 (5x)
		if(tier <= 7)
		{
			if(!oreCrystal.empty)
			{
				//Use method in mmhelper.zs file.
				scripts.mmhelper.ChemicalOreFactoryRecipe(craftingMaterial, tier);
			}

			//Add other mekanism oreprocessing for compat
			if(!oreCrystal.empty & !oreShard.empty)
			{
				mods.mekanism.chemical.injection.addRecipe(oreCrystal.firstItem, <gas:hydrogenchloride> * 200, oreShard.firstItem);

				if(!oreClump.empty)
				{
					mods.mekanism.purification.addRecipe(oreShard.firstItem, <gas:oxygen> * 200, oreClump.firstItem);

					if(!oreDirtyDust.empty)
					{
						mods.mekanism.crusher.addRecipe(oreClump.firstItem, oreDirtyDust.firstItem);

						if(!oreDust.empty)
						{
							mods.mekanism.enrichment.addRecipe(oreDirtyDust.firstItem, oreDust.firstItem);
						}
					}
					else if (!oreDict.get("dustDirty" ~ craftingMaterial).empty)
					{
						mods.mekanism.crusher.addRecipe(oreClump.firstItem, oreDict.get("dustDirty" ~ craftingMaterial).firstItem);

						if(!oreDust.empty)
						{
							mods.mekanism.enrichment.addRecipe(oreDict.get("dustDirty" ~ craftingMaterial).firstItem, oreDust.firstItem);
						}
					}
				}
			}
		}

		//Further ore processing goes here
	}
}

function AddMeltedRecipes(craftingMaterial as string, tier as int, molten as ILiquidStack)
{
	var oreBlock = oreDict.get("ore" ~ craftingMaterial);

	if(!oreBlock.empty)
	{
		if(tier <= 1)
		{
			for ore in oreBlock.items
			{
				//TCon Smeltery -- Tier 1 (1x)
				mods.tconstruct.Melting.addRecipe(molten * ((2 - tier) * 144), ore);

				//Embers Melter -- Tier 1 (2x)
				mods.embers.Melter.add(molten * 288, ore);
			}
		}
	}
	else
	{
		print("Could not add melting recipes for " ~ craftingMaterial ~ " as no ore blocks were found.");
	}
}

function markwithProcessingTier(craftingMaterial as string, tier as int)
{
	if(craftingMaterial != "Chromium" & craftingMaterial != "ChargedCertusQuartz")
	{
		val OreDicts = [
			oreDict.get("ore" ~ craftingMaterial),
			oreDict.get("denseOre" ~ craftingMaterial),
			oreDict.get("poorOre" ~ craftingMaterial),
			oreDict.get("cluster" ~ craftingMaterial),
			oreDict.get("dust" ~ craftingMaterial),
			oreDict.get("ingot" ~ craftingMaterial),
			oreDict.get("gem" ~ craftingMaterial),
			oreDict.get("clump" ~ craftingMaterial),
			oreDict.get("shard" ~ craftingMaterial),
			oreDict.get("dirtyDust" ~ craftingMaterial),
			oreDict.get("crystal" ~ craftingMaterial),
			oreDict.get("poorOre" ~ craftingMaterial),
			oreDict.get("dustSmall" ~ craftingMaterial),
			oreDict.get("rockyChunk" ~ craftingMaterial),
			oreDict.get("chunk" ~ craftingMaterial),
			oreDict.get("dustDirty" ~ craftingMaterial),
			oreDict.get("nugget" ~ craftingMaterial),
			oreDict.get("block" ~ craftingMaterial)
		] as crafttweaker.oredict.IOreDictEntry[];

		for oreDict in OreDicts
		{
			//Check if ore even exists
			if(!oreDict.empty)
			{
				for ore in oreDict.items
				{
					ore.addTooltip(scripts.helpers.createTierTooltip("Ore Processing Tier: ", tier, false, ""));
				}
			}
		}
	}
}

//Stop Issues with Galena Ore!
<ore:oreSilver>.remove(<magneticraft:ores:1>);
<ore:oreLead>.remove(<magneticraft:ores:1>);

//Add Gem Smelting from Gem Dust -> Gems
var GemDusts =
[
	"Ruby",
	"Sapphire",
	"Peridot",
	"Amber",
	"Amethyst",
	"Apatite",
	"Aquamarine",
	"CertusQuartz",
	"ChargedCertusQuartz",
	"Dilithium",
	"DimensionalShard",
	"EnderBiotite",
	"Lapis",
	"Malachite",
	"Tanzanite",
	"Diamond",
	"Topaz"
] as string[];

for ore in GemDusts
{
	var oreDust = oreDict.get("dust" ~ ore);
	var oreGem = oreDict.get("gem" ~ ore);

	for ore in oreDust.items
	{
		furnace.addRecipe(oreGem.firstItem, ore, 0.0);
		mods.futuremc.BlastFurnace.addRecipe(ore, oreGem.firstItem);
	}
}

//Embers Melter
val EmberMelting = [
	<forestry:resources:2>,
	<thermalfoundation:ore:5>,
	<embers:ore_aluminum>,
	<embers:ore_lead>,
	<libvulpes:ore0:4>,
	<iceandfire:silver_ore>,
	<minecraft:gold_ore>,
	<minecraft:iron_ore>
] as crafttweaker.item.IItemStack[];

for ore in EmberMelting
{
	mods.embers.Melter.remove(ore);
}

//Remove some specific Furnace Recipes that still manage to persist
furnace.remove(<minecraft:redstone>, <minecraft:redstone_ore>);
furnace.remove(<magneticraft:ingots:3>, <magneticraft:ores:1>);
furnace.remove(<draconicevolution:draconium_ingot>);
furnace.remove(<libvulpes:productdust>);
mods.thermalexpansion.RedstoneFurnace.removeRecipe(<minecraft:redstone_ore>);
mods.thermalexpansion.RedstoneFurnace.removeRecipe(<minecraft:lapis_ore>);

//Electric Arc Furnace Titanium Ingot
mods.advancedrocketry.ArcFurnace.removeRecipe(<libvulpes:productingot:7>);

//Remove Mekanism Ore Processing Recipes
mods.mekanism.chemical.injection.removeAllRecipes();
mods.mekanism.purification.removeAllRecipes();
mods.mekanism.enrichment.removeRecipe(<minecraft:stonebrick:1>);

//Remove Sluice Box Recipes
val SluiceBox = [
	<minecraft:sand:1>,
	<minecraft:gravel>,
	<magneticraft:rocky_chunks:14>,
	<magneticraft:rocky_chunks:13>,
	<magneticraft:rocky_chunks:12>,
	<magneticraft:rocky_chunks:11>,
	<magneticraft:rocky_chunks:10>,
	<magneticraft:rocky_chunks:9>,
	<magneticraft:rocky_chunks:7>,
	<magneticraft:rocky_chunks:5>,
	<magneticraft:rocky_chunks:4>,
	<magneticraft:rocky_chunks:3>,
	<magneticraft:rocky_chunks:2>,
	<magneticraft:rocky_chunks:1>,
	<magneticraft:rocky_chunks>
] as crafttweaker.item.IItemStack[];

for ore in SluiceBox
{
	mods.magneticraft.SluiceBox.removeRecipe(ore);
}

//Remove Magneticraft Sieve Recipes
val SieveRecipes = [
	<minecraft:soul_sand>,
	<minecraft:sand>,
	<minecraft:gravel>,
	<magneticraft:rocky_chunks:14>,
	<magneticraft:rocky_chunks:13>,
	<magneticraft:rocky_chunks:12>,
	<magneticraft:rocky_chunks:11>,
	<magneticraft:rocky_chunks:10>,
	<magneticraft:rocky_chunks:9>,
	<magneticraft:rocky_chunks:7>,
	<magneticraft:rocky_chunks:5>,
	<magneticraft:rocky_chunks:4>,
	<magneticraft:rocky_chunks:3>,
	<magneticraft:rocky_chunks:2>,
	<magneticraft:rocky_chunks:1>,
	<magneticraft:rocky_chunks>
] as crafttweaker.item.IItemStack[];

for ore in SieveRecipes
{
	mods.magneticraft.Sieve.removeRecipe(ore);
}

val CrusherRecipes = [
	<mekanism:dirtydust>,
	<mekanism:dirtydust:6>,
	<mekanism:dirtydust:1>,
	<mekanism:dirtydust:2>,
	<mekanism:dirtydust:4>,
	<mekanism:dirtydust:5>,
	<mekanism:dirtydust:3>
] as crafttweaker.item.IItemStack[];

for dust in CrusherRecipes
{
	mods.mekanism.crusher.removeRecipe(dust);
}

//Remove Enrichment Chamber Recipes
val EnrichmentChamber = [
	<mekanism:dirtydust:1>,
	<mekanism:dirtydust>,
	<mekanism:dirtydust:3>,
	<mekanism:dirtydust:2>,
	<mekanism:dirtydust:5>,
	<mekanism:dirtydust:4>,
	<mekanism:dirtydust:6>,
	<draconicevolution:draconium_ore:1>,
	<draconicevolution:draconium_ore>,
	<draconicevolution:draconium_ore:2>,
	<biomesoplenty:gem_ore:2>,
	<biomesoplenty:gem_ore:3>,
	<biomesoplenty:gem_ore:1>,
	<biomesoplenty:gem_ore:7>,
	<biomesoplenty:gem_ore>,
	<iceandfire:silver_ore>,
	<biomesoplenty:gem_ore:5>,
	<biomesoplenty:gem_ore:6>,
	<minecraft:coal_ore>,
	<biomesoplenty:gem_ore:4>,
	<embers:ore_silver>,
	<libvulpes:ore0:9>,
	<appliedenergistics2:quartz_ore>,
	<libvulpes:ore0:10>,
	<minecraft:lapis_ore>,
	<forestry:resources>,
	<forestry:resources:2>,
	<forestry:resources:1>,
	<libvulpes:ore0:5>,
	<libvulpes:ore0:4>,
	<minecraft:gold_ore>,
	<minecraft:diamond_ore>,
	<magneticraft:ores>,
	<magneticraft:ores:1>,
	<thaumcraft:ore_amber>,
	<mekanism:oreblock>,
	<mekanism:oreblock:1>,
	<mekanism:oreblock:2>,
	<minecraft:quartz_ore>,
	<contenttweaker:sub_block_holder_10:14>,
	<contenttweaker:sub_block_holder_11:2>,
	<contenttweaker:sub_block_holder_11:4>,
	<minecraft:emerald_ore>,
	<embers:ore_quartz>,
	<embers:ore_tin>,
	<minecraft:redstone_ore>,
	<embers:ore_nickel>,
	<embers:ore_aluminum>,
	<minecraft:iron_ore>,
	<embers:ore_lead>,
	<appliedenergistics2:charged_quartz_ore>,
	<thermalfoundation:ore:8>,
	<thermalfoundation:ore:3>,
	<thermalfoundation:ore:2>,
	<thermalfoundation:ore:1>,
	<thermalfoundation:ore>,
	<thermalfoundation:ore:7>,
	<thermalfoundation:ore:6>,
	<thermalfoundation:ore:4>,
	<thermalfoundation:ore:5>,
	<iceandfire:sapphire_ore>,
	<embers:ore_copper>,
	<thaumcraft:ore_quartz>
] as crafttweaker.item.IItemStack[];

for ore in EnrichmentChamber
{
	mods.mekanism.enrichment.removeRecipe(ore);
}

//Magneticraft Grinder Ores
val GrinderOres = [
	<forestry:resources:1>,
	<thermalfoundation:ore:3>,
	<tconstruct:ore>,
	<magneticraft:ores:3>,
	<embers:ore_aluminum>,
	<thermalfoundation:ore:8>,
	<thermalfoundation:ore:5>,
	<mekanism:oreblock>,
	<thermalfoundation:ore:2>,
	<forestry:resources:2>,
	<contenttweaker:sub_block_holder_11:6>,
	<rftools:dimensional_shard_ore>,
	<minecraft:lapis_ore>,
	<minecraft:redstone_ore>,
	<minecraft:quartz_ore>,
	<minecraft:emerald_ore>,
	<minecraft:diamond_ore>,
	<minecraft:coal_ore>,
	<minecraft:gold_ore>,
	<minecraft:iron_ore>
] as crafttweaker.item.IItemStack[];

for oreBlock in GrinderOres
{
	mods.magneticraft.Grinder.removeRecipe(oreBlock);
}

//Remove TCon Melting
val MeltingMaterials =
{
	"Iron" : <liquid:iron>,
	"Gold" : <liquid:gold>,
	"Redstone" : <liquid:redstone>,
	"Diamond" : <liquid:water>,
	"Emerald" : <liquid:emerald>,
	"Chrome" : <liquid:chromium>,
	"Aluminum" : <liquid:aluminum>,
	"Copper" : <liquid:copper>,
	"Iridium" : <liquid:iridium>,
	"Lead" : <liquid:lead>,
	"Nickel" : <liquid:nickel>,
	"Platinum" : <liquid:platinum>,
	"Silver" : <liquid:silver>,
	"Tin" : <liquid:tin>,
	"Titanium" : <liquid:titanium>,
	"Tungsten" : <liquid:tungsten>,
	"Zinc" : <liquid:zinc>,
	"Mithril" : <liquid:mithril>,
	"Yellorium" : <liquid:yellorium>,
	"Vibranium" : <liquid:vibranium>,
	"Necrodermis" : <liquid:necrodermis>,
	"Thorium" : <liquid:thorium>,
	"Chromium" : <liquid:chromium>,
	"Ardite" : <liquid:ardite>,
	"AstralStarmetal" : <liquid:astral_starmetal>,
	"Cobalt" : <liquid:cobalt>,
	"Draconium" : <liquid:draconium>,
	"Uranium" : <liquid:uranium>,
	"Osmium" : <liquid:osmium>,
	"Galena" : <liquid:lead>
} as ILiquidStack[string];

for oreString, molten in MeltingMaterials
{
	for ore in oreDict.get("ore" ~ oreString).items
	{
		mods.tconstruct.Melting.removeRecipe(molten, ore);
	}
}

//EnderIO Sag Mill Ores
val SagMillOres =
[
	<libvulpes:ore0:9>,
	<thaumcraft:ore_quartz>,
	<libvulpes:ore0>,
	<astralsorcery:blockcustomore:1>,
	<contenttweaker:sub_block_holder_0:5>,
	<libvulpes:ore0:10>,
	<quark:biotite_ore>,
	<draconicevolution:draconium_ore:2>,
	<draconicevolution:draconium_ore:1>,
	<draconicevolution:draconium_ore>,
	<magneticraft:ores:3>,
	<libvulpes:ore0:8>,
	<contenttweaker:sub_block_holder_10:14>,
	<tconstruct:ore>,
	<tconstruct:ore:1>,
	<mekanism:oreblock>,
	<thermalfoundation:ore:8>,
	<thermalfoundation:ore:6>,
	<contenttweaker:sub_block_holder_11:6>,
	<biomesoplenty:gem_ore>,
	<biomesoplenty:gem_ore:7>,
	<biomesoplenty:gem_ore:6>,
	<biomesoplenty:gem_ore:5>,
	<biomesoplenty:gem_ore:4>,
	<biomesoplenty:gem_ore:3>,
	<biomesoplenty:gem_ore:2>,
	<biomesoplenty:gem_ore:1>,
	<appliedenergistics2:charged_quartz_ore>,
	<appliedenergistics2:quartz_ore>,
	<forestry:resources>,
	<minecraft:quartz_ore>,
	<minecraft:lapis_ore>,
	<minecraft:emerald_ore>,
	<minecraft:diamond_ore>,
	<minecraft:redstone_ore>,
	<minecraft:coal_ore>,
	<embers:ore_nickel>,
	<iceandfire:silver_ore>,
	<embers:ore_lead>,
	<libvulpes:ore0:5>,
	<magneticraft:ores>,
	<minecraft:gold_ore>,
	<minecraft:iron_ore>,
	<contenttweaker:sub_block_holder_1:12>,
	<contenttweaker:sub_block_holder_12:15>,
	<contenttweaker:sub_block_holder_1:13>,
	<rftools:dimensional_shard_ore>
] as crafttweaker.item.IItemStack[];

for oreBlock in SagMillOres
{
	mods.enderio.SagMill.removeRecipe(oreBlock);
}

//Starlight Infusion Output
val StarlightInfusionOutput =
[
	<minecraft:iron_ingot> * 3,
	<minecraft:gold_ingot> * 3,
	<minecraft:lapis_block>,
	<minecraft:redstone_block>,
	<minecraft:diamond>,
	<minecraft:emerald>
] as crafttweaker.item.IItemStack[];

for infusionOutput in StarlightInfusionOutput
{
	mods.astralsorcery.StarlightInfusion.removeInfusion(infusionOutput);
}

//List of Induction Smelter Ores to Handle
val InductionSmelterOres =
[
	"Tungsten",
	"Copper",
	"Iridium",
	"Lead",
	"Silver",
	"Mithril",
	"Uranium",
	"Nickel",
	"Zinc",
	"Aluminum",
	"Platinum",
	"Gold",
	"Osmium",
	"Cobalt",
	"Iron",
	"Yellorium",
	"Tin",
	"Ardite",
	"Titanium"
] as string[];

for ore in InductionSmelterOres
{
	//Sand-based input
	mods.thermalexpansion.InductionSmelter.removeRecipe(oreDict.get("ore" ~ ore).firstItem, <minecraft:sand>);

	//Rich slag-based input
	mods.thermalexpansion.InductionSmelter.removeRecipe(oreDict.get("ore" ~ ore).firstItem, <thermalfoundation:material:865>);

	//Cinnabar-based input
	mods.thermalexpansion.InductionSmelter.removeRecipe(oreDict.get("ore" ~ ore).firstItem, <thermalfoundation:material:866>);
}

//Remove Magma Crucible Ore Smelting
val MagmaCrucible =
[
	<minecraft:emerald_ore>,
	<tconstruct:ore>,
	<embers:ore_nickel>,
	<magneticraft:ores:3>,
	<contenttweaker:sub_block_holder_7:1>,
	<thermalfoundation:ore:2>,
	<contenttweaker:sub_block_holder_11:6>,
	<draconicevolution:draconium_ore:1>,
	<astralsorcery:blockcustomore:1>,
	<tconstruct:ore:1>,
	<thermalfoundation:ore:7>,
	<minecraft:iron_ore>,
	<contenttweaker:sub_block_holder_10:14>,
	<libvulpes:ore0:8>,
	<embers:ore_lead>,
	<contenttweaker:sub_block_holder_12:14>,
	<mekanism:oreblock>,
	<thermalfoundation:ore>,
	<mekanism:oreblock:2>,
	<thermalfoundation:ore:6>,
	<contenttweaker:sub_block_holder_0>,
	<minecraft:gold_ore>,
	<libvulpes:ore0:9>,
	<contenttweaker:sub_block_holder_9:4>,
	<contenttweaker:sub_block_holder_4:1>
] as crafttweaker.item.IItemStack[];

for ore in MagmaCrucible
{
	mods.thermalexpansion.Crucible.removeRecipe(ore);
}

//Remove some extra Induction Smelter Recipes
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:redstone_ore>, <minecraft:sand>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:lapis_ore>, <minecraft:sand>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:quartz_ore>, <minecraft:sand>);

//Remove Mekanism Ore Crystallization
val ChemicalCrystallizer =
[
	<mekanism:crystal>,
	<mekanism:crystal:1>,
	<mekanism:crystal:2>,
	<mekanism:crystal:3>,
	<mekanism:crystal:4>,
	<mekanism:crystal:5>,
	<mekanism:crystal:6>
] as crafttweaker.item.IItemStack[];

for ore in ChemicalCrystallizer
{
	mods.mekanism.chemical.crystallizer.removeRecipe(ore);
}

//Remove all chemical washer recipes
mods.mekanism.chemical.washer.removeAllRecipes();

//Remove existing Quartz Grindstone Recipes
val grindstoneOres =
[
  <thermalfoundation:ore>,
  <embers:ore_copper>,
  <embers:ore_lead>,
  <thermalfoundation:ore:2>,
  <embers:ore_nickel>,
  <iceandfire:silver_ore>,
  <embers:ore_aluminum>,
  <libvulpes:ore0:9>,
  <embers:ore_silver>,
  <magneticraft:ores>,
  <thermalfoundation:ore:1>,
  <minecraft:iron_ore>,
  <thermalfoundation:ore:4>,
  <magneticraft:ores:1>,
  <tconstruct:ore:1>,
  <forestry:resources:2>,
  <thermalfoundation:ore:3>,
  <minecraft:gold_ore>,
  <embers:ore_tin>,
  <contenttweaker:sub_block_holder_12:6>,
  <mekanism:oreblock:2>,
  <forestry:resources:1>,
  <minecraft:coal_ore>,
  <libvulpes:ore0:5>,
  <mekanism:oreblock:1>,
  <appliedenergistics2:charged_quartz_ore>,
  <thermalfoundation:ore:6>,
  <thermalfoundation:ore:5>,
  <contenttweaker:sub_block_holder_10:10>,
  <libvulpes:ore0:4>,
  <mekanism:oreblock>,
  <appliedenergistics2:quartz_ore>,
  <contenttweaker:sub_block_holder_11:6>,
  <minecraft:quartz_ore>
] as crafttweaker.item.IItemStack[];

for ore in grindstoneOres
{
	mods.appliedenergistics2.Grinder.removeRecipe(ore);
}

for materialString, oreValue in scripts.helpers.OresWithProcessingTier
{
	//Remove the existing ore processing methods available
	removeExistingCraftingRecipes(materialString);

	//Add new ones based on the tier/stage of the material
	addNewRecipe(materialString, oreValue);

	//Add Melting Processing too
	if(scripts.helpers.OresWithMolten[materialString].name != "water")
	{
		AddMeltedRecipes(materialString, oreValue, scripts.helpers.OresWithMolten[materialString]);
	}

	//Mark each ore with it's tier
	markwithProcessingTier(materialString, oreValue);
}

print("### Ore Processing Init Complete ###");
