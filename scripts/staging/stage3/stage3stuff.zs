#priority 55
import mods.zenstages.Stage;
import scripts.staging.stages;

print("~~~ Begin Stage 3 Staging ~~~");

var stageString = stages.progression3.stage;

//Stage Stubborn Items.
val stage3_stageItems = [
    <magneticraft:pumpjack>,
    <magneticraft:oil_heater>,
    <magneticraft:refinery>,
    <thermalexpansion:augment:128>,
    <thermalexpansion:augment:129>,
    <thermalexpansion:augment:368>,
    <thermalexpansion:augment:512>,
    <thermalexpansion:augment:513>,
    <thermalexpansion:augment:673>,
    <thermalexpansion:augment:674>,
    <thermalexpansion:machine:1>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [3, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte}),
    <thermalexpansion:machine:1>,
    <thermalexpansion:machine:3>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [3, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte}),
    <thermalexpansion:machine:3>,
    <thermalexpansion:machine:7>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [1, 2, 3, 3, 3, 3] as byte[] as byte[], Level: 0 as byte}),
    <thermalexpansion:machine:7>,
    <industrialforegoing:mob_relocator>,
	<industrialforegoing:black_hole_unit>,
	<industrialforegoing:mob_duplicator>,
	<industrialforegoing:laser_base>,
	<industrialforegoing:laser_drill>,
	<industrialforegoing:black_hole_controller_reworked>,
	<industrialforegoing:material_stonework_factory>,
	<industrialforegoing:black_hole_tank>,
    <enderio:block_sag_mill>,
    <enderio:block_enhanced_alloy_smelter>,
    <enderio:block_enhanced_combustion_generator>,
    <enderio:block_enhanced_sag_mill>,
    <enderio:block_enhanced_vat>,
    <enderio:block_enhanced_wired_charger>,
    <enderio:block_enhanced_wireless_charger>,
    <enderio:block_powered_spawner>,
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

print("### Stage 3 Staging Complete ###");
