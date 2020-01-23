#priority 101
import mods.zenstages.Stage;
import scripts.staging.stages;

print("~~~ Begin Stage 2 Staging ~~~");

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
  "jaopca",
  "contenttweaker",
  "enderio",
  "environmentaltech",
  "compactmachines3"
] as string[];

for modTag in StageMods
{
  mods.ItemStages.stageModItems(stages.Locked.stage, modTag);
}

//Add Cinderpearl to Blaze Powder crafting to stage 2.
mods.recipestages.Recipes.setRecipeStage(stages.Locked.stage, "thaumcraft:cinderpearltoblazepowder");
print("### Stage 2 Staging Complete ###");
