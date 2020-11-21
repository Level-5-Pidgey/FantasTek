#priority -1
import scripts.staging.stages;
import mods.zenstages.Stage;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

print("~~~ Begin Ore Block/Material Staging ~~~");

function SetOreDictStage(oredict_entry as crafttweaker.oredict.IOreDictEntry, oreValue as int)
{
	for ore in oredict_entry.items
	{
		if(scripts.helpers.StageForProcessingTier[oreValue].stage != "stage_i")
		{
			scripts.helpers.setItemAndRecipesStage(ore, scripts.helpers.StageForProcessingTier[oreValue].stage);
		}
		else
		{
			mods.ItemStages.removeItemStage(ore);
		}
	}
}

function GetOreDictsForMaterial(materialString as string) as IOreDictEntry[]
{
  val oreDicts = [
    oreDict.get("plate" ~ materialString),
    oreDict.get("block" ~ materialString),
    oreDict.get("ingot" ~ materialString),
    oreDict.get("nugget" ~ materialString),
    oreDict.get("cluster" ~ materialString),
    oreDict.get("dust" ~ materialString),
    oreDict.get("dustSmall" ~ materialString),
    oreDict.get("dustTiny" ~ materialString),
    oreDict.get("ore" ~ materialString),
    oreDict.get("ingot" ~ materialString),
    oreDict.get("gem" ~ materialString),
    oreDict.get("crystal" ~ materialString),
    oreDict.get("clump" ~ materialString),
    oreDict.get("shard" ~ materialString),
    oreDict.get("dirtyDust" ~ materialString),
    oreDict.get("rockyChunk" ~ materialString),
    oreDict.get("blockSheetmetal" ~ materialString),
    oreDict.get("densePlating" ~ materialString),
    oreDict.get("stick" ~ materialString),
    oreDict.get("rod" ~ materialString),
    oreDict.get("gear" ~ materialString),
    oreDict.get("fan" ~ materialString),
    oreDict.get("coin" ~ materialString),
    oreDict.get("coil" ~ materialString),
    oreDict.get("sheet" ~ materialString),
    oreDict.get("coilBlock" ~ materialString)
  ] as IOreDictEntry[];

  return oreDicts;
}

var DenseAndPoorOres as crafttweaker.item.IItemStack[crafttweaker.item.IItemStack] =
{
	//Ender Poor Ores
		<contenttweaker:sub_block_holder_15:2> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_15:3> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_13:12> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_14:1> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_12> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_12:1> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_1:3> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_1:7> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_10:5> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_0:11> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_0:12> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_0:7> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_1:11> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_10:11> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_3:7> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_3:8> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_2:2> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_2:9> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_5:5> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_5:12> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_5:14> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_4:5> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_4:13> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_4:15> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_9> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_9:7> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_9:12> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_9:14> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_8:9> : <minecraft:end_stone>,
	//Nether Poor Ores
		<contenttweaker:sub_block_holder_15:4> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_13:15> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_14:6> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_14:15> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_11:5> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_11:12> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_1:5> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_1:6> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_0:8> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_10:12> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_3:2> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_3:4> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_2:1> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_2:8> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_2:12> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_5:3> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_5:8> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_5:11> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_4:9> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_7:3> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_7:15> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_6:7> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_6:4> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_6:9> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_6:13> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_9:13> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_8:2> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_8:5> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_8:12> : <minecraft:netherrack>,
	//Overworld Poor Ores
		<contenttweaker:sub_block_holder_15:5> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_14> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_14:14> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_11:10> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_11:11> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_11:13> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_1:2> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_1:9> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_1:14> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_0:1> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_0:13> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_10> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_10:8> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_3:1> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_3:6> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_3:9> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_3:11> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_3:13> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_2:10> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_5:15> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_4:2> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_4:10> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_4:14> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_7:5> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_7:14> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_9:3> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_9:11> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_8:15> : <minecraft:stone>,
	//Ender Dense Ores
		<contenttweaker:sub_block_holder_15:1> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_13:13> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_14:3> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_14:9> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_11:1> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_11:8> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_12:4> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_1:8> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_1:10> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_0:6> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_0:10> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_10:7> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_3:10> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_3:12> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_2:7> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_2:14> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_2:15> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_5:9> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_5:10> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_4:8> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_4:11> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_7:4> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_7:6> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_6:2> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_6:10> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_6:14> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_9:1> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_9:6> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_8:3> : <minecraft:end_stone>,
	//Nether Dense Ores
		<contenttweaker:sub_block_holder_15> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_13:10> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_14:2> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_14:12> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_12:2> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_12:3> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_12:5> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_1> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_0:9> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_10:2> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_10:3> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_3> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_2:13> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_2> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_5> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_4:3> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_4:12> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_7> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_7:9> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_7:10> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_7:12> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_6:5> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_6:11> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_6:12> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_9:5> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_9:9> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_8:1> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_8:6> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_8:7> : <minecraft:netherrack>,
	//Overworld Dense Ores
		<contenttweaker:sub_block_holder_13:11> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_13:14> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_14:4> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_14:8> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_14:13> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_11:7> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_1:15> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_0:3> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_0:14> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_10:1> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_10:6> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_10:13> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_10:15> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_3:15> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_2:4> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_2:11> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_5:2> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_5:13> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_4> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_6:6> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_6:15> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_9:2> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_8:13> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_8:14> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_6> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_6:1> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_8> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_5:6> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_6:3> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_6:3> : <minecraft:stone>
};

