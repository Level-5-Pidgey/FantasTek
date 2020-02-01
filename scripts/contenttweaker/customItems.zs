#priority 500
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

//Create Infused Stone Blocks for Thaumcraft Players
var infused_stone_aer = VanillaFactory.createBlock("infused_stone_aer", <blockmaterial:rock>);
infused_stone_aer.setBlockHardness(10.0);
infused_stone_aer.setBlockResistance(8.0);
infused_stone_aer.setToolClass("pickaxe");
infused_stone_aer.setToolLevel(1);
infused_stone_aer.setBlockSoundType(<soundtype:stone>);
infused_stone_aer.register();

var infused_stone_aqua = VanillaFactory.createBlock("infused_stone_aqua", <blockmaterial:rock>);
infused_stone_aqua.setBlockHardness(5.0);
infused_stone_aqua.setBlockResistance(8.0);
infused_stone_aqua.setToolClass("pickaxe");
infused_stone_aqua.setToolLevel(1);
infused_stone_aqua.setBlockSoundType(<soundtype:stone>);
infused_stone_aqua.register();

var infused_stone_ignis = VanillaFactory.createBlock("infused_stone_ignis", <blockmaterial:rock>);
infused_stone_ignis.setBlockHardness(5.0);
infused_stone_ignis.setBlockResistance(8.0);
infused_stone_ignis.setToolClass("pickaxe");
infused_stone_ignis.setToolLevel(1);
infused_stone_ignis.setBlockSoundType(<soundtype:stone>);
infused_stone_ignis.register();

var infused_stone_ordo = VanillaFactory.createBlock("infused_stone_ordo", <blockmaterial:rock>);
infused_stone_ordo.setBlockHardness(5.0);
infused_stone_ordo.setBlockResistance(8.0);
infused_stone_ordo.setToolClass("pickaxe");
infused_stone_ordo.setToolLevel(1);
infused_stone_ordo.setBlockSoundType(<soundtype:stone>);
infused_stone_ordo.register();

var infused_stone_perditio = VanillaFactory.createBlock("infused_stone_perditio", <blockmaterial:rock>);
infused_stone_perditio.setBlockHardness(5.0);
infused_stone_perditio.setBlockResistance(8.0);
infused_stone_perditio.setToolClass("pickaxe");
infused_stone_perditio.setToolLevel(1);
infused_stone_perditio.setBlockSoundType(<soundtype:stone>);
infused_stone_perditio.register();

var infused_stone_terra = VanillaFactory.createBlock("infused_stone_terra", <blockmaterial:rock>);
infused_stone_terra.setBlockHardness(5.0);
infused_stone_terra.setBlockResistance(8.0);
infused_stone_terra.setToolClass("pickaxe");
infused_stone_terra.setToolLevel(1);
infused_stone_terra.setBlockSoundType(<soundtype:stone>);
infused_stone_terra.register();

var infused_stone_vitium = VanillaFactory.createBlock("infused_stone_vitium", <blockmaterial:rock>);
infused_stone_vitium.setBlockHardness(5.0);
infused_stone_vitium.setBlockResistance(8.0);
infused_stone_vitium.setToolClass("pickaxe");
infused_stone_vitium.setToolLevel(1);
infused_stone_vitium.setBlockSoundType(<soundtype:stone>);
infused_stone_vitium.register();
