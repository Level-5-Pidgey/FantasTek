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
  "draconicevolution",
  "industrialforegoing",
  "thermalexpansion",
  "thermaldynamics",
  "thermalfoundation",
  "thermalinnovation",
  "thermalcultivation",
  "appliedenergistics2",
  "extracells",
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
  "compactmachines3",
  "iceandfire",
  "projectred-core",
  "magneticraft",
  "deepmoblearning",
  "extendedcrafting",
  "scannable",
  "reccomplex",
  "witherskelefix"
] as string[];

for modTag in StageMods
{
  mods.ItemStages.stageModItems(stages.Locked.stage, modTag);
}

//Add Cinderpearl to Blaze Powder crafting to stage 2.
mods.recipestages.Recipes.setRecipeStage(stages.Locked.stage, "thaumcraft:cinderpearltoblazepowder");

//Stage Stubborn Items.
val otherItems = [
	<forestry:thermionic_tubes:1>,
	<forestry:thermionic_tubes:2>,
	<forestry:thermionic_tubes:4>,
	<forestry:thermionic_tubes:5>,
	<forestry:thermionic_tubes:6>,
	<forestry:thermionic_tubes:7>,
	<forestry:thermionic_tubes:9>,
	<forestry:thermionic_tubes:10>,
	<forestry:thermionic_tubes:11>,
	<forestry:thermionic_tubes:12>,
	<forestry:thermionic_tubes:12>,
	<randomthings:ingredient:10>,
	<randomthings:lotusseeds>,
	<randomthings:lotus:*>,
	<xreliquary:twilight_cloak>,
	<xreliquary:void_tear>,
	<xreliquary:rending_gale>,
	<xreliquary:hero_medallion>
] as crafttweaker.item.IItemStack[];

for item in otherItems
{
	 scripts.helpers.setItemAndRecipesStage(item, stages.Locked.stage);
}
print("### Stage 2 Staging Complete ###");
