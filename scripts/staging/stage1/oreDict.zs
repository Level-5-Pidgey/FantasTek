#priority 98
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

print("~~~ Begin Stage 1 Oredict ~~~");

function SetOreDictStage(oredict_entry as crafttweaker.oredict.IOreDictEntry)
{
  for ore in oredict_entry.items
  {
    mods.ItemStages.removeItemStage(ore);
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
	//oreDict.get("denseOre" ~ materialString),
	//oreDict.get("poorOre" ~ materialString),
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
    oreDict.get("coil" ~ materialString)
  ] as IOreDictEntry[];

  return oreDicts;
}


//OreDict Materials that should be restricted to this stage
for materialString, oreValue in scripts.helpers.OresWithProcessingTier
{
  for oreEntry in GetOreDictsForMaterial(materialString)
  {
    if(oreValue == 0)
    {
      if(!oreEntry.empty)
      {
        SetOreDictStage(oreEntry);
      }
    }
  }
}

//Extra Materials that aren't necessarily ores that should be tied to this stage
val ExtraMaterialsToStage =
[
  "CrudeSteel",
  "Wood",
  "ElectricalSteel",
  "RedstoneAlloy",
  "ConductiveIron"
] as string[];

for materialString in ExtraMaterialsToStage
{
  for oreEntry in GetOreDictsForMaterial(materialString)
  {
    if(!oreEntry.empty)
    {
      SetOreDictStage(oreEntry);
    }
  }
}

//Extra Ore Dict Entries that should be tied to this stage (that aren't materials)
var extraOreDicts = [
  <ore:treeLeaves>,
  <ore:plankWood>,
  <ore:logWood>,
  <ore:fuelCoke>,
  <ore:blockFuelCoke>
] as IOreDictEntry[];

for oreBlockEntry in extraOreDicts
{
  for ore in oreBlockEntry.items
  {
    mods.ItemStages.removeItemStage(ore);
  }
}

print("### Stage 1 Oredict Complete ###");
