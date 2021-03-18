#priority 53
import mods.zenstages.Stage;
import scripts.staging.stages;

print("~~~ Begin Stage 2 Staging ~~~");

var stageString = stages.progression2.stage;

//Mods to restrict to this stage
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
  "psi",
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
	mods.ItemStages.stageModItems(stageString, modTag);
}

//Add Cinderpearl to Blaze Powder crafting to stage 2.
mods.recipestages.Recipes.setRecipeStage(stageString, "thaumcraft:cinderpearltoblazepowder");

//Stage Stubborn Items.
val stage2_stageItems = [
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
    <extrautils2:ineffableglass:*>,
    <morebees:framemutating>,
    <morebees:framecooled>,
    <natura:soups:9>,
    <randomthings:spectrecharger:2>,
    <randomthings:spectrecharger>,
    <randomthings:spectrecharger:1>,
    <randomthings:spectrecoil_ender>,
    <randomthings:spectrecoil_normal>,
    <randomthings:spectrecoil_redstone>,
    <randomthings:spectreenergyinjector>,
    <randomthings:spectreilluminator>,
    <randomthings:spectreanchor>,
    <openblocks:hang_glider>,
    <openblocks:generic>,
    <randomthings:spectrecharger:3>,
    <randomthings:spectrecoil_number>,
    <randomthings:spectrecoil_genesis>,
    <openblocks:luggage>,
    <randomthings:floosign>,
    <randomthings:floobrick>,
    <randomthings:ingredient:7>,
    <randomthings:timeinabottle>,
    <randomthings:eclipsedclock>,
    <randomthings:flootoken>,
    <randomthings:diviningrod>,
    <randomthings:diviningrod:1>,
    <randomthings:diviningrod:2>,
    <randomthings:diviningrod:3>,
    <randomthings:diviningrod:4>,
    <randomthings:diviningrod:5>,
    <randomthings:diviningrod:6>,
    <randomthings:diviningrod:7>,
    <randomthings:diviningrod:8>,
    <randomthings:diviningrod:9>,
    <randomthings:diviningrod:10>,
    <randomthings:diviningrod:11>,
    <randomthings:diviningrod:12>,
    <randomthings:diviningrod:13>,
    <randomthings:diviningrod:14>,
    <randomthings:diviningrod:15>,
    <randomthings:diviningrod:16>,
    <randomthings:diviningrod:17>,
    <randomthings:diviningrod:18>,
    <randomthings:diviningrod:19>,
    <randomthings:diviningrod:21>,
    <randomthings:floopouch>,
    <randomthings:weatheregg:1>,
    <randomthings:weatheregg:2>,
    <randomthings:weatheregg>,
    <xreliquary:alkahestry_tome>,
    <modularmachinery:blockoutputbus:6>,
    <modularmachinery:blockoutputbus:5>,
    <modularmachinery:blockoutputbus:4>,
    <modularmachinery:blockinputbus:6>,
    <modularmachinery:blockinputbus:5>,
    <modularmachinery:blockinputbus:4>,
    <modularmachinery:blockenergyoutputhatch:7>,
    <modularmachinery:blockenergyoutputhatch:6>,
    <modularmachinery:blockenergyoutputhatch:5>,
    <modularmachinery:blockenergyoutputhatch:4>,
    <modularmachinery:blockenergyinputhatch:7>,
    <modularmachinery:blockenergyinputhatch:6>,
    <modularmachinery:blockenergyinputhatch:5>,
    <modularmachinery:blockenergyinputhatch:4>,
    <modularmachinery:blockfluidoutputhatch:7>,
    <modularmachinery:blockfluidoutputhatch:6>,
    <modularmachinery:blockfluidoutputhatch:5>,
    <modularmachinery:blockfluidoutputhatch:4>,
    <modularmachinery:blockfluidinputhatch:7>,
    <modularmachinery:blockfluidinputhatch:6>,
    <modularmachinery:blockfluidinputhatch:5>,
    <modularmachinery:blockfluidinputhatch:4>,
    <extrautils2:opinium:*>,
    <extrautils2:lawsword>,
    <extrautils2:compoundbow>,
    <extrautils2:fireaxe>,
    <extrautils2:luxsaber:*>,
    <extrautils2:teleporter:*>,
    <extrautils2:terraformer:*>,
    <extrautils2:ingredients:15>,
    <extrautils2:ingredients:16>,
    <extrautils2:ingredients:6>,
    <extrautils2:ingredients:7>,
    <extrautils2:ingredients:8>,
    <extrautils2:ingredients:9>,
    <extrautils2:grocket:*>,
    <extrautils2:pipe>,
    <extrautils2:indexerremote>,
    <extrautils2:indexer>,
    <tconstruct:fancy_frame:1>,
    <tconstruct:fancy_frame:2>,
    <tconstruct:fancy_frame:3>,
    <tconstruct:fancy_frame:4>,
    <tconstruct:throwball:1>,
    <mekanismtools:bronzepickaxe>,
    <mekanismtools:bronzeaxe>,
    <mekanismtools:bronzeshovel>,
    <mekanismtools:bronzehoe>,
    <mekanismtools:bronzesword>,
    <mekanismtools:bronzepaxel>,
    <mekanismtools:bronzehelmet>,
    <mekanismtools:bronzechestplate>,
    <mekanismtools:bronzeleggings>,
    <mekanismtools:bronzeboots>,
    <mekanismtools:steelpickaxe>,
    <mekanismtools:steelaxe>,
    <mekanismtools:steelshovel>,
    <mekanismtools:steelhoe>,
    <mekanismtools:steelsword>,
    <mekanismtools:steelpaxel>,
    <mekanismtools:steelhelmet>,
    <mekanismtools:steelchestplate>,
    <mekanismtools:steelleggings>,
    <mekanismtools:steelboots>,
    <advancedrocketry:arcfurnace>,
    <libvulpes:holoprojector>,
    <libvulpes:forgepowerinput>,
    <libvulpes:hatch>,
    <libvulpes:hatch:1>,
    <libvulpes:hatch:2>,
    <libvulpes:hatch:3>,
    <libvulpes:creativepowerbattery>,
    <libvulpes:forgepoweroutput>,
    <mekanism:controlcircuit>,
    <extendedcrafting:material:9>,
    <extendedcrafting:material:15>,
    <extendedcrafting:pedestal>,
    <extendedcrafting:crafting_core>,
    <extendedcrafting:ender_crafter>,
    <extendedcrafting:ender_alternator>,
    <extendedcrafting:material:36>,
    <extendedcrafting:material:37>,
    <extendedcrafting:material:40>,
    <extendedcrafting:material:41>,
    <extendedcrafting:material:48>,
    <extendedcrafting:material:49>,
    <extendedcrafting:storage:7>,
    <extendedcrafting:storage:6>,
    <extendedcrafting:storage:5>,
    <rftools:storage_module_tablet>,
    <rftools:remote_storage>,
    <rftools:storage_module:6>,
    <rftools:storage_terminal>,
    <mekanism:basicblock:8>,
    <nuclearcraft:alloy_furnace_active>,
    <nuclearcraft:alloy_furnace_idle>,
    <nuclearcraft:part:8>,
    <mekanism:basicblock2:1>,
    <mekanism:basicblock2:2>,
    <mekanism:basicblock2:3>.withTag({tier: 0}),
    <mekanism:basicblock2:3>.withTag({tier: 1}),
    <mekanism:basicblock2:4>.withTag({tier: 0}),
    <mekanism:basicblock2:4>.withTag({tier: 1}),
    <nuclearcraft:lithium_ion_cell>,
    <nuclearcraft:rock_crusher_idle>,
    <nuclearcraft:rock_crusher_active>,
    <nuclearcraft:manufactory_active>,
    <nuclearcraft:manufactory_idle>
] as crafttweaker.item.IItemStack[];

for item in stage2_stageItems
{
	scripts.helpers.setItemAndRecipesStage(item, stageString);
}

//Stage the Unstable Enchantment
mods.ItemStages.stageEnchant(stageString, <enchantment:openblocks:explosive>);

//Crafting Forestry Bronze Pickaxes
mods.recipestages.Recipes.setRecipeStage(stageString, <forestry:bronze_shovel>);
mods.recipestages.Recipes.setRecipeStage(stageString, <forestry:bronze_pickaxe>);

//Stage Modular Machinery
val stage2_modularMachinery = [
    <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:ore_washing_factory"}),
    <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:mechanical_imbuer"}),
    <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:industrial_mixer"}),
    <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:assembly_line"}),
] as crafttweaker.item.IItemStack[];

for item in stage2_modularMachinery
{
	scripts.helpers.setItemAndRecipesStage(item, stageString);
}

print("### Stage 2 Staging Complete ###");
