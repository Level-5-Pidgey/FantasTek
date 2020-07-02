import loottweaker.vanilla.loot.LootTables;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;
import crafttweaker.item.IItemStack;

print("~~~ Begin Loottweaker Init ~~~");

//Change up the treasure fishing loot table with gems and money (oooh!)
val fishing = LootTables.getTable("minecraft:gameplay/fishing/treasure").getPool("main");
fishing.addItemEntry(<conduit:nautilus_shell>, 1, 1, "nautilusshell");
fishing.removeEntry("minecraft:bow");
fishing.removeEntry("minecraft:fishing_rod");
fishing.removeEntry("minecraft:book");
fishing.removeEntry("minecraft:waterlily");
fishing.removeEntry("minecraft:name_tag");
fishing.removeEntry("minecraft:saddle");

val fishingTreasure as int[crafttweaker.item.IItemStack] = {
	<minecraft:diamond> : 10,
	<minecraft:prismarine_crystals> : 18,
	<minecraft:prismarine_shard> : 18,
	<thaumcraft:cluster:7> : 6,
	<thaumcraft:cluster:1> : 6,
	<thaumcraft:cluster> : 6,
	<biomesoplenty:gem:1> : 10,
	<biomesoplenty:gem:2> : 10,
	<biomesoplenty:gem:3> : 10,
	<minecraft:glowstone_dust> : 20,
	<minecraft:emerald> : 12,
	<minecraft:bone> : 25,
	<minecraft:experience_bottle> : 20,
	<minecraft:blaze_powder> : 15,
	<biomesoplenty:gem:4> : 10,
	<biomesoplenty:gem:5> : 10,
	<biomesoplenty:gem:6> : 10,
	<biomesoplenty:gem:7> : 10,
	<minecraft:coal> : 20,
	<minecraft:slime_ball> : 10,
	<minecraft:totem_of_undying> : 5,
	<contenttweaker:currency_4> : 30,
	<contenttweaker:currency_20> : 20,
	<contenttweaker:currency_100> : 10,
	<conduit:nautilus_shell> : 10,
	<minecraft:waterlily> : 25,
	<minecraft:name_tag> : 20,
	<minecraft:saddle> : 15,
	<contenttweaker:strange_treasure> : 5
};

for key, value in fishingTreasure {
	fishing.addItemEntry(key, value as int, key.name);
}


//Remove flight staff from reliquary injection
val reliquary_flightstaff = LootTables.getTable("xreliquary:inject/chests/end_city_treasure").getPool("main");
reliquary_flightstaff.removeEntry("xreliquary:rending_gale");

//Remove Interdiction Torch from reliquary injection
val nether_bridge_reliquary = LootTables.getTable("xreliquary:inject/chests/nether_bridge").getPool("main");
nether_bridge_reliquary.removeEntry("xreliquary:interdiction_torch");
nether_bridge_reliquary.removeEntry("xreliquary:void_tear");
nether_bridge_reliquary.removeEntry("xreliquary:salamander_eye");

//Remove some Treasures and Potions from the Nether Bridge Loot Table
LootTables.getTable("minecraft:chests/nether_bridge").removePool("bountifulbaubles_nether_bridge_2");

//Remove Void Tears from the Stronghold Corridor Loot Table
LootTables.getTable("xreliquary:injectchests/stronghold_crossing").getPool("main").removeEntry("xreliquary:shears_of_winter");

val simple_dungeon = LootTables.getTable("minecraft:chests/simple_dungeon").getPool("pool1");

//Remove EnderIO pools
val EnderIOGen =
	[
		LootTables.getTable("enderio:chests/abandoned_mineshaft"),
		LootTables.getTable("enderio:chests/desert_pyramid"),
		LootTables.getTable("enderio:chests/end_city_treasure"),
		LootTables.getTable("enderio:chests/igloo_chest"),
		LootTables.getTable("enderio:chests/jungle_temple"),
		LootTables.getTable("enderio:chests/jungle_temple_dispenser"),
		LootTables.getTable("enderio:chests/nether_bridge"),
		LootTables.getTable("enderio:chests/simple_dungeon"),
		LootTables.getTable("enderio:chests/village_blacksmith"),
		LootTables.getTable("enderio:chests/woodland_mansion"),
		//Minecraft injected tables
		LootTables.getTable("minecraft:chests/abandoned_mineshaft"),
		LootTables.getTable("minecraft:chests/desert_pyramid"),
		LootTables.getTable("minecraft:chests/end_city_treasure"),
		LootTables.getTable("minecraft:chests/igloo_chest"),
		LootTables.getTable("minecraft:chests/jungle_temple"),
		LootTables.getTable("minecraft:chests/jungle_temple_dispenser"),
		LootTables.getTable("minecraft:chests/nether_bridge"),
		LootTables.getTable("minecraft:chests/simple_dungeon"),
		LootTables.getTable("minecraft:chests/village_blacksmith"),
		LootTables.getTable("minecraft:chests/woodland_mansion")
	] as LootTable[];

