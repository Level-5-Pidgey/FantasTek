import crafttweaker.oredict.IOreDict;
import crafttweaker.liquid.ILiquidStack;

print("~~~ Begin Ore Processing Init ~~~");

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
				}
			}
			else if (!oreIngot.empty)
			{
				for ingot in oreIngot.items
				{
					furnace.remove(ingot, ore);
				}
			}
			else if (!oreDust.empty)
			{
				for dust in oreDust.items
				{
					furnace.remove(dust, ore);
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
					furnace.addRecipe(oreGem.firstItem *2, ore, 0.7);
					mods.minecraftfuture.BlastFurnace.addRecipe(ore, oreGem.firstItem * 2);
				}
				else if (!oreIngot.empty)
				{
					furnace.addRecipe(oreIngot.firstItem, ore, 0.7);
					mods.minecraftfuture.BlastFurnace.addRecipe(ore, oreIngot.firstItem);
				}
				else if (!oreDust.empty & oreIngot.empty)
				{
					furnace.addRecipe(oreDust.firstItem, ore, 0.7);
					mods.minecraftfuture.BlastFurnace.addRecipe(ore, oreDust.firstItem);
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
						furnace.addRecipe(oreDustSmall.firstItem * 2, poorOre, 0.1);
					}
					else
					{
						if(!oreNugget.empty)
						{
							furnace.addRecipe(oreNugget.firstItem * 2, poorOre, 0.1);
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
			for ore in oreBlock.items
			{
				if(!nativeCluster.empty)
				{
					mods.thaumcraft.Crucible.registerRecipe("fantastek:metalpurification/" ~ craftingMaterial, "METALPURIFICATION", nativeCluster.firstItem, ore, [<aspect:metallum> * 5, <aspect:ordo> * 5]);
				}
				else if (!oreDust.empty)
				{
					mods.thaumcraft.Crucible.registerRecipe("fantastek:metalpurification/" ~ craftingMaterial, "METALPURIFICATION", oreDust.firstItem * 2, ore, [<aspect:metallum> * 5, <aspect:ordo> * 5]);
				}
				else if (!oreGem.empty)
				{
					mods.thaumcraft.Crucible.registerRecipe("fantastek:metalpurification/" ~ craftingMaterial, "METALPURIFICATION", oreGem.firstItem * 2, ore, [<aspect:vitreus> * 5, <aspect:ordo> * 5]);
				}
				else
				{
					print("Skipped thaumcraft Crucible outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}
		}

		//AE2 Grindstone -- Tier 1 (2x)
		if(tier <= 1)
		{
			if(tier < 1)
			{
				for ore in oreBlock.items
				{
					if (!nativeCluster.empty)
					{
						mods.appliedenergistics2.Grinder.addRecipe(nativeCluster.firstItem, ore, (tier + 1) * 4);
					}
					else if (!oreDust.empty)
					{
						if(!oreDustSmall.empty)
						{
							mods.appliedenergistics2.Grinder.addRecipe(oreDust.firstItem * 1, ore, (tier + 1) * 4, oreDustSmall.firstItem * 3, 0.66, oreDustSmall.firstItem, 0.33);
						}
						else
						{
							mods.appliedenergistics2.Grinder.addRecipe(oreDust.firstItem * 1, ore, (tier + 1) * 4);
						}
					}
					else
					{
						print("Skipped Magneticraft Crushing Table outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
					}
				}
			}
			else
			{
				if (!oreDust.empty)
				{
					for ore in oreBlock.items
					{
						if(!oreDustSmall.empty)
						{
							mods.appliedenergistics2.Grinder.addRecipe(oreDustSmall.firstItem * 3, ore, (tier + 1) * 4, oreDustSmall.firstItem * 2, 0.66, oreDustSmall.firstItem, 0.33);
						}
						else
						{
							mods.appliedenergistics2.Grinder.addRecipe(oreDust.firstItem, ore, (tier + 1) * 4);
						}
					}
				}
				else
				{
					print("Skipped Magneticraft Crushing Table outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}
		}

		//Magneticraft Grinder -- Tier 2 (2x)
		if(tier <= 2)
		{
			for ore in oreBlock.items
			{
				if(!rockyChunk.empty)
				{
					mods.magneticraft.Grinder.addRecipe(ore, rockyChunk.firstItem, <minecraft:gravel>, 0.33, (tier + 1) * 40, true);
				}
				else if (!nativeCluster.empty)
				{
					mods.magneticraft.Grinder.addRecipe(ore, nativeCluster.firstItem, <minecraft:gravel>, 0.5, (tier + 1) * 40, true);
				}
				else if (!oreDust.empty)
				{
					mods.magneticraft.Grinder.addRecipe(ore, oreDust.firstItem * 2, <minecraft:gravel>, 0.5, (tier + 1) * 40, true);
				}
				else
				{
					print("Skipped Magneticraft Grinder outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}
		}

		//Blood Magic Alchemy Table -- Tier 2 (2x)
		if(tier <= 2)
		{
			for ore in oreBlock.items
			{
				if(!nativeCluster.empty)
				{
					mods.bloodmagic.AlchemyTable.addRecipe(nativeCluster.firstItem, [<bloodmagic:cutting_fluid>, ore], (tier + 1) * 4, (tier + 1) * 60, tier + 1);
				}
				else if (!oreGem.empty)
				{
					mods.bloodmagic.AlchemyTable.addRecipe(oreGem.firstItem * 2, [<bloodmagic:cutting_fluid>, ore], (tier + 1) * 4, (tier + 1) * 60, tier + 1);
				}
				else if (!oreDust.empty)
				{
					mods.bloodmagic.AlchemyTable.addRecipe(oreDust.firstItem * 2, [<bloodmagic:cutting_fluid>, ore], (tier + 1) * 4, (tier + 1) * 60, tier + 1);
				}
				else
				{
					print("Skipped Blood Magic Alchemy Table outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
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
					mods.magneticraft.SluiceBox.addRecipe(nativeCluster.firstItem, 1.0, oreGem.firstItem * 2, 0.5, oreGem.firstItem * 3, 0.15, <minecraft:cobblestone>, true);
				}
				else if (!oreDust.empty)
				{
					mods.magneticraft.SluiceBox.addRecipe(nativeCluster.firstItem, 1.0, oreDust.firstItem * 2, 0.5, oreDust.firstItem, 0.15, <minecraft:cobblestone>, true);
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
					mods.magneticraft.SluiceBox.addRecipe(rockyChunk.firstItem, 1.0, processedChunk.firstItem, 0.5, oreGem.firstItem * 3, 0.15, <minecraft:cobblestone>, true);
				}
				else if (!oreDust.empty)
				{
					mods.magneticraft.SluiceBox.addRecipe(rockyChunk.firstItem, 1.0, processedChunk.firstItem, 0.5, oreDust.firstItem, 0.15, <minecraft:cobblestone>, true);
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
					mods.magneticraft.Sieve.addRecipe(nativeCluster.firstItem, oreGem.firstItem * 4, 1.0, oreGem.firstItem * 2, 0.5, oreGem.firstItem, 0.25, (tier + 1) * 40, true);
				}
				else if (!oreDust.empty)
				{
					mods.magneticraft.Sieve.addRecipe(nativeCluster.firstItem, oreDust.firstItem * 2, 1.0, oreDust.firstItem, 0.5, oreDust.firstItem, 0.25, (tier + 1) * 40, true);
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
					mods.magneticraft.Sieve.addRecipe(rockyChunk.firstItem, processedChunk.firstItem, 1.0, oreGem.firstItem, 0.5, oreGem.firstItem, 0.25, (tier + 1) * 40, true);
				}
				else if (!oreDust.empty)
				{
					mods.magneticraft.Sieve.addRecipe(rockyChunk.firstItem, processedChunk.firstItem, 1.0, oreDust.firstItem, 0.5, oreDust.firstItem, 0.25, (tier + 1) * 40, true);
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
			for ore in oreBlock.items
			{
				if (!oreGem.empty)
				{
					mods.astralsorcery.StarlightInfusion.addInfusion(ore, oreGem.firstItem * 6, false, 0.5, (tier+1) * 80);
				}
				else if (!oreDust.empty)
				{
					mods.astralsorcery.StarlightInfusion.addInfusion(ore, oreDust.firstItem * 3, false, 0.5, (tier+1) * 60);
				}
				else
				{
					print("Skipped Astral Sorcery Starlight Infusion outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
				}
			}
		}

		//Thermal Expansion Pulverizer -- Tier 4 (3x)
		if(tier <= 4)
		{
			if(!oreGem.empty)
			{
				mods.thermalexpansion.Pulverizer.addRecipe(oreGem.firstItem * 6, oreBlock.firstItem, (tier + 1) * 6000, oreGem.firstItem * 3, 50);
			}
			else if(!oreDust.empty)
			{
				mods.thermalexpansion.Pulverizer.addRecipe(oreDust.firstItem * 3, oreBlock.firstItem, (tier + 1) * 6000, oreDust.firstItem, 50);
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
				//Normal Slag
				mods.thermalexpansion.InductionSmelter.addRecipe(oreGem.firstItem * 6, <thermalfoundation:material:864>, oreBlock.firstItem, (tier + 1) * 9000, oreGem.firstItem * 1, 33);

				//Rich Slag
				mods.thermalexpansion.InductionSmelter.addRecipe(oreGem.firstItem * 8, <thermalfoundation:material:864>, oreBlock.firstItem, (tier + 1) * 9000, oreGem.firstItem * 2, 80);
			}
			else if(!oreIngot.empty)
			{
				if(!oreDustSmall.empty)
				{
					//Normal Slag
					mods.thermalexpansion.InductionSmelter.addRecipe(oreIngot.firstItem * 3, <thermalfoundation:material:864>, oreBlock.firstItem, (tier + 1) * 9000, oreDustSmall.firstItem * 3, 33);
					//Rich Slag
					mods.thermalexpansion.InductionSmelter.addRecipe(oreIngot.firstItem * 4, <thermalfoundation:material:865>, oreBlock.firstItem, (tier + 1) * 9000, oreDustSmall.firstItem * 6, 80);
				}
				else
				{
					//Normal Slag
					mods.thermalexpansion.InductionSmelter.addRecipe(oreIngot.firstItem * 3, <thermalfoundation:material:864>, oreBlock.firstItem, (tier + 1) * 9000, oreIngot.firstItem, 33);

					//Rich Slag
					mods.thermalexpansion.InductionSmelter.addRecipe(oreIngot.firstItem * 4, <thermalfoundation:material:865>, oreBlock.firstItem, (tier + 1) * 9000, oreIngot.firstItem * 2, 80);
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
				for ore in oreBlock.items
				{
					mods.mekanism.purification.addRecipe(ore, <gas:oxygen> * 200, oreClump.firstItem * 3);
				}
			}
			else if(!oreGem.empty)
			{
				for ore in oreBlock.items
				{
					mods.mekanism.purification.addRecipe(ore, <gas:oxygen> * 200, oreGem.firstItem * 6);
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
				for ore in oreBlock.items
				{
					mods.mekanism.enrichment.addRecipe(ore, oreGem.firstItem * 4);
				}
			}
			else if(!oreDust.empty)
			{
				for ore in oreBlock.items
				{
					mods.mekanism.enrichment.addRecipe(ore, oreDust.firstItem * 2);
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
			for ore in oreBlock.items
			{
				if(!oreShard.empty)
				{
					mods.mekanism.chemical.injection.addRecipe(ore, <gas:hydrogenchloride> * 200, oreShard.firstItem * 4);

					//Add other mekanism oreprocessing for compat
					if(!oreCrystal.empty)
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
				else if(!oreGem.empty)
				{
					mods.mekanism.chemical.injection.addRecipe(ore, <gas:hydrogenchloride> * 200, oreGem.firstItem * 8);
				}
				else
				{
					print("Skipped Mekanism Chemical Injection Chamber outputs for " ~ ore.name ~ " as no possible outputs were found.");
				}
			}
		}

		//Advanced Rocketry Arc Furnace -- Tier 6 (4x)
		if(tier <= 6)
		{
			if(!oreGem.empty)
			{
				for ore in oreBlock.items
				{
					mods.advancedrocketry.ArcFurnace.addRecipe(oreGem.firstItem * 8, ((tier + 1) * 120) / 3, (tier + 1) * 75, ore, <minecraft:sand>);
				}
			}
			else if(!oreIngot.empty)
			{
				for ore in oreBlock.items
				{
					mods.advancedrocketry.ArcFurnace.addRecipe(oreIngot.firstItem * 4, ((tier + 1) * 120) / 3, (tier + 1) * 75, ore, <minecraft:sand>);
				}
			}
			else
			{
				print("Skipped Mekanism Chemical Injection Chamber outputs for " ~ craftingMaterial ~ " as no possible outputs were found.");
			}

		}

		//Mekanism Chemical Dissolution Chamber -- Tier 7 (5x)
		if(tier <= 7)
		{
			//Use method in mmhelper.zs file.
			scripts.mmhelper.ChemicalOreFactoryRecipe(craftingMaterial, tier);
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
				mods.tconstruct.Melting.addRecipe(molten * 144, ore);

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
					if(tier == 0)
					{
						ore.addTooltip(format.italic(format.white("Ore Processing Tier: ")) ~ format.bold(format.darkGray("0")));
					}
					else if(tier == 1)
					{
						ore.addTooltip(format.italic(format.white("Ore Processing Tier: ")) ~ format.bold(format.gray("1")));
					}
					else if(tier == 2)
					{
						ore.addTooltip(format.italic(format.white("Ore Processing Tier: ")) ~ format.bold(format.yellow("2")));
					}
					else if(tier == 3)
					{
						ore.addTooltip(format.italic(format.white("Ore Processing Tier: ")) ~ format.bold(format.gold("3")));
					}
					else if(tier == 4)
					{
						ore.addTooltip(format.italic(format.white("Ore Processing Tier: ")) ~ format.bold(format.red("4")));
					}
					else if(tier == 5)
					{
						ore.addTooltip(format.italic(format.white("Ore Processing Tier: ")) ~ format.bold(format.darkRed("5")));
					}
					if(tier == 6)
					{
						ore.addTooltip(format.italic(format.white("Ore Processing Tier: ")) ~ format.bold(format.aqua("6")));
					}
					if(tier == 7)
					{
						ore.addTooltip(format.italic(format.white("Ore Processing Tier: ")) ~ format.bold(format.darkGreen("7")));
					}
					if(tier == 8)
					{
						ore.addTooltip(format.italic(format.white("Ore Processing Tier: ")) ~ format.bold(format.green("8")));
					}
				}
			}
		}
	}
}

//Stop Issues with Galena Ore!
<ore:oreSilver>.remove(<magneticraft:ores:1>);
<ore:oreLead>.remove(<magneticraft:ores:1>);

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
furnace.remove(<minecraft:redstone>);
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

//Ore Types with Liquids Attached
val LiquidTypes =
{
	"Iron" : <liquid:iron>,
	"Gold" : <liquid:gold>,
	"Redstone" : <liquid:redstone>,
	"Diamond" : <liquid:water>,
	"Emerald" : <liquid:emerald>,
	"Coal" : <liquid:coal>,
	"Chrome" :<liquid:chromium>,
	"Ruby" : <liquid:water>,
	"Sapphire" : <liquid:water>,
	"Peridot" : <liquid:water>,
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
	"Amber" : <liquid:water>,
	"Amethyst" : <liquid:water>,
	"Apatite" : <liquid:water>,
	"Aquamarine" : <liquid:water>,
	"CertusQuartz" : <liquid:water>,
	"ChargedCertusQuartz" : <liquid:water>,
	"Dilithium" : <liquid:water>,
	"DimensionalShard" : <liquid:water>,
	"EnderBiotite" : <liquid:water>,
	"Lapis" : <liquid:water>,
	"Malachite" : <liquid:water>,
	"Quartz" : <liquid:water>,
	"Tanzanite" : <liquid:water>,
	"Topaz" : <liquid:water>
} as ILiquidStack[string];

//List of ores to change processing rules for
static OreTypes as int[string] =
{
	"Iron" : 0,
	"Gold" : 0,
	"Redstone" : 0,
	"Diamond" : 0,
	"Emerald" : 0,
	"Coal" : 0,
	"Chrome" : 5,
	"Ruby" : 0,
	"Sapphire" : 0,
	"Peridot" : 0,
	"Aluminum" : 1,
	"Copper" : 1,
	"Iridium" : 5,
	"Lead" : 1,
	"Nickel" : 1,
	"Platinum" : 3,
	"Silver" : 1,
	"Tin" : 1,
	"Titanium" : 6,
	"Tungsten" : 5,
	"Zinc" : 1,
	"Mithril" : 3,
	"Yellorium" : 4,
	"Vibranium" : 8,
	"Necrodermis" : 8,
	"Thorium" : 5,
	"Chromium" : 5,
	"Ardite" : 2,
	"AstralStarmetal" : 0,
	"Cobalt" : 2,
	"Draconium" : 7,
	"Uranium" : 4,
	"Osmium" : 4,
	"Amber" : 0,
	"Amethyst" : 0,
	"Apatite" : 1,
	"Aquamarine" : 0,
	"CertusQuartz" : 2,
	"ChargedCertusQuartz" : 2,
	"Dilithium" : 7,
	"DimensionalShard" : 6,
	"EnderBiotite" : 3,
	"Lapis" : 0,
	"Malachite" : 0,
	"Quartz" : 0,
	"Tanzanite" : 0,
	"Topaz" : 0
};

for materialString, oreValue in OreTypes
{
	//Remove the existing ore processing methods available
	removeExistingCraftingRecipes(materialString);

	//Add new ones based on the tier/stage of the material
	addNewRecipe(materialString, oreValue);

	//Add Melting Processing too
	if(LiquidTypes[materialString].name != "water")
	{
		AddMeltedRecipes(materialString, oreValue, LiquidTypes[materialString]);
	}

	//Mark each ore with it's tier
	markwithProcessingTier(materialString, oreValue);
}

print("### Ore Processing Init Complete ###");
