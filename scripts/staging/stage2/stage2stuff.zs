#priority 101
import mods.zenstages.Stage;
import scripts.staging.stages;

print("~~~ Begin Stage 2 Staging ~~~");

var stageString = stages.progression2.stage;

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
  "ae2stuff",
  "advancedrocketry",
  "libvulpes",
  "redstonearsenal",
  "rftools",
  "rftoolsdim",
  "psi",
  "jaopca",
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
  "witherskelefix",
  "contenttweaker"
] as string[];

for modTag in StageMods
{
	mods.ItemStages.stageModItems(stageString, modTag);
}

//Add Cinderpearl to Blaze Powder crafting to stage 2.
mods.recipestages.Recipes.setRecipeStage(stageString, "thaumcraft:cinderpearltoblazepowder");

//Stage Stubborn Items.
val otherItems = [
	<forestry:thermionic_tubes:1>,
	<forestry:thermionic_tubes:2>,
	<forestry:thermionic_tubes:10>,
	<randomthings:ingredient:10>,
	<randomthings:lotusseeds>,
	<randomthings:lotus:*>,
	<xreliquary:twilight_cloak>,
	<xreliquary:void_tear>,
	<xreliquary:rending_gale>,
	<xreliquary:hero_medallion>,
	<xreliquary:witherless_rose>,
	<extrautils2:ineffableglass:*>
] as crafttweaker.item.IItemStack[];

for item in otherItems
{
	scripts.helpers.setItemAndRecipesStage(item, stageString);
}
print("### Stage 2 Staging Complete ###");
