import loottweaker.vanilla.loot.LootTables;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;
import crafttweaker.item.IItemStack;

print("~~~ Begin Loottweaker Init ~~~");

//Add Nautilus Shell to Fishing Loot table
val fishing = LootTables.getTable("minecraft:gameplay/fishing/treasure").getPool("main");
fishing.addItemEntry(<conduit:nautilus_shell>, 1, 1, "nautilusshell");

//Remove flight staff from reliquary injection
val reliquary_flightstaff = LootTables.getTable("xreliquary:inject/chests/end_city_treasure").getPool("main");
reliquary_flightstaff.removeEntry("xreliquary:rending_gale");

//Remove Interdiction Torch from reliquary injection
val nether_bridge_reliquary = LootTables.getTable("xreliquary:inject/chests/nether_bridge").getPool("main");
nether_bridge_reliquary.removeEntry("xreliquary:interdiction_torch");

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
	pool.removePool("silver_ingot");
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

val enderman = LootTables.getTable("minecraft:entities/enderman"); //Enderman (make enderpearls drop 100% of the time)
enderman.getPool("main").removeEntry("minecraft:ender_pearl"); //Remove main enderpearl entry
enderman.getPool("main").addItemEntryHelper(<minecraft:ender_pearl>, 1, 0, [Functions.parse({
  "count": {
	"min": 1.0,
	"max": 2.0
  },
  "function": "minecraft:looting_enchant"
})], [Conditions.killedByPlayer()], "minecraft:ender_pearl");

print("### Loottweaker Init Complete ###");