//Staging Dense/Poor Ore Blocks
//TODO Remake this. This solution is really inefficient.
for materialString, oreValue in scripts.helpers.OresWithProcessingTier
{
	for oreBlock, replaceWith in DenseAndPoorOres
	{
		//Replace each dense ore/poor ore block with their proper dimension equivalent block unless the player has the right stage for them.
		if(oreValue <= 1)
		{
			mods.orestages.OreStages.addReplacement(scripts.helpers.StageForProcessingTier[2].stage, oreBlock, replaceWith);
		}
		else
		{
			mods.orestages.OreStages.addReplacement(scripts.helpers.StageForProcessingTier[oreValue].stage, oreBlock, replaceWith);
		}
	}
}

//Hide completely custom ores with proper blocks
var CustomContenttweakerOres as crafttweaker.item.IItemStack[crafttweaker.item.IItemStack] =
{
	//Ender Custom Ores
		<contenttweaker:sub_block_holder_13> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_11:2> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_11:6> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_4:6> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_7:1> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_9:4> : <minecraft:end_stone>,
		<contenttweaker:sub_block_holder_0:5> : <minecraft:end_stone>,
	//Nether Custom Ores
		<contenttweaker:sub_block_holder_11:4> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_12:6> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_12:15> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_1:12> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_1:13> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_0> : <minecraft:netherrack>,
		<contenttweaker:sub_block_holder_3:3> : <minecraft:netherrack>,
	//Overworld Custom Ores
		<contenttweaker:sub_block_holder_12:14> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_0:4> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_10:10> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_10:14> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_4:1> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_4:7> : <minecraft:stone>,
		<contenttweaker:sub_block_holder_8:4> : <minecraft:stone>
};

//Hide non-custom ore blocks properly
for materialString, oreValue in scripts.helpers.OresWithProcessingTier
{
	//Exclude certain ores and do them manually
	var excludedOres =
	[
		"Ardite",
		"AstralStarmetal",
		"Cobalt",
		"Draconium",
		"DimensionalShard",
		"EnderBiotite",
		"Quartz"
	] as string[];

	var isExcluded as bool = false;

	for oreString in excludedOres
	{
		if(oreString == materialString)
		{
			isExcluded = true;
		}
	}

	if(!isExcluded)
	{
		for ore in oreDict.get("ore" ~ materialString).items
		{
			if (ore.definition.owner != "contenttweaker")
			{
				if (scripts.helpers.StageForProcessingTier[oreValue].stage == "stage_i")
				{
					if(scripts.helpers.StageForProcessingTier[oreValue + 1].stage != "stage_i")
					{
						mods.orestages.OreStages.addReplacement(scripts.helpers.StageForProcessingTier[oreValue + 1].stage, ore);

						print("[OreStaging] Staged " + ore.name + " to stage " + scripts.helpers.StageForProcessingTier[oreValue].stage + "[" + oreValue + "].");
					}
					else
					{
						print("[OreStaging] Skipped " + ore.name + " as it is available at Stage 1.");
					}
				}
				else
				{
					mods.orestages.OreStages.addReplacement(scripts.helpers.StageForProcessingTier[oreValue].stage, ore);

					print("[OreStaging] Staged " + ore.name + " to stage " + scripts.helpers.StageForProcessingTier[oreValue].stage + "[" + oreValue + "].");
				}
			}
			else
			{
				print("[OreStaging] Skipped " + ore.name + " as it was created by ContentTweaker.");
			}
		}
	}
	else
	{
		print("[OreStaging] Skipped " + materialString + " as its one of the excluded ores.");
	}
}

