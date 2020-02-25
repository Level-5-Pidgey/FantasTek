#priority 97

print("~~~ Begin Stage 1 Staging ~~~");

//Items that should not have a stage associated with them at all
val StageLessItems = [
  <forestry:letters>,
  <forestry:stamps>,
  <forestry:stamps:1>,
  <forestry:stamps:2>,
  <forestry:stamps:3>,
  <forestry:stamps:4>,
  <forestry:stamps:5>,
  <forestry:stamps:6>,
  <forestry:mailbox>,
  <forestry:trade_station>,
  <mekanismtools:woodpaxel>,
  <mekanismtools:stonepaxel>,
  <mekanismtools:ironpaxel>,
  <mekanismtools:diamondpaxel>,
  <mekanismtools:goldpaxel>,
  <mekanismtools:lapislazulipickaxe>,
  <mekanismtools:lapislazuliaxe>,
  <mekanismtools:lapislazulishovel>,
  <mekanismtools:lapislazulihoe>,
  <mekanismtools:lapislazulisword>,
  <mekanismtools:lapislazulipaxel>,
  <mekanismtools:lapislazulihelmet>,
  <mekanismtools:lapislazulichestplate>,
  <mekanismtools:lapislazulileggings>,
  <mekanismtools:lapislazuliboots>,
  <appliedenergistics2:crank>,
  <appliedenergistics2:grindstone>,
  <advancedrocketry:platepress>,
  <advancedrocketry:iquartzcrucible>,
  <advancedrocketry:blastbrick>,
  <rftools:storage_module>,
  <rftools:storage_module:1>,
  <rftools:storage_module:2>,
  <rftools:storage_module:2>,
  <rftools:generic_module>,
  <rftools:oredict_module>,
  <rftools:filter_module>,
  <rftools:storage_module:6>,
  <rftools:text_module>,
  <rftools:inventory_module>,
  <rftools:inventoryplus_module>,
  <rftools:energy_module>,
  <rftools:energyplus_module>,
  <rftools:clock_module>,
  <rftools:fluid_module>,
  <rftools:fluidplus_module>,
  <rftools:machineinformation_module>,
  <rftools:computer_module>,
  <rftools:elevator_button_module>,
  <rftools:button_module>,
  <rftools:redstone_module>,
  <rftools:counter_module>,
  <rftools:counterplus_module>,
  <rftools:storage_control_module>,
  <rftools:dump_module>,
  <rftools:elevator>,
  <rftools:smartwrench>,
  <rftools:screen>,
  <rftools:screen_controller>,
  <rftools:remote_storage>,
  <rftools:modular_storage>,
  <rftools:item_filter>,
  <rftools:storage_scanner>,
  <rftools:storage_terminal>,
  <contenttweaker:prismarine_nugget>,
  <contenttweaker:astral_crystal_earth>,
  <contenttweaker:astral_crystal_air>,
  <contenttweaker:astral_crystal_fire>,
  <contenttweaker:astral_crystal_water>,
  <contenttweaker:strange_treasure>,
  <contenttweaker:coke_dust>,
  <contenttweaker:steel_blend>,
  <contenttweaker:wood_plate>,
  <contenttweaker:sealed_wood_plate>,
  <thermalfoundation:tool.bow_diamond>,
  <thermalfoundation:tool.fishing_rod_diamond>,
  <thermalfoundation:tool.shears_diamond>,
  <thermalfoundation:tool.sickle_diamond>,
  <thermalfoundation:tool.hammer_diamond>,
  <thermalfoundation:tool.excavator_diamond>,
  <thermalfoundation:tool.shield_diamond>,
  <thermalfoundation:tool.bow_gold>,
  <thermalfoundation:tool.fishing_rod_gold>,
  <thermalfoundation:tool.shears_gold>,
  <thermalfoundation:tool.sickle_gold>,
  <thermalfoundation:tool.hammer_gold>,
  <thermalfoundation:tool.excavator_gold>,
  <thermalfoundation:tool.shield_gold>,
  <thermalfoundation:tool.bow_stone>,
  <thermalfoundation:tool.fishing_rod_stone>,
  <thermalfoundation:tool.hammer_wood>,
  <thermalfoundation:tool.excavator_stone>,
  <thermalfoundation:tool.shield_stone>,
  <thermalfoundation:tool.hammer_stone>,
  <thermalfoundation:tool.sickle_stone>,
  <thermalfoundation:tool.shears_stone>,
  <thermalfoundation:tool.shears_wood>,
  <thermalfoundation:tool.excavator_wood>,
  <thermalfoundation:tool.shield_iron>,
  <thermalfoundation:tool.fishing_rod_iron>,
  <thermalfoundation:tool.bow_iron>,
  <thermalfoundation:tool.sickle_iron>,
  <thermalfoundation:tool.hammer_iron>,
  <thermalfoundation:tool.excavator_iron>,
  <iceandfire:lectern>,
  <iceandfire:podium>,
  <iceandfire:podium:1>,
  <iceandfire:podium:2>,
  <iceandfire:podium:3>,
  <iceandfire:podium:4>,
  <iceandfire:podium:5>,
  <iceandfire:pixie_house>,
  <iceandfire:pixie_house:1>,
  <iceandfire:pixie_house:2>,
  <iceandfire:pixie_house:3>,
  <iceandfire:pixie_house:4>,
  <iceandfire:pixie_house:5>,
  <iceandfire:jar_empty>,
  <iceandfire:jar_pixie>,
  <iceandfire:jar_pixie:1>,
  <iceandfire:jar_pixie:2>,
  <iceandfire:jar_pixie:3>,
  <iceandfire:jar_pixie:4>,
  <iceandfire:manuscript>,
  <iceandfire:sapphire_gem>,
  <projectred-core:resource_item:105>,
  <projectred-core:resource_item:103>,
  <projectred-core:resource_item:104>,
  <projectred-core:resource_item:250>,
  <projectred-core:resource_item:251>,
  <projectred-core:resource_item:252>,
  <projectred-core:resource_item:300>,
  <projectred-core:resource_item:301>,
  <projectred-core:resource_item:310>,
  <projectred-core:resource_item:311>,
  <projectred-core:resource_item:312>,
  <projectred-core:resource_item:320>,
  <projectred-core:resource_item:341>,
  <projectred-core:resource_item:342>,
  <projectred-core:resource_item:420>,
  <projectred-core:resource_item:421>,
  <projectred-core:resource_item:500>,
  <projectred-core:resource_item:501>,
  <projectred-core:resource_item:502>,
  <projectred-core:resource_item:503>,
  <projectred-core:resource_item:504>,
  <projectred-core:resource_item:505>,
  <projectred-core:resource_item:506>,
  <projectred-core:resource_item:507>,
  <projectred-core:resource_item:508>,
  <projectred-core:resource_item:509>,
  <projectred-core:resource_item:510>,
  <projectred-core:resource_item:511>,
  <projectred-core:resource_item:512>,
  <projectred-core:resource_item:513>,
  <projectred-core:resource_item:514>,
  <projectred-core:resource_item:515>,
  <projectred-core:resource_item:600>,
  <projectred-core:drawplate>,
  <projectred-core:multimeter>,
  <projectred-core:screwdriver>,
  <extendedcrafting:handheld_table>,
  <extendedcrafting:storage:1>,
  <extendedcrafting:storage>,
  <extendedcrafting:table_basic>,
  <extendedcrafting:material:7>,
  <extendedcrafting:material:3>,
  <extendedcrafting:material:2>,
  <extendedcrafting:material:1>,
  <extendedcrafting:material>,
  <extendedcrafting:material:14>,
  <witherskelefix:fragment>,
  <forestry:bee_house>,
  <forestry:cart.beehouse>,
  <forestry:apiary>,
  <forestry:apiarist_chest>,
  <forestry:apiarist_legs>,
  <forestry:apiarist_boots>,
  <forestry:apiarist_helmet>,
  <forestry:cart.beehouse:1>,
  <forestry:bee_chest>,
  <forestry:engine_clockwork>,
  <forestry:carpenter>,
  <forestry:centrifuge>,
  <forestry:fabricator>,
  <forestry:worktable>,
  <magneticraft:conveyor_belt>,
  <magneticraft:inserter>,
  <enderio:block_simple_furnace>,
  <forestry:squeezer>,
  <thermaldynamics:duct_0>,
  <forestry:impregnated_casing>,
  <forestry:oak_stick>,
  <forestry:frame_impregnated>,
  <forestry:broken_bronze_pickaxe>,
  <forestry:broken_bronze_shovel>,
  <contenttweaker:sanguine_gem_air>,
  <contenttweaker:sanguine_gem_water>,
  <contenttweaker:sanguine_gem_fire>,
  <contenttweaker:sanguine_gem_earth>,
  <contenttweaker:sanguine_ingot>,
  <contenttweaker:sanguine_gem>,
  <contenttweaker:salis_mundus_air>,
  <contenttweaker:salis_mundus_water>,
  <contenttweaker:salis_mundus_fire>,
  <contenttweaker:salis_mundus_earth>,
  <contenttweaker:crystal_ember_air>,
  <contenttweaker:crystal_ember_water>,
  <contenttweaker:crystal_ember_fire>,
  <contenttweaker:crystal_ember_earth>
] as crafttweaker.item.IItemStack[];

for item in StageLessItems
{
  mods.ItemStages.removeItemStage(item);
}

print("### Stage 1 Staging Complete ###");
