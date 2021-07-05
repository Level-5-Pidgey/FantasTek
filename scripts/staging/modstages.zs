#priority 500
import mods.zenstages.Stage;
import scripts.staging.stages;

print("~~~ Begin Mod Staging ~~~");

//Mods to restrict to stage 2
val stage2_stageMods = [
    "forestry",
    "industrialforegoing",
    "thermalexpansion",
    "thermaldynamics",
    "thermalfoundation",
    "thermalinnovation",
    "thermalcultivation",
    "appliedenergistics2",
    "extracells",
    "ae2stuff",
    "enderio",
    "compactmachines3",
    "magneticraft",
    "deepmoblearning",
    "deepmoblearningbm",
    "scannable",
    "reccomplex",
    "witherskelefix",
    "packagedauto"
] as string[];

for modTag in stage2_stageMods
{
	mods.ItemStages.stageModItems(stages.progression2.stage, modTag);
}

//Mods to restrict to stage 3
val stage3_stageMods = [
  "mekanism",
  "mekanismtools",
  "mekanismgenerators",
  "draconicevolution",
  "avaritia",
  "ae2stuff",
  "rftools",
  "advancedrocketry",
  "libvulpes",
  "redstonearsenal",
  "compactmachines3",
  "iceandfire",
  "reccomplex",
  "nuclearcraft"
] as string[];

for modTag in stage3_stageMods
{
	mods.ItemStages.stageModItems(stages.progression3.stage, modTag);
}

print("### Mod Staging Complete ###");