var OtherStagingReplacements as crafttweaker.item.IItemStack[crafttweaker.item.IItemStack] =
{
	<astralsorcery:blockcustomsandore> : <minecraft:sand>,
	<magneticraft:oil_source:*> : <minecraft:stone>,
	<thaumcraft:crystal_ignis:*> : <quark:crystal:1>,
	<thaumcraft:crystal_terra:*> : <quark:crystal:4>,
	<thaumcraft:crystal_aqua:*> : <quark:crystal:5>,
	<thaumcraft:crystal_perditio:*> : <quark:crystal:8>,
	<thaumcraft:crystal_ordo:*> : <quark:crystal>,
	<thaumcraft:crystal_aer:*> : <quark:crystal:3>,
	<thaumcraft:crystal_vitium:*> : <quark:crystal:7>,
	<magneticraft:ores:2> : <minecraft:stone>,
	<contenttweaker:sub_block_holder_13:11> : <minecraft:stone>,
	<contenttweaker:sub_block_holder_4:2> : <minecraft:stone>,
	<contenttweaker:sub_block_holder_13:12> : <minecraft:end_stone>,
	<contenttweaker:sub_block_holder_4:11> : <minecraft:end_stone>,
	<tconstruct:ore> : <minecraft:netherrack>,
	<contenttweaker:sub_block_holder_13:10> : <minecraft:netherrack>,
	<contenttweaker:sub_block_holder_13:15> : <minecraft:netherrack>,
	<tconstruct:ore:1> : <minecraft:netherrack>,
	<contenttweaker:sub_block_holder_6:5> : <minecraft:netherrack>,
	<contenttweaker:sub_block_holder_6:13> : <minecraft:netherrack>,
	<contenttweaker:sub_block_holder_10:5> : <minecraft:end_stone>,
	<contenttweaker:sub_block_holder_13:13> : <minecraft:end_stone>,
	<contenttweaker:sub_block_holder_13:14> : <minecraft:stone>,
	<contenttweaker:sub_block_holder_3:6> : <minecraft:stone>,
	<astralsorcery:blockcustomore:1> : <minecraft:iron_ore>,
	<astralsorcery:blockcustomore> : <thaumcraft:ore_quartz>,
	<draconicevolution:draconium_ore:2> : <minecraft:end_stone>,
	<contenttweaker:sub_block_holder_14:3> : <minecraft:end_stone>,
	<contenttweaker:sub_block_holder_14:1> : <minecraft:end_stone>,
	<rftools:dimensional_shard_ore:2> : <minecraft:end_stone>,
	<quark:biotite_ore> : <minecraft:end_stone>,
	<contenttweaker:sub_block_holder_1:8> : <minecraft:end_stone>,
	<contenttweaker:sub_block_holder_5:12> : <minecraft:end_stone>,
	<contenttweaker:sub_block_holder_14:6> : <minecraft:netherrack>,
	<contenttweaker:sub_block_holder_14:2> : <minecraft:netherrack>,
	<draconicevolution:draconium_ore:1> : <minecraft:netherrack>,
	<contenttweaker:sub_block_holder_8:2> : <minecraft:netherrack>,
	<contenttweaker:sub_block_holder_2:13> : <minecraft:netherrack>,
	<rftools:dimensional_shard_ore:1> : <minecraft:netherrack>,
	<draconicevolution:draconium_ore> : <minecraft:stone>,
	<contenttweaker:sub_block_holder_14> : <minecraft:stone>,
	<contenttweaker:sub_block_holder_14:4> : <minecraft:stone>,
	<contenttweaker:sub_block_holder_3:15> : <minecraft:stone>,
	<contenttweaker:sub_block_holder_4:10> : <minecraft:stone>,
	<embers:ore_quartz> : <minecraft:stone>,
	<thaumcraft:ore_quartz> : <minecraft:stone>,
	<rftools:dimensional_shard_ore> : <minecraft:stone>,
	<thermalfoundation:ore_fluid:2> : <minecraft:stone>,
	<randomthings:lotus:*> : <minecraft:deadbush>,
	<contenttweaker:infused_stone_ordo> : <minecraft:stone>,
	<contenttweaker:infused_stone_aer> : <minecraft:stone>,
	<contenttweaker:infused_stone_aqua> : <minecraft:stone>,
	<contenttweaker:infused_stone_terra> : <minecraft:stone>,
	<contenttweaker:infused_stone_ignis> : <minecraft:stone>,
	<contenttweaker:infused_stone_vitium> : <minecraft:stone>,
	<contenttweaker:infused_stone_perditio> : <minecraft:stone>,
	<iceandfire:fire_lily> : <biomesoplenty:flower_1:5>,
	<iceandfire:frost_lily> : <futuremc:cornflower>,
	<thermalfoundation:ore_fluid:1> : <minecraft:gravel>
};