for pool in EnderIOGen {
	pool.removePool("Ender IO");
}

//Stop Dimlet Parcels from generating
val DimletParcelGen =
[
	LootTables.getTable("minecraft:chests/abandoned_mineshaft"),
	LootTables.getTable("minecraft:chests/desert_pyramid"),
	LootTables.getTable("minecraft:chests/igloo_chest"),
	LootTables.getTable("minecraft:chests/jungle_temple"),
	LootTables.getTable("minecraft:chests/nether_bridge"),
	LootTables.getTable("minecraft:chests/simple_dungeon"),
	LootTables.getTable("minecraft:chests/village_blacksmith")
] as LootTable[];

for pool in DimletParcelGen {
	pool.getPool("main").removeEntry("rftoolsdim:parcel");
}

//Remove Silver Nuggets/Ingots
val IceAndFireGen =
	[
		LootTables.getTable("minecraft:chests/abandoned_mineshaft"),
		LootTables.getTable("minecraft:chests/desert_pyramid"),
		LootTables.getTable("minecraft:chests/igloo_chest"),
		LootTables.getTable("minecraft:chests/jungle_temple"),
		LootTables.getTable("minecraft:chests/stronghold_corridor"),
		LootTables.getTable("minecraft:chests/stronghold_crossing"),
		LootTables.getTable("minecraft:chests/village_blacksmith"),
		LootTables.getTable("minecraft:chests/woodland_mansion")
	] as LootTable[];

for pool in IceAndFireGen {
	//pool.removePool("silver_ingot");
}

//Remove Botania Loots
val BotaniaGen =
	[
		LootTables.getTable("botania:inject/simple_dungeon"),
		LootTables.getTable("botania:inject/stronghold_corridor")
	] as LootTable[];

for pool in BotaniaGen {
	pool.getPool("main").removeEntry("botania:manaResource");
}

//Remove Mom's Spaghetti
val TConGen =
	[
		LootTables.getTable("minecraft:chests/desert_pyramid"),
		LootTables.getTable("minecraft:chests/jungle_temple"),
		LootTables.getTable("minecraft:chests/stronghold_crossing"),
	] as LootTable[];

for pool in TConGen {
	pool.removePool("moms_spaghetti");
}

LootTables.getTable("botania:inject/simple_dungeon").getPool("main").removeEntry("botania:lexicon"); //Remove Lexica Botania
LootTables.getTable("botania:inject/simple_dungeon").getPool("main").removeEntry("botania:manaBottle"); //Remove Mana Bottles from appearing too

//Add bottled Ender Air to End Loot Tables
LootTables.getTable("minecraft:chests/end_city_treasure").getPool("main").addItemEntry(<botania:manaresource:15>, 13, 1, "enderair");

//Monsters
val witherSkeleton = LootTables.getTable("minecraft:entities/wither_skeleton"); //Wither Skeleton (remove extra bones, remove drops of evil)
witherSkeleton.removePool("xuLootDropOfEvil");

val witch = LootTables.getTable("minecraft:entities/witch").getPool("main");
witch.removeEntry("minecraft:glowstone_dust");
witch.removeEntry("minecraft:redstone");
witch.removeEntry("minecraft:spider_eye");
witch.removeEntry("minecraft:gunpowder");
witch.removeEntry("minecraft:stick");
witch.addItemEntryHelper(<minecraft:experience_bottle>, 2, 0, [Functions.lootingEnchantBonus(0, 1, 0), Functions.setCount(1, 2)], [Conditions.killedByPlayer()], "minecraft:experience_bottle");
witch.addItemEntryHelper(<inspirations:materials:2>, 4, 0, [Functions.lootingEnchantBonus(0, 1, 0), Functions.setCount(1, 2)], [Conditions.killedByPlayer()], "inspirations:materials:2");
witch.addItemEntryHelper(<inspirations:materials:3>, 1, 0, [Functions.lootingEnchantBonus(0, 1, 0), Functions.setCount(1, 2)], [Conditions.killedByPlayer()], "inspirations:materials:3");
witch.addItemEntryHelper(<minecraft:quartz>, 2, 0, [Functions.lootingEnchantBonus(0, 1, 0), Functions.setCount(0, 4)], [Conditions.killedByPlayer()], "minecraft:quartz");

