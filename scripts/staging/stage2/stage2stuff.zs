#priority 101

print("~~~ Begin Stage 2 Staging ~~~");

var stageName = "ii";

//Mods to restrict to this stage
val StageMods = [
  "mekanism",
  "mekanismtools",
  "mekanismgenerators",
  "forestry",
  "morebees",
  "magicbees",
  "draconicevolution",
  "industrialforegoing",
  "thermalexpansion",
  "thermaldynamics",
  "thermalfoundation",
  "thermalinnovation",
  "thermalcultivation",
  "appliedenergistics2",
  "extracells",
  "extrabees",
  "botany",
  "avaritia",
  "advancedrocketry",
  "libvulpes",
  "redstonearsenal",
  "rftools",
  "rftoolsdim",
  "psi",
  "contenttweaker",
  "enderio",
  "environmentaltech",
  "compactmachines3"
] as string[];

for modTag in StageMods
{
  mods.ItemStages.stageModItems(stageName, modTag);
}

print("### Stage 2 Staging Complete ###");