var StageForReplacement as mods.zenstages.Stage[crafttweaker.item.IItemStack] =
{
	<astralsorcery:blockcustomsandore> : stages.AstralSorcery1,
	<magneticraft:oil_source:*> : stages.progression2,
	<thaumcraft:crystal_ignis:*> : stages.Thaumcraft1,
	<thaumcraft:crystal_terra:*> : stages.Thaumcraft1,
	<thaumcraft:crystal_aqua:*> : stages.Thaumcraft1,
	<thaumcraft:crystal_perditio:*> : stages.Thaumcraft1,
	<thaumcraft:crystal_ordo:*> : stages.Thaumcraft1,
	<thaumcraft:crystal_aer:*> : stages.Thaumcraft1,
	<thaumcraft:crystal_vitium:*> : stages.Thaumcraft1,
	<magneticraft:ores:2> : stages.progression2,
	<contenttweaker:sub_block_holder_13:11> : stages.progression2,
	<contenttweaker:sub_block_holder_4:2> : stages.progression2,
	<contenttweaker:sub_block_holder_13:12> : stages.progression2,
	<contenttweaker:sub_block_holder_4:11> : stages.progression2,
	<tconstruct:ore> : stages.progression2,
	<contenttweaker:sub_block_holder_13:10> : stages.progression2,
	<contenttweaker:sub_block_holder_13:15> : stages.progression2,
	<tconstruct:ore:1> : stages.progression2,
	<contenttweaker:sub_block_holder_6:5> : stages.progression2,
	<contenttweaker:sub_block_holder_6:13> : stages.progression2,
	<contenttweaker:sub_block_holder_10:5> : stages.progression2,
	<contenttweaker:sub_block_holder_13:13> :stages.progression2,
	<contenttweaker:sub_block_holder_13:14> : stages.progression2,
	<contenttweaker:sub_block_holder_3:6> : stages.progression2,
	<astralsorcery:blockcustomore:1> : stages.AstralSorcery1,
	<astralsorcery:blockcustomore> : stages.AstralSorcery1,
	<draconicevolution:draconium_ore:2> : stages.progression2,
	<contenttweaker:sub_block_holder_14:3> : stages.progression2,
	<contenttweaker:sub_block_holder_14:1> : stages.progression2,
	<rftools:dimensional_shard_ore:2> : stages.progression2,
	<quark:biotite_ore> : stages.progression2,
	<contenttweaker:sub_block_holder_1:8> : stages.progression2,
	<contenttweaker:sub_block_holder_5:12> : stages.progression2,
	<contenttweaker:sub_block_holder_14:6> : stages.progression2,
	<contenttweaker:sub_block_holder_14:2> : stages.progression2,
	<draconicevolution:draconium_ore:1> : stages.progression2,
	<contenttweaker:sub_block_holder_8:2> : stages.progression1,
	<contenttweaker:sub_block_holder_2:13> : stages.progression1,
	<rftools:dimensional_shard_ore:1> : stages.progression2,
	<draconicevolution:draconium_ore> : stages.progression2,
	<contenttweaker:sub_block_holder_14> : stages.progression2,
	<contenttweaker:sub_block_holder_14:4> : stages.progression2,
	<contenttweaker:sub_block_holder_3:15> : stages.progression2,
	<contenttweaker:sub_block_holder_4:10> : stages.progression2,
	<embers:ore_quartz> : stages.progression2,
	<thaumcraft:ore_quartz> : stages.progression2,
	<rftools:dimensional_shard_ore> : stages.progression2,
	<thermalfoundation:ore_fluid:2> : stages.progression2,
	<randomthings:lotus:*> : stages.progression2,
	<contenttweaker:infused_stone_ordo> : stages.Thaumcraft1,
	<contenttweaker:infused_stone_aer> : stages.Thaumcraft1,
	<contenttweaker:infused_stone_aqua> : stages.Thaumcraft1,
	<contenttweaker:infused_stone_terra> : stages.Thaumcraft1,
	<contenttweaker:infused_stone_ignis> : stages.Thaumcraft1,
	<contenttweaker:infused_stone_vitium> : stages.Thaumcraft1,
	<contenttweaker:infused_stone_perditio> : stages.Thaumcraft1,
	<iceandfire:fire_lily> : stages.progression2,
	<iceandfire:frost_lily> : stages.progression2,
	<thermalfoundation:ore_fluid:1> : stages.progression2
};

