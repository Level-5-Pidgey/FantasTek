#priority 50
import scripts.staging.stages;

print("~~~ Begin Entity Staging ~~~");

function StageMorb(entityString as string, stageToSetTo as mods.zenstages.Stage)
{
	mods.ItemStages.addItemStage(stageToSetTo.stage, <thermalexpansion:morb>.withTag({Generic: 1 as byte, id: entityString}));
}

function StageBrokenSpawner(entityString as string, stageToSetTo as mods.zenstages.Stage)
{
	mods.ItemStages.addItemStage(stageToSetTo.stage, <enderio:item_broken_spawner>.withTag({entityId: entityString}));
}

function StageSoulVial(entityString as string, stageToSetTo as mods.zenstages.Stage)
{
	mods.ItemStages.addItemStage(stageToSetTo.stage, <enderio:item_soul_vial:1>.withTag({entityId: entityString}));
}

function StageSpawnEgg(entityString as string, stageToSetTo as mods.zenstages.Stage)
{
	mods.ItemStages.addItemStage(stageToSetTo.stage, <minecraft:spawn_egg>.withTag({EntityTag: {id: entityString}}));
}

var entityStages as mods.zenstages.Stage[string] =
{
	"advancedrocketry:arabducteditem" : stages.progression1,
	"advancedrocketry:arhovercraft" : stages.Locked,
	"advancedrocketry:arplanetuibutton" : stages.progression1,
	"advancedrocketry:arplanetuiitem" : stages.progression1,
	"advancedrocketry:arspaceelevatorcapsule" : stages.progression1,
	"advancedrocketry:arstaruibutton" : stages.progression1,
	"advancedrocketry:deployedrocket" : stages.Locked,
	"advancedrocketry:lasernode" : stages.Locked,
	"advancedrocketry:mountdummy" : stages.progression1,
	"advancedrocketry:rocket" : stages.Locked,
	"appliedenergistics2:appeng" : stages.progression1,
	"astralsorcery:entitycrystal" : stages.AstralSorcery1,
	"astralsorcery:entitycrystaltool" : stages.AstralSorcery1,
	"astralsorcery:entityflare" : stages.AstralSorcery1,
	"astralsorcery:entitygrapplinghook" : stages.AstralSorcery1,
	"astralsorcery:entityhighlighted" : stages.AstralSorcery1,
	"astralsorcery:entityilluminationspark" : stages.AstralSorcery1,
	"astralsorcery:entityitemdamageresistant" : stages.AstralSorcery1,
	"astralsorcery:entityliquidspark" : stages.AstralSorcery1,
	"astralsorcery:entitynocturnalspark" : stages.AstralSorcery1,
	"astralsorcery:entityobservatoryhelper" : stages.AstralSorcery1,
	"astralsorcery:entityshootingstar" : stages.AstralSorcery1,
	"astralsorcery:entityspectraltool" : stages.AstralSorcery1,
	"astralsorcery:entitystarburst" : stages.AstralSorcery1,
	"astralsorcery:entitystardust" : stages.AstralSorcery1,
	"avaritia:endest_pearl" : stages.Locked,
	"avaritia:gaping_void" : stages.Locked,
	"avaritia:heaven_arrow" : stages.progression1,
	"avaritia:heaven_sub_arrow" : stages.progression1,
	"betternether:firefly" : stages.progression1,
	"biomesoplenty:bop_boat" : stages.progression1,
	"biomesoplenty:mudball" : stages.progression1,
	"biomesoplenty:wasp" : stages.Locked,
	"bloodmagic:blood_light" : stages.BloodMagic1,
	"bloodmagic:corrupted_chicken" : stages.BloodMagic1,
	"bloodmagic:corrupted_sheep" : stages.BloodMagic1,
	"bloodmagic:corrupted_spider" : stages.BloodMagic1,
	"bloodmagic:corrupted_zombie" : stages.BloodMagic1,
	"bloodmagic:meteor" : stages.BloodMagic1,
	"bloodmagic:mimic" : stages.BloodMagic1,
	"bloodmagic:sentient_specter" : stages.BloodMagic1,
	"bloodmagic:soul_arrow" : stages.BloodMagic1,
	"bloodmagic:soul_snare" : stages.BloodMagic1,
	"botania:babylon_weapon" : stages.Botania1,
	"botania:corporea_spark" : stages.Botania1,
	"botania:doppleganger" : stages.Botania1,
	"botania:ender_air_bottle" : stages.Botania1,
	"botania:falling_star" : stages.Botania1,
	"botania:flame_ring" : stages.Botania1,
	"botania:magic_landmine" : stages.Botania1,
	"botania:magic_missile" : stages.Botania1,
	"botania:mana_burst" : stages.Botania1,
	"botania:mana_storm" : stages.Botania1,
	"botania:pink_wither" : stages.Botania1,
	"botania:pixie" : stages.Botania1,
	"botania:player_mover" : stages.Botania1,
	"botania:pool_minecart" : stages.Botania1,
	"botania:signal_flare" : stages.Botania1,
	"botania:spark" : stages.Botania1,
	"botania:thorn_chakram" : stages.Botania1,
	"botania:thrown_item" : stages.Botania1,
	"botania:vine_ball" : stages.Botania1,
	"bountifulbaubles:bee" : stages.progression1,
	"bountifulbaubles:beenade" : stages.progression1,
	"bountifulbaubles:flare" : stages.progression1,
	"bountifulbaubles:grenade" : stages.progression1,
	"buildinggadgets:blockbuildentity" : stages.progression1,
	"buildinggadgets:constructionblockentity" : stages.progression1,
	"champions:arctic_spark" : stages.progression1,
	"champions:cinder_spark" : stages.progression1,
	"champions:entity_jail" : stages.progression1,
	"charm:endermite_powder" : stages.progression1,
	"charm:spectre" : stages.progression1,
	"comforts:_entity_rest" : stages.progression1,
	"darkutils:fake_tnt" : stages.progression1,
	"deepmoblearning:glitch" : stages.Locked,
	"deepmoblearning:glitch_orb" : stages.Locked,
	"deepmoblearning:item_glitch_fragment" : stages.Locked,
	"deepmoblearning:trial_cave_spider" : stages.Locked,
	"deepmoblearning:trial_enderman" : stages.Locked,
	"deepmoblearning:trial_slime" : stages.Locked,
	"deepmoblearning:trial_spider" : stages.Locked,
	"doggytalents:attackbeam" : stages.progression1,
	"doggytalents:dog" : stages.progression1,
	"draconicevolution:chaosguardian" : stages.progression1,
	"draconicevolution:customarrow" : stages.Locked,
	"draconicevolution:dragonheartitem" : stages.Locked,
	"draconicevolution:enderenergymanipulator" : stages.progression1,
	"draconicevolution:entitychaosenergyvortex" : stages.progression1,
	"draconicevolution:guardiancrystal" : stages.progression1,
	"draconicevolution:guardianprojectile" : stages.progression1,
	"draconicevolution:lootcore" : stages.progression1,
	"draconicevolution:persistentitem" : stages.progression1,
	"embers:ancient_golem" : stages.Embers1,
	"embers:ember_light" : stages.Embers1,
	"embers:ember_packet" : stages.Embers1,
	"embers:ember_projectile" : stages.Embers1,
	"enderio:falling_machine" : stages.Locked,
	"enderio:owl_egg" : stages.Locked,
	"enderio:primed_charge" : stages.Locked,
	"enderiomachines:weather_rocket" : stages.Locked,
	"enderzoo:concussioncreeper" : stages.Locked,
	"enderzoo:direslime" : stages.Locked,
	"enderzoo:direwolf" : stages.Locked,
	"enderzoo:enderminy" : stages.Locked,
	"enderzoo:entityowlegg" : stages.Locked,
	"enderzoo:entityprimedcharge" : stages.Locked,
	"enderzoo:fallenknight" : stages.Locked,
	"enderzoo:fallenmount" : stages.Locked,
	"enderzoo:owl" : stages.progression1,
	"enderzoo:withercat" : stages.Locked,
	"enderzoo:witherwitch" : stages.Locked,
	"extrautils2:boomerang" : stages.progression1,
	"extrautils2:chunkdata" : stages.progression1,
	"fairylights:fastener" : stages.progression1,
	"fairylights:ladder" : stages.progression1,
	"iceandfire:amphithere" : stages.Locked,
	"iceandfire:amphitherearrow" : stages.progression1,
	"iceandfire:chaintie" : stages.Locked,
	"iceandfire:cyclops" : stages.Locked,
	"iceandfire:deathworm" : stages.Locked,
	"iceandfire:deathwormegg" : stages.progression1,
	"iceandfire:dragonarrow" : stages.progression1,
	"iceandfire:dragonegg" : stages.Locked,
	"iceandfire:dragonfirecharge" : stages.progression1,
	"iceandfire:dragonicecharge" : stages.progression1,
	"iceandfire:dragonskull" : stages.progression1,
	"iceandfire:firedragon" : stages.Locked,
	"iceandfire:gorgon" : stages.Locked,
	"iceandfire:hippocampus" : stages.Locked,
	"iceandfire:hippogryph" : stages.Locked,
	"iceandfire:hippogryphegg" : stages.Locked,
	"iceandfire:icedragon" : stages.Locked,
	"iceandfire:if_cockatrice" : stages.Locked,
	"iceandfire:if_cockatriceegg" : stages.Locked,
	"iceandfire:if_mob_skull" : stages.progression1,
	"iceandfire:if_pixie" : stages.progression1,
	"iceandfire:if_troll" : stages.Locked,
	"iceandfire:myrmex_egg" : stages.Locked,
	"iceandfire:myrmex_queen" : stages.Locked,
	"iceandfire:myrmex_royal" : stages.Locked,
	"iceandfire:myrmex_sentinel" : stages.Locked,
	"iceandfire:myrmex_soldier" : stages.Locked,
	"iceandfire:myrmex_swarmer" : stages.Locked,
	"iceandfire:myrmex_worker" : stages.Locked,
	"iceandfire:pixiecharge" : stages.progression1,
	"iceandfire:seaserpent" : stages.Locked,
	"iceandfire:siren" : stages.Locked,
	"iceandfire:seaserpentarrow" : stages.progression1,
	"iceandfire:seaserpentbubble" : stages.progression1,
	"iceandfire:snowvillager" : stages.progression1,
	"iceandfire:stonestatue" : stages.progression1,
	"iceandfire:stymphalianarrow" : stages.Locked,
	"iceandfire:stymphalianbird" : stages.Locked,
	"iceandfire:stymphalianfeather" : stages.Locked,
	"iceandfire:tide_trident" : stages.progression1,
	"ichunutil:entity_block" : stages.progression1,
	"industrialforegoing:pink_slime" : stages.Locked,
	"inspirations:arrow" : stages.progression1,
	"inworldcrafting:crafter_item" : stages.progression1,
	"mekanism:babyskeleton" : stages.progression1,
	"mekanism:balloon" : stages.progression1,
	"mekanism:flame" : stages.progression1,
	"mekanism:obsidiantnt" : stages.progression1,
	"mekanism:robit" : stages.progression1,
	"minecraft:area_effect_cloud" : stages.progression1,
	"minecraft:armor_stand" : stages.progression1,
	"minecraft:arrow" : stages.progression1,
	"minecraft:bat" : stages.progression1,
	"minecraft:blaze" : stages.progression1,
	"minecraft:boat" : stages.progression1,
	"minecraft:cave_spider" : stages.progression1,
	"minecraft:chest_minecart" : stages.progression1,
	"minecraft:chicken" : stages.progression1,
	"minecraft:commandblock_minecart" : stages.progression1,
	"minecraft:cow" : stages.progression1,
	"minecraft:creeper" : stages.progression1,
	"minecraft:donkey" : stages.progression1,
	"minecraft:dragon_fireball" : stages.progression1,
	"minecraft:egg" : stages.progression1,
	"minecraft:elder_guardian" : stages.progression1,
	"minecraft:ender_crystal" : stages.progression1,
	"minecraft:ender_dragon" : stages.progression1,
	"minecraft:ender_pearl" : stages.progression1,
	"minecraft:enderman" : stages.progression1,
	"minecraft:endermite" : stages.progression1,
	"minecraft:evocation_fangs" : stages.progression1,
	"minecraft:evocation_illager" : stages.progression1,
	"minecraft:eye_of_ender_signal" : stages.progression1,
	"minecraft:falling_block" : stages.progression1,
	"minecraft:fireball" : stages.progression1,
	"minecraft:fireworks_rocket" : stages.progression1,
	"minecraft:furnace_minecart" : stages.progression1,
	"minecraft:ghast" : stages.progression1,
	"minecraft:giant" : stages.progression1,
	"minecraft:hopper_minecart" : stages.progression1,
	"minecraft:horse" : stages.progression1,
	"minecraft:husk" : stages.progression1,
	"minecraft:illusion_illager" : stages.progression1,
	"minecraft:item" : stages.progression1,
	"minecraft:item_frame" : stages.progression1,
	"minecraft:leash_knot" : stages.progression1,
	"minecraft:llama" : stages.progression1,
	"minecraft:llama_spit" : stages.progression1,
	"minecraft:magma_cube" : stages.progression1,
	"minecraft:minecart" : stages.progression1,
	"minecraft:mooshroom" : stages.progression1,
	"minecraft:mule" : stages.progression1,
	"minecraft:ocelot" : stages.progression1,
	"minecraft:painting" : stages.progression1,
	"minecraft:parrot" : stages.progression1,
	"minecraft:pig" : stages.progression1,
	"minecraft:polar_bear" : stages.progression1,
	"minecraft:potion" : stages.progression1,
	"minecraft:rabbit" : stages.progression1,
	"minecraft:sheep" : stages.progression1,
	"minecraft:shulker" : stages.progression1,
	"minecraft:shulker_bullet" : stages.progression1,
	"minecraft:silverfish" : stages.progression1,
	"minecraft:skeleton" : stages.progression1,
	"minecraft:skeleton_horse" : stages.progression1,
	"minecraft:slime" : stages.progression1,
	"minecraft:small_fireball" : stages.progression1,
	"minecraft:snowball" : stages.progression1,
	"minecraft:snowman" : stages.progression1,
	"minecraft:spawner_minecart" : stages.progression1,
	"minecraft:spectral_arrow" : stages.progression1,
	"minecraft:spider" : stages.progression1,
	"minecraft:squid" : stages.progression1,
	"minecraft:stray" : stages.progression1,
	"minecraft:tnt" : stages.progression1,
	"minecraft:tnt_minecart" : stages.progression1,
	"minecraft:vex" : stages.progression1,
	"minecraft:villager" : stages.progression1,
	"minecraft:villager_golem" : stages.progression1,
	"minecraft:vindication_illager" : stages.progression1,
	"minecraft:witch" : stages.progression1,
	"minecraft:wither" : stages.progression1,
	"minecraft:wither_skeleton" : stages.progression1,
	"minecraft:wither_skull" : stages.progression1,
	"minecraft:wolf" : stages.progression1,
	"minecraft:xp_bottle" : stages.progression1,
	"minecraft:xp_orb" : stages.progression1,
	"minecraft:zombie" : stages.progression1,
	"minecraft:zombie_horse" : stages.progression1,
	"minecraft:zombie_pigman" : stages.progression1,
	"minecraft:zombie_villager" : stages.progression1,
	"minecraftfuture:bee" : stages.progression1,
	"minecraftfuture:panda" : stages.progression1,
	"minecraftfuture:trident" : stages.progression1,
	"mowziesmobs:axe_attack" : stages.progression1,
	"mowziesmobs:baby_foliaath" : stages.Locked,
	"mowziesmobs:barako" : stages.Locked,
	"mowziesmobs:barakoan_barakoana" : stages.Locked,
	"mowziesmobs:barakoan_player" : stages.progression1,
	"mowziesmobs:barakoana" : stages.Locked,
	"mowziesmobs:barakoaya" : stages.Locked,
	"mowziesmobs:block_swapper" : stages.progression1,
	"mowziesmobs:boulder" : stages.progression1,
	"mowziesmobs:dart" : stages.progression1,
	"mowziesmobs:ferrous_wroughtnaut" : stages.Locked,
	"mowziesmobs:foliaath" : stages.Locked,
	"mowziesmobs:frostmaw" : stages.Locked,
	"mowziesmobs:frozen_controller" : stages.progression1,
	"mowziesmobs:grottol" : stages.progression1,
	"mowziesmobs:ice_ball" : stages.progression1,
	"mowziesmobs:icebreath" : stages.progression1,
	"mowziesmobs:lantern" : stages.Locked,
	"mowziesmobs:naga" : stages.progression1,
	"mowziesmobs:poison_ball" : stages.progression1,
	"mowziesmobs:ring" : stages.progression1,
	"mowziesmobs:solar_beam" : stages.progression1,
	"mowziesmobs:sunstrike" : stages.progression1,
	"multimob:dummy" : stages.progression1,
	"mutantbeasts:body_part" : stages.progression1,
	"mutantbeasts:chemical_x" : stages.progression1,
	"mutantbeasts:creeper_minion" : stages.progression1,
	"mutantbeasts:creeper_minion_egg" : stages.progression1,
	"mutantbeasts:endersoul_fragment" : stages.progression1,
	"mutantbeasts:mutant_arrow" : stages.Locked,
	"mutantbeasts:mutant_creeper" : stages.Locked,
	"mutantbeasts:mutant_enderman" : stages.Locked,
	"mutantbeasts:mutant_skeleton" : stages.Locked,
	"mutantbeasts:mutant_snow_golem" : stages.Locked,
	"mutantbeasts:mutant_zombie" : stages.Locked,
	"mutantbeasts:skull_spirit" : stages.progression1,
	"mutantbeasts:spider_pig" : stages.Locked,
	"mutantbeasts:throwable_block" : stages.progression1,
	"natura:imp" : stages.Locked,
	"natura:nitrocreeper" : stages.Locked,
	"openblocks:cartographer" : stages.progression1,
	"openblocks:glyph" : stages.progression1,
	"openblocks:golden_eye" : stages.progression1,
	"openblocks:hang_glider" : stages.progression1,
	"openblocks:item_projectile" : stages.progression1,
	"openblocks:luggage" : stages.progression1,
	"openblocks:magnet" : stages.progression1,
	"openblocks:mini_me" : stages.progression1,
	"openblocks:mounted_block" : stages.progression1,
	"openblocks:player_magnet" : stages.progression1,
	"openblocks:xp_orb_no_fly" : stages.progression1,
	"openmods:block" : stages.progression1,
	"psi:spell_charge" : stages.progression1,
	"psi:spell_circle" : stages.progression1,
	"psi:spell_grenade" : stages.progression1,
	"psi:spell_mine" : stages.progression1,
	"psi:spell_projectile" : stages.progression1,
	"quark:archaeologist" : stages.progression1,
	"quark:arrow_ender" : stages.progression1,
	"quark:arrow_explosive" : stages.progression1,
	"quark:arrow_torch" : stages.progression1,
	"quark:ashen" : stages.progression1,
	"quark:chest_passenger" : stages.progression1,
	"quark:colored_item_frame" : stages.progression1,
	"quark:dragon_breath_bottle" : stages.progression1,
	"quark:dweller" : stages.progression1,
	"quark:flat_item_frame" : stages.progression1,
	"quark:foxhound" : stages.progression1,
	"quark:glass_item_frame" : stages.progression1,
	"quark:gravisand" : stages.progression1,
	"quark:leash_knot" : stages.progression1,
	"quark:parrot_egg" : stages.progression1,
	"quark:pickarang" : stages.progression1,
	"quark:pirate" : stages.progression1,
	"quark:seat" : stages.progression1,
	"quark:soul_powder" : stages.progression1,
	"quark:stoneling" : stages.progression1,
	"quark:wraith" : stages.progression1,
	"randomthings:artificialendportal" : stages.progression1,
	"randomthings:eclipsedclock" : stages.progression1,
	"randomthings:fallingblockspecial" : stages.progression1,
	"randomthings:floofireplace" : stages.progression1,
	"randomthings:goldenchicken" : stages.progression1,
	"randomthings:goldenegg" : stages.progression1,
	"randomthings:playersoul" : stages.progression1,
	"randomthings:projecteditem" : stages.progression1,
	"randomthings:revivecircle" : stages.progression1,
	"randomthings:spectreilluminator" : stages.progression1,
	"randomthings:spirit" : stages.Locked,
	"randomthings:thrownweatheregg" : stages.progression1,
	"randomthings:timeaccelerator" : stages.progression1,
	"randomthings:weathercloud" : stages.progression1,
	"redstonearsenal:flux_arrow" : stages.progression1,
	"scalinghealth:blightfire" : stages.progression1,
	"tconstruct:arrow" : stages.progression1,
	"tconstruct:blueslime" : stages.Locked,
	"tconstruct:bolt" : stages.progression1,
	"tconstruct:fancy_frame" : stages.progression1,
	"tconstruct:indestructible" : stages.progression1,
	"tconstruct:shuriken" : stages.progression1,
	"tconstruct:throwball" : stages.progression1,
	"thaumcraft:alumentum" : stages.progression1,
	"thaumcraft:arcanebore" : stages.progression1,
	"thaumcraft:bottletaint" : stages.progression1,
	"thaumcraft:brainyzombie" : stages.progression1,
	"thaumcraft:causalitycollapser" : stages.Thaumcraft1,
	"thaumcraft:cultistcleric" : stages.Thaumcraft1,
	"thaumcraft:cultistknight" : stages.Thaumcraft1,
	"thaumcraft:cultistleader" : stages.Thaumcraft1,
	"thaumcraft:cultistportalgreater" : stages.Thaumcraft1,
	"thaumcraft:cultistportallesser" : stages.Thaumcraft1,
	"thaumcraft:eldritchcrab" : stages.Thaumcraft1,
	"thaumcraft:eldritchgolem" : stages.Thaumcraft1,
	"thaumcraft:eldritchguardian" : stages.Thaumcraft1,
	"thaumcraft:eldritchorb" : stages.Thaumcraft1,
	"thaumcraft:eldritchwarden" : stages.Thaumcraft1,
	"thaumcraft:fallingtaint" : stages.progression1,
	"thaumcraft:firebat" : stages.progression1,
	"thaumcraft:fluxrift" : stages.progression1,
	"thaumcraft:focuscloud" : stages.progression1,
	"thaumcraft:focusmine" : stages.progression1,
	"thaumcraft:focusprojectile" : stages.progression1,
	"thaumcraft:followitem" : stages.progression1,
	"thaumcraft:giantbrainyzombie" : stages.progression1,
	"thaumcraft:golem" : stages.progression1,
	"thaumcraft:golemdart" : stages.progression1,
	"thaumcraft:golemorb" : stages.progression1,
	"thaumcraft:grapple" : stages.progression1,
	"thaumcraft:inhabitedzombie" : stages.progression1,
	"thaumcraft:mindspider" : stages.progression1,
	"thaumcraft:pech" : stages.Thaumcraft1,
	"thaumcraft:specialitem" : stages.Thaumcraft1,
	"thaumcraft:spellbat" : stages.progression1,
	"thaumcraft:taintacle" : stages.progression1,
	"thaumcraft:taintaclegiant" : stages.progression1,
	"thaumcraft:taintacletiny" : stages.progression1,
	"thaumcraft:taintcrawler" : stages.progression1,
	"thaumcraft:taintseed" : stages.progression1,
	"thaumcraft:taintseedprime" : stages.progression1,
	"thaumcraft:taintswarm" : stages.progression1,
	"thaumcraft:thaumslime" : stages.progression1,
	"thaumcraft:turretadvanced" : stages.progression1,
	"thaumcraft:turretbasic" : stages.progression1,
	"thaumcraft:wisp" : stages.Thaumcraft1,
	"thaumicperiphery:magic_arrow" : stages.Thaumcraft1,
	"thermaldynamics:transport" : stages.progression1,
	"thermalexpansion:florb" : stages.progression1,
	"thermalexpansion:morb" : stages.progression1,
	"thermalfoundation:basalz" : stages.Locked,
	"thermalfoundation:basalz_bolt" : stages.Locked,
	"thermalfoundation:blitz" : stages.Locked,
	"thermalfoundation:blitz_bolt" : stages.Locked,
	"thermalfoundation:blizz" : stages.Locked,
	"thermalfoundation:blizz_bolt" : stages.Locked,
};

for entityName, zenStageObject in entityStages
{
	if(zenStageObject.stage != "stage_i")
	{
		mods.MobStages.addStage(zenStageObject.stage, entityName);

		//Stage the Mob Morb
		StageMorb(entityName, zenStageObject);

		//Stage Broken Spawners
		StageBrokenSpawner(entityName, zenStageObject);

		//Stage Soul Vials
		StageSoulVial(entityName, zenStageObject);

		//Stage Spawn Eggs
		StageSpawnEgg(entityName, zenStageObject);
	}
}

print("### Entity Staging Complete ###");