val enderman = LootTables.getTable("minecraft:entities/enderman"); //Enderman (make enderpearls drop 100% of the time)
enderman.getPool("main").removeEntry("minecraft:ender_pearl"); //Remove main enderpearl entry
enderman.getPool("main").addItemEntryHelper(<minecraft:ender_pearl>, 1, 0, [Functions.lootingEnchantBonus(0, 1, 0)], [Conditions.killedByPlayer()], "minecraft:ender_pearl");

//Make Astral Sorcery chests not generate Aquamarine/Constellation Papers
val shrineChest = LootTables.getTable("astralsorcery:chest_shrine").getPool("astralsorcery:chest_shrine");
val astralShrineChestPools =
	[
		"astralsorcery:itemconstellationpaper",
		"astralsorcery:itemcraftingcomponent"
	] as string[];

for pool in astralShrineChestPools
{
	shrineChest.removeEntry(pool);
}

LootTables.getTable("minecraft:chests/desert_pyramid").getPool("main").removeEntry("astralsorcery:constellation_paper");
LootTables.getTable("minecraft:chests/igloo_chest").getPool("main").removeEntry("astralsorcery:constellation_paper");
LootTables.getTable("minecraft:chests/jungle_temple").getPool("main").removeEntry("astralsorcery:constellation_paper");
LootTables.getTable("minecraft:chests/stronghold_library").getPool("main").removeEntry("astralsorcery:constellation_paper");

//Random Things Summoning Pendulum
LootTables.getTable("minecraft:chests/simple_dungeon").removePool("summoningpendulum");
LootTables.getTable("minecraft:chests/stronghold_corridor").removePool("summoningpendulum");

//bountifulbaubles loot pools
LootTables.getTable("minecraft:chests/simple_dungeon").removePool("bountifulbaubles_dungeon");
LootTables.getTable("minecraft:chests/simple_dungeon").removePool("bountifulbaubles_dungeon_potions");

//Spectre Coils
LootTables.getTable("minecraft:chests/simple_dungeon").removePool("spectrecoil_number");
LootTables.getTable("minecraft:chests/abandoned_mineshaft").removePool("spectrecoil_number");
LootTables.getTable("minecraft:chests/end_city_treasure").removePool("spectrecoil_number");

//Make Many Dungeon Chests Generate with Botania Cosmetics
val botaniaCosmetics as int[][string] = {
	"minecraft:chests/abandoned_mineshaft" : [0, 12, 24],
	"minecraft:chests/desert_pyramid" : [1, 13, 25],
	"minecraft:chests/end_city_treasure" : [2, 14, 26],
	"minecraft:chests/igloo_chest" : [3, 15, 27],
	"minecraft:chests/jungle_temple" : [4, 16, 28],
	"minecraft:chests/nether_bridge" : [6, 18, 30],
	"minecraft:chests/simple_dungeon" : [7, 19, 31],
	"minecraft:chests/village_blacksmith" : [8, 20, 32],
	"minecraft:chests/woodland_mansion" : [9, 21, 5],
	"astralsorcery:chest_shrine" : [10, 22, 17],
	"quark:chests/pirate_chest" : [11, 23, 29]
};

for lootTable, metadataIntegerArray in botaniaCosmetics {
	var lootPool = LootTables.getTable(lootTable).addPool("cosmetics", 1, 2, 0, 1);
	lootPool.addEmptyEntry(60, "emptyCosmetic");

	for metadataInteger in metadataIntegerArray
	{
		var cosmeticItemStack as crafttweaker.item.IItemStack = <botania:cosmetic>.definition.makeStack(metadataInteger);
		lootPool.addItemEntry(cosmeticItemStack, 5, cosmeticItemStack.name);
	}
}