for blockToReplace in OtherStagingReplacements
{
	if(StageForReplacement[blockToReplace].stage != "stage_i")
	{
		mods.orestages.OreStages.addReplacement(StageForReplacement[blockToReplace].stage, blockToReplace, OtherStagingReplacements[blockToReplace]);
	}
}

//Stage All Materials Related to an Ore within the Processing Tiers
for materialString, oreValue in scripts.helpers.OresWithProcessingTier
{
	//Exclude certain ores and do them manually
	var excludedOres =
	[
		"Aquamarine",
		"AstralStarmetal"
	] as string[];

	var isExcluded as bool = false;

	for oreString in excludedOres
	{
		if(oreString == materialString)
		{
			isExcluded = true;
		}
	}

	if(!isExcluded)
	{
		for oreEntry in GetOreDictsForMaterial(materialString)
		{
			if(!oreEntry.empty)
			{
				if(oreValue <= 1)
				{
					if(scripts.helpers.StageForProcessingTier[oreValue + 1].stage != "stage_i")
					{
						SetOreDictStage(oreEntry, oreValue + 1);
					}
					else
					{
						mods.ItemStages.removeItemStage(oreEntry);
					}
				}
				else
				{
					SetOreDictStage(oreEntry, oreValue);
				}
			}
		}
	}
}

//Extra Materials that aren't necessarily ores that should be tied to this stage
var ExtraMaterialsToStage as mods.zenstages.Stage[string] =
{
  "CrudeSteel" : stages.progression1,
  "Steel" : stages.progression2,
  "Wood" : stages.progression1,
  "Diamond" : stages.progression1,
  "RedstoneAlloy" : stages.progression1,
  "ConductiveIron" : stages.progression1,
  "PulsatingIron" : stages.progression1,
  "Aquamarine" : stages.AstralSorcery1,
  "AstralStarmetal" : stages.AstralSorcery2,
  "Thaumium" : stages.Thaumcraft1,
  "Alubrass" : stages.progression2,
  "Manyullyn" : stages.progression2,
  "Knightslime" : stages.progression2,
  "PigIron" : stages.progression1,
  "NetherStar" : stages.progression1,
  "AncientDebris" : stages.progression1,
  "LapisLazuli" : stages.progression1,
  "Electrum" : stages.progression2,
  "Invar" : stages.progression2,
  "Constantan" : stages.progression2,
  "Signalum" : stages.progression2,
  "Bronze" : stages.progression2,
  "Lumium" : stages.progression2,
  "Manasteel" : stages.Botania1,
};

