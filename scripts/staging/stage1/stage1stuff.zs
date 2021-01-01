#priority 51

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
	<rftools:dump_module>,
	<rftools:elevator>,
	<rftools:smartwrench>,
	<rftools:screen>,
	<rftools:screen_controller>,
	<contenttweaker:prismarine_nugget>,
	<contenttweaker:strange_treasure>,
	<contenttweaker:coke_dust>,
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
	<extendedcrafting:guide>,
	<extendedcrafting:frame>,
	<extendedcrafting:lamp>,
	<extendedcrafting:lamp:1>,
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
	<enderio:block_enderman_skull>,
	<forestry:beeswax>,
	<forestry:honey_drop>,
	<forestry:propolis:*>,
	<forestry:pollen:*>,
	<contenttweaker:vegemite>,
	<contenttweaker:vegemite_sandwich>,
	<contenttweaker:sushi>,
	<contenttweaker:steak_and_chips>,
	<contenttweaker:pocky>,
	<contenttweaker:meat_pie>,
	<contenttweaker:honey_sandwich>,
	<contenttweaker:fairy_bread>,
	<contenttweaker:chocolate>,
	<contenttweaker:chicken_bucket>,
	<magneticraft:crafting:2>,
	<thermalfoundation:material:657>,
	<forestry:kit_pickaxe>,
	<forestry:kit_shovel>,
	<forestry:bronze_pickaxe>,
	<forestry:bronze_shovel>,
	<enderio:item_material>,
	<forestry:refractory_wax>,
	<contenttweaker:currency_4>,
	<contenttweaker:currency_20>,
	<contenttweaker:currency_100>,
	<contenttweaker:currency_500>,
	<contenttweaker:currency_2500>,
	<contenttweaker:currency_12500>,
	<forestry:crated.stonegranite>,
	<forestry:crated.stonediorite>,
	<forestry:crated.stoneandesite>,
	<forestry:crated.blockprismarine>,
	<forestry:crated.blockprismarinebrick>,
	<forestry:crated.blockprismarinedark>,
	<forestry:crated.minecraft.brick_block.0>,
	<forestry:crated.blockcactus>,
	<forestry:crated.minecraft.sand.0>,
	<forestry:crate>,
	<forestry:crated.forestry.ash.0>,
	<forestry:crated.forestry.bog_earth.0>,
	<forestry:crated.cropwheat>,
	<forestry:crated.minecraft.cookie.0>,
	<forestry:crated.dustredstone>,
	<forestry:crated.minecraft.dye.4>,
	<forestry:crated.sugarcane>,
	<forestry:crated.minecraft.clay_ball.0>,
	<forestry:crated.dustglowstone>,
	<forestry:crated.minecraft.apple.0>,
	<forestry:crated.minecraft.nether_wart.0>,
	<forestry:crated.minecraft.coal.1>,
	<forestry:crated.minecraft.coal.0>,
	<forestry:crated.minecraft.wheat_seeds.0>,
	<forestry:crated.croppotato>,
	<forestry:crated.cropcarrot>,
	<forestry:crated.minecraft.log.0>,
	<forestry:crated.minecraft.log.1>,
	<forestry:crated.minecraft.log.2>,
	<forestry:crated.minecraft.log.3>,
	<forestry:crated.minecraft.log2.0>,
	<forestry:crated.minecraft.log2.1>,
	<forestry:crated.cobblestone>,
	<forestry:crated.dirt>,
	<forestry:crated.minecraft.dirt.2>,
	<forestry:crated.stone>,
	<forestry:crated.minecraft.sand.1>,
	<forestry:crated.obsidian>,
	<forestry:crated.netherrack>,
	<forestry:crated.forestry.bee_combs.3>,
	<forestry:crated.minecraft.soul_sand.0>,
	<forestry:crated.minecraft.sandstone.0>,
	<forestry:crated.minecraft.nether_brick.0>,
	<forestry:crated.minecraft.mycelium.0>,
	<forestry:crated.gravel>,
	<forestry:crated.forestry.peat.0>,
	<forestry:crated.forestry.mulch.0>,
	<forestry:crated.forestry.fertilizer_compound.0>,
	<forestry:crated.forestry.phosphor.0>,
	<forestry:crated.forestry.humus.0>,
	<forestry:crated.minecraft.sapling.0>,
	<forestry:crated.minecraft.sapling.1>,
	<forestry:crated.minecraft.sapling.2>,
	<forestry:crated.minecraft.sapling.3>,
	<forestry:crated.minecraft.sapling.4>,
	<forestry:crated.minecraft.sapling.5>,
	<forestry:crated.forestry.beeswax.0>,
	<forestry:crated.forestry.pollen.0>,
	<forestry:crated.forestry.pollen.1>,
	<forestry:crated.forestry.propolis.0>,
	<forestry:crated.forestry.honeydew.0>,
	<forestry:crated.forestry.royal_jelly.0>,
	<forestry:crated.forestry.bee_combs.0>,
	<forestry:crated.forestry.bee_combs.1>,
	<forestry:crated.forestry.bee_combs.2>,
	<forestry:crated.forestry.bee_combs.4>,
	<forestry:crated.forestry.bee_combs.5>,
	<forestry:crated.forestry.bee_combs.6>,
	<forestry:crated.forestry.bee_combs.7>,
	<forestry:crated.forestry.bee_combs.8>,
	<forestry:crated.forestry.bee_combs.10>,
	<forestry:crated.forestry.bee_combs.14>,
	<forestry:crated.forestry.bee_combs.15>,
	<forestry:crated.forestry.bee_combs.16>,
	<forestry:crated.forestry.refractory_wax.0>,
	<forestry:crated.natura.edibles.0>,
	<forestry:crated.natura.edibles.1>,
	<forestry:crated.natura.edibles.11>,
	<forestry:crated.natura.soups.9>,
	<forestry:crated.natura.overworld_logs.0>,
	<forestry:crated.natura.overworld_logs.1>,
	<forestry:crated.natura.overworld_logs.2>,
	<forestry:crated.natura.overworld_logs.3>,
	<forestry:crated.natura.overworld_logs2.0>,
	<forestry:crated.natura.overworld_logs2.1>,
	<forestry:crated.natura.overworld_logs2.2>,
	<forestry:crated.natura.overworld_logs2.3>,
	<forestry:crated.natura.redwood_logs.0>,
	<forestry:crated.natura.redwood_logs.1>,
	<forestry:crated.natura.redwood_logs.2>,
	<forestry:crated.natura.nether_logs.0>,
	<forestry:crated.natura.nether_logs.1>,
	<forestry:crated.natura.nether_logs.2>,
	<forestry:crated.natura.nether_logs2.0>,
	<forestry:crated.natura.nether_logs2.15>,
	<forestry:crated.natura.overworld_sapling.0>,
	<forestry:crated.natura.overworld_sapling.1>,
	<forestry:crated.natura.overworld_sapling.2>,
	<forestry:crated.natura.overworld_sapling.3>,
	<forestry:crated.natura.overworld_sapling2.0>,
	<forestry:crated.natura.overworld_sapling2.1>,
	<forestry:crated.natura.overworld_sapling2.2>,
	<forestry:crated.natura.overworld_sapling2.3>,
	<forestry:crated.natura.nether_glowshroom.2>,
	<forestry:crated.natura.nether_glowshroom.1>,
	<forestry:crated.natura.nether_glowshroom.0>,
	<forestry:crated.natura.nether_sapling2.0>,
	<forestry:crated.natura.nether_sapling.2>,
	<forestry:crated.natura.nether_sapling.1>,
	<forestry:crated.natura.nether_sapling.0>,
	<forestry:crated.natura.redwood_sapling.0>,
	<forestry:crated.natura.materials.1>,
	<forestry:crated.natura.materials.2>,
	<forestry:crated.natura.materials.4>,
	<forestry:crated.natura.materials.5>,
	<forestry:crated.natura.materials.6>,
	<forestry:crated.natura.materials.7>,
	<forestry:crated.natura.materials.8>,
	<forestry:crated.natura.overworld_seeds.0>,
	<forestry:crated.natura.overworld_seeds.1>,
	<forestry:crated.natura.edibles.2>,
	<forestry:crated.natura.edibles.3>,
	<forestry:crated.natura.edibles.4>,
	<forestry:crated.natura.edibles.5>,
	<forestry:crated.natura.edibles.6>,
	<forestry:crated.natura.edibles.7>,
	<forestry:crated.natura.edibles.8>,
	<forestry:crated.natura.edibles.9>,
	<forestry:crated.natura.edibles.10>,
	<forestry:crated.natura.saguaro_fruit_item.0>,
	<forestry:crated.natura.materials.0>,
	<forestry:crated.natura.materials.3>,
	<contenttweaker:champion_token_1>,
	<contenttweaker:champion_token_2>,
	<contenttweaker:champion_token_3>,
	<contenttweaker:champion_token_4>,
	<mekanism:obsidiantnt>,
	<advancedrocketry:ic>,
	<projectred-core:resource_item>,
	<projectred-core:resource_item:21>,
	<projectred-core:resource_item:20>,
	<forestry:wood_pile>,
	<forestry:wood_pile_decorative>,
	<projectred-core:resource_item:1>,
	<projectred-core:resource_item:2>,
	<projectred-core:resource_item:3>,
	<projectred-core:resource_item:4>,
	<projectred-core:resource_item:10>,
	<projectred-core:resource_item:11>,
	<projectred-core:resource_item:12>,
	<forestry:refractory>,
	<forestry:capsule>,
	<forestry:phosphor>,
	<forestry:fertilizer_bio>,
	<forestry:ash_brick>,
	<forestry:ash_stairs>,
	<forestry:loam>,
	<forestry:humus>,
	<forestry:mulch>,
	<forestry:carton>,
	<forestry:analyzer>,
	<forestry:bituminous_peat>,
	<forestry:crafting_material:6>,
	<forestry:crafting_material:5>,
	<forestry:portable_alyzer>,
	<forestry:pipette>,
	<forestry:raintank>,
	<forestry:mailbox>,
	<forestry:crafting_material:3>,
	<forestry:alveary.plain>,
	<forestry:alveary.swarmer>,
	<forestry:alveary.fan>,
	<forestry:alveary.heater>,
	<forestry:alveary.hygro>,
	<forestry:alveary.stabiliser>,
	<forestry:alveary.sieve>,
	<forestry:chipsets>,
	<forestry:chipsets:1>,
	<forestry:chipsets:2>,
	<forestry:chipsets:3>,
	<forestry:soldering_iron>,
	<forestry:naturalist_helmet>,
	<forestry:escritoire>,
	<forestry:bog_earth>,
	<forestry:catalogue>,
	<forestry:scoop>,
	<forestry:apiarist_bag>,
	<forestry:miner_bag>,
	<forestry:miner_bag_t2>,
	<forestry:digger_bag>,
	<forestry:digger_bag_t2>,
	<forestry:forester_bag>,
	<forestry:forester_bag_t2>,
	<forestry:hunter_bag>,
	<forestry:hunter_bag_t2>,
	<forestry:adventurer_bag>,
	<forestry:adventurer_bag_t2>,
	<forestry:builder_bag>,
	<forestry:builder_bag_t2>,
	<forestry:habitat_locator>,
	<forestry:imprinter>,
	<forestry:frame_untreated>,
	<forestry:frame_impregnated>,
	<forestry:frame_proven>,
	<forestry:honeydew>,
	<forestry:royal_jelly>,
	<forestry:wax_cast>,
	<forestry:beehives>,
	<forestry:beehives:1>,
	<forestry:beehives:2>,
	<forestry:beehives:3>,
	<forestry:beehives:4>,
	<forestry:beehives:5>,
	<forestry:beehives:6>,
	<forestry:smoker>,
	<forestry:candle>,
	<forestry:stump>,
	<forestry:bee_combs_0:*>,
	<forestry:ffarm:*>,
	<forestry:moistener>,
	<forestry:book_forester>,
	<forestry:fertilizer_compound>,
	<forestry:database>,
	<forestry:engine_peat>,
	<forestry:engine_biogas>,
	<thermalfoundation:material:801>,
	<iceandfire:ash>,
	<thermalfoundation:material:656>,
	<contenttweaker:steel_blend>,
	<forestry:peat_bog:1>,
	<forestry:peat_bog>,
	<forestry:farm_ender:1>,
	<forestry:farm_ender>,
	<forestry:farm_nether:1>,
	<forestry:farm_nether>,
	<forestry:farm_gourd:1>,
	<forestry:farm_gourd>,
	<forestry:arboretum:1>,
	<forestry:arboretum>,
	<forestry:farm_crops>,
	<forestry:farm_crops:1>,
	<magneticraft:battery_item_medium>,
	<magneticraft:battery_item_low>,
	<forestry:chipsets:3>.withTag({T: 3 as short}),
	<forestry:chipsets:2>.withTag({T: 2 as short}),
	<forestry:chipsets:1>.withTag({T: 1 as short}),
	<forestry:chipsets>.withTag({T: 0 as short}),
	<forestry:thermionic_tubes:12>,
	<forestry:farm_mushroom>,
	<forestry:farm_mushroom:1>,
	<rftools:item_filter>,
	<mekanism:energycube>.withTag({tier: 0}),
	<magneticraft:water_generator>,
	<magneticraft:feeding_trough>,
	<magneticraft:small_tank>,
	<magneticraft:box>,
	<magneticraft:brick_furnace>,
	<magneticraft:thermopile>,
	<magneticraft:thermometer>,
	<magneticraft:voltmeter>,
	<magneticraft:electric_drill>,
	<magneticraft:electric_chainsaw>,
	<magneticraft:electric_piston>,
	<magneticraft:electric_cable>,
	<magneticraft:electric_engine>,
	<magneticraft:rf_heater>,
	<magneticraft:multiblock_parts:2>,
	<magneticraft:multiblock_parts:4>,
	<magneticraft:multiblock_column>,
	<magneticraft:multiblock_parts:5>,
	<magneticraft:multiblock_parts>,
	<magneticraft:multiblock_parts:1>,
	<magneticraft:wrench>,
	<magneticraft:heat_pipe>,
	<magneticraft:insulated_heat_pipe>,
	<magneticraft:solar_panel>,
	<magneticraft:shelving_unit>,
	<magneticraft:steam_engine>,
	<magneticraft:container>,
	<magneticraft:combustion_chamber>,
	<magneticraft:steam_boiler>,
	<enderio:block_solar_panel>,
	<enderio:item_material:3>,
	<enderio:item_material:38>,
	<thermalexpansion:device>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [0, 1, 0, 0, 0, 0] as byte[] as byte[]}),
	<thermalexpansion:device:10>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [2, 1, 1, 1, 1, 1] as byte[] as byte[]}),
	<iceandfire:chain_link>,
	<forestry:peat>,
	<forestry:crafting_material:2>,
	<extendedcrafting:interface>,
	<enderio:item_material:77>,
	<thaumcraft:nugget:10>,
	<minecraft:mob_spawner>,
	<thermalfoundation:wrench>,
	<botania:pestleandmortar>,
	<magneticraft:guide_book>,
	<magneticraft:limestone>,
	<magneticraft:limestone:1>,
	<magneticraft:limestone:2>,
	<magneticraft:burnt_limestone>,
	<magneticraft:burnt_limestone:1>,
	<magneticraft:burnt_limestone:2>,
	<magneticraft:tile_limestone>,
	<magneticraft:tile_limestone:1>,
	<magneticraft:tube_light>,
	<magneticraft:electric_drill>.withTag({energy: 512000}),
	<magneticraft:electric_chainsaw>.withTag({energy: 512000}),
	<magneticraft:electric_piston>.withTag({energy: 512000}),
	<magneticraft:battery_item_medium>.withTag({energy: 250000}),
	<magneticraft:battery_item_low>.withTag({energy: 100000}),
	<magneticraft:heat_sink>,
	<magneticraft:crafting:6>,
	<enderio:item_material:20>,
	<enderio:block_infinity:2>,
	<enderio:block_infinity>,
	<enderio:block_infinity:1>,
	<magneticraft:battery>,
	<magneticraft:electric_furnace>,
	<enderio:block_painted_pressure_plate:7>,
	<enderio:block_painted_pressure_plate:5>,
	<enderio:block_painted_pressure_plate:3>,
	<enderio:block_painted_pressure_plate:1>,
	<enderio:block_self_resetting_lever300i>,
	<enderio:block_self_resetting_lever60i>,
	<enderio:block_self_resetting_lever30i>,
	<enderio:block_self_resetting_lever10i>,
	<enderio:block_self_resetting_lever5i>,
	<enderio:block_self_resetting_lever300>,
	<enderio:block_self_resetting_lever60>,
	<enderio:block_self_resetting_lever30>,
	<enderio:block_self_resetting_lever10>,
	<enderio:block_self_resetting_lever5>,
	<enderio:block_simple_wired_charger>,
	<rftools:modular_storage>,
	<rftools:storage_module>,
	<rftools:storage_module:1>,
	<rftools:storage_module:2>,
	<rftools:storage_control_module>,
	<rftools:dump_module>,
	<rftools:storage_scanner>,
	<rftools:storage_terminal>,
] as crafttweaker.item.IItemStack[];

for item in StageLessItems
{
  mods.ItemStages.removeItemStage(item);
}

print("### Stage 1 Staging Complete ###");