//Change Champion Mob Pool Drops
var championPool = LootTables.getTable("champions:champion_loot");
championPool.getPool("tier#1").removeEntry("minecraft:book");
championPool.getPool("tier#1").addItemEntryHelper(<contenttweaker:champion_token_1>, 1, 0, [], [Conditions.parse({
"condition": "minecraft:entity_properties",
"entity": "this",
"properties": {
  "champions:is_champion": {
	"tier": 1
  }
}
}), Conditions.killedByPlayer()]);

championPool.getPool("tier#2").removeEntry("minecraft:book");
championPool.getPool("tier#2").addItemEntryHelper(<contenttweaker:champion_token_2>, 1, 0, [], [Conditions.parse({
"condition": "minecraft:entity_properties",
"entity": "this",
"properties": {
  "champions:is_champion": {
	"tier": 2
  }
}
}), Conditions.killedByPlayer()]);

championPool.getPool("tier#3").removeEntry("minecraft:book");
championPool.getPool("tier#3").addItemEntryHelper(<contenttweaker:champion_token_3>, 1, 0, [], [Conditions.parse({
"condition": "minecraft:entity_properties",
"entity": "this",
"properties": {
  "champions:is_champion": {
	"tier": 3
  }
}
}), Conditions.killedByPlayer()]);

championPool.getPool("tier#4").removeEntry("minecraft:book");
championPool.getPool("tier#4").addItemEntryHelper(<contenttweaker:champion_token_4>, 1, 0, [], [Conditions.parse({
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "properties": {
	"champions:is_champion": {
	  "tier": 4
	}
  }
}), Conditions.killedByPlayer()]);

//Remove Bountiful Baubles Nether Loot Table
LootTables.getTable("minecraft:chests/nether_bridge").removePool("bountifulbaubles_nether_bridge");

//Add Treasures to Dungeon Loot
val dungeonBaublesAndTreasures as crafttweaker.item.IItemStack[][string] = {
	"minecraft:chests/abandoned_mineshaft" : [<xreliquary:lantern_of_paranoia>],
	"minecraft:chests/desert_pyramid" : [<xreliquary:midas_touchstone>, <bountifulbaubles:trinketmagiclenses>, <contenttweaker:strange_treasure>],
	"minecraft:chests/end_city_treasure" : [<xreliquary:rod_of_lyssa>, <xreliquary:ender_staff>, <xreliquary:destruction_catalyst>, <bountifulbaubles:wormholemirror>],
	"minecraft:chests/igloo_chest" : [<xreliquary:ice_magus_rod>, <xreliquary:glacial_staff>],
	"minecraft:chests/jungle_temple" : [<xreliquary:serpent_staff>, <xreliquary:harvest_rod>, <bountifulbaubles:magicmirror>, <contenttweaker:strange_treasure>],
	"minecraft:chests/nether_bridge" : [<xreliquary:salamander_eye>, <xreliquary:pyromancer_staff>, <xreliquary:infernal_tear>, <xreliquary:infernal_claws>, <xreliquary:infernal_chalice>, <bountifulbaubles:trinketobsidianskull>],
	"minecraft:chests/simple_dungeon" : [<xreliquary:phoenix_down>, <xreliquary:magicbane>, <xreliquary:gun_part>, <xreliquary:gun_part:1>, <xreliquary:gun_part:2>, <bountifulbaubles:shieldcobalt>, <contenttweaker:strange_treasure>],
	"minecraft:chests/village_blacksmith" : [<bountifulbaubles:amuletsinpride>, <bountifulbaubles:amuletsingluttony>],
	"minecraft:chests/woodland_mansion" : [<xreliquary:sojourner_staff>, <bountifulbaubles:trinketbrokenheart>],
	"astralsorcery:chest_shrine" : [<xreliquary:mercy_cross>, <xreliquary:kraken_shell>, <xreliquary:angelic_feather>,
	<bountifulbaubles:amuletcross>],
	"quark:chests/pirate_chest" : [<xreliquary:fortune_coin>, <xreliquary:emperor_chalice>, <bountifulbaubles:amuletsinempty>, <bountifulbaubles:amuletsinwrath>]
};

for lootTable, dungeonTreasures in dungeonBaublesAndTreasures {
	var lootPool = LootTables.getTable(lootTable).addPool("treasure_accessories", 1, 1, 0, 1);
	lootPool.addEmptyEntry(60, "emptyTreasure");

	for dungeonTreasure in dungeonTreasures
	{
		lootPool.addItemEntry(dungeonTreasure, 1, 0, dungeonTreasure.name);
	}
}

//Nerf Witch Farming


print("### Loottweaker Init Complete ###");