for materialString in ExtraMaterialsToStage
{
	for oreEntry in GetOreDictsForMaterial(materialString)
	{
		if(!oreEntry.empty)
		{
			if(ExtraMaterialsToStage[materialString].stage != "stage_i")
			{
				for ore in oreEntry.items
				{
					scripts.helpers.setItemAndRecipesStage(ore, ExtraMaterialsToStage[materialString].stage);
				}
			}
			else
			{
				for ore in oreEntry.items
				{
					mods.ItemStages.removeItemStage(ore);
				}
			}
		}
	}
}

//Extra Ore Dict Entries that should be tied to this stage (that aren't materials)
var extraOreDicts as mods.zenstages.Stage[IOreDictEntry] =
{
	<ore:treeLeaves> : stages.progression1,
	<ore:treeSapling> : stages.progression1,
	<ore:plankWood> : stages.progression1,
	<ore:logWood> : stages.progression1,
	<ore:fuelCoke> : stages.progression1,
	<ore:blockFuelCoke> : stages.progression1,
	<ore:fruitForestry> : stages.progression1,
	<ore:dustAsh> : stages.progression1,
	<ore:beeComb> : stages.progression1,
	<ore:slabWood> : stages.progression1,
	<ore:stairWood> : stages.progression1,
	<ore:charredBlock> : stages.progression1,
	<ore:doorWood> : stages.progression1,
	<ore:fenceWood> : stages.progression1,
	<ore:fenceGateWood> : stages.progression1,
	<ore:blockSalt> : stages.progression1,
	<ore:dustSalt> : stages.progression1,
	<ore:stoneLimestone> : stages.progression1,
	<ore:dustEnder> : stages.progression1,
	<ore:dustTinySulfur> : stages.progression1,
	<ore:dustSmallSulfur> : stages.progression1,
	<ore:dustSulfur> : stages.progression1,
	<ore:dustNetherQuartz> : stages.progression1,
	<ore:dustObisidian> : stages.progression1,
	<ore:blockSulfur> : stages.progression1,
	<ore:dustWood> : stages.progression1,
	<ore:pulpWood> : stages.progression1,
	<ore:itemSilicon> : stages.progression1,
	<ore:dustSilicon> : stages.progression1,
	<ore:nuggetSilicon> : stages.progression1,
	<ore:blockCharcoal> : stages.progression1,
	<ore:itemCharcoal> : stages.progression1,
	<ore:gearStone> : stages.progression1,
	<ore:coilIron> : stages.progression1,
	<ore:coilGold> : stages.progression1,
	<ore:dustWheat> : stages.progression1
};

for oreBlockEntry in extraOreDicts
{
	for ore in oreBlockEntry.items
	{
		if(extraOreDicts[oreBlockEntry].stage != "stage_i")
		{
			scripts.helpers.setItemAndRecipesStage(ore, extraOreDicts[oreBlockEntry].stage);
		}
		else
		{
			mods.ItemStages.removeItemStage(ore);
		}
	}
}

//Stage Thaumcraft Infused Stone
var InfusedStones as crafttweaker.item.IItemStack[] =
[
	<contenttweaker:infused_stone_ordo>,
	<contenttweaker:infused_stone_aer>,
	<contenttweaker:infused_stone_aqua>,
	<contenttweaker:infused_stone_terra>,
	<contenttweaker:infused_stone_ignis>,
	<contenttweaker:infused_stone_vitium>,
	<contenttweaker:infused_stone_perditio>
];

for stone in InfusedStones
{
	scripts.helpers.setItemAndRecipesStage(stone, stages.Thaumcraft1.stage);
}

print("### Ore Block/Material Staging Complete ###");
