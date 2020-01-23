#priority 100
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.Commands;

//Life Ingot
var lifeingot = VanillaFactory.createItem("lifeingot");
lifeingot.rarity = "UNCOMMON";
lifeingot.register();

//Coal Coke Dust
var cokeDust = VanillaFactory.createItem("coke_dust");
cokeDust.register();

//Steel Blend
var steelBlend = VanillaFactory.createItem("steel_blend");
steelBlend.register();

//Wooden Plate
var woodPlate = VanillaFactory.createItem("wood_plate");
woodPlate.register();

//Strange Treasure
var strangeTreasure = VanillaFactory.createItem("strange_treasure");
strangeTreasure.maxStackSize = 1;
strangeTreasure.rarity = "RARE";
strangeTreasure.register();

//Astral Sorcery Elemental Crystals
var astral_crystal_air = VanillaFactory.createItem("astral_crystal_air"); //Air
astral_crystal_air.rarity = "UNCOMMON";
astral_crystal_air.register();

var astral_crystal_earth = VanillaFactory.createItem("astral_crystal_earth"); //Earth
astral_crystal_earth.rarity = "UNCOMMON";
astral_crystal_earth.register();

var astral_crystal_fire = VanillaFactory.createItem("astral_crystal_fire"); //Fire
astral_crystal_fire.rarity = "UNCOMMON";
astral_crystal_fire.register();

var astral_crystal_water = VanillaFactory.createItem("astral_crystal_water"); //Water
astral_crystal_water.rarity = "UNCOMMON";
astral_crystal_water.register();

//Prismarine Nugget
var prismarine_nugget = VanillaFactory.createItem("prismarine_nugget"); //Water
prismarine_nugget.register();

//Sealed Wooden Plate
var sealedWoodPlate = VanillaFactory.createItem("sealed_wood_plate");
sealedWoodPlate.register();
