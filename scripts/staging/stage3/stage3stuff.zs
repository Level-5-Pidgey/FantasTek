#priority 55
import mods.zenstages.Stage;
import scripts.staging.stages;

print("~~~ Begin Stage 2 Staging ~~~");

var stageString = stages.progression3.stage;

//Mods to restrict to this stage
val stage3_stageMods = [
  "mekanism",
  "mekanismtools",
  "mekanismgenerators",
  "draconicevolution",
  "avaritia",
  "ae2stuff",
  "advancedrocketry",
  "libvulpes",
  "redstonearsenal",
  "rftools",
  "compactmachines3",
  "iceandfire",
  "teslacorelib",
  "deepmoblearning",
  "deepmoblearningbm",
  "extendedcrafting",
  "scannable",
  "reccomplex",
  "witherskelefix",
  "packagedauto",
  "contenttweaker",
  "enderstorage"
] as string[];

for modTag in stage3_stageMods
{
	mods.ItemStages.stageModItems(stageString, modTag);
}

//Stage Stubborn Items.
val stage3_stageItems = [

] as crafttweaker.item.IItemStack[];

for item in stage3_stageItems
{
	scripts.helpers.setItemAndRecipesStage(item, stageString);
}

//Stage Modular Machinery
val stage3_modularMachinery = [
    <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:vacuum_freezer"}),
    <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:chemical_ore_factory"})
] as crafttweaker.item.IItemStack[];

for item in stage3_modularMachinery
{
	scripts.helpers.setItemAndRecipesStage(item, stageString);
}

//Stage Journeymap
mods.jmapstages.JMapStages.setWaypointStage(stageString);
mods.jmapstages.JMapStages.setFullscreenStage(stageString);
mods.jmapstages.JMapStages.setDeathpointStage(stageString);
mods.jmapstages.JMapStages.setMinimapStage(stageString);

print("### Stage 2 Staging Complete ###");
