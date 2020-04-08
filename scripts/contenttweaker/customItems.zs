#priority 500
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.Commands;
import mods.contenttweaker.IItemFoodEaten;
import mods.contenttweaker.ItemFood;

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

//Sanguine Ingot
var sanguine_ingot = VanillaFactory.createItem("sanguine_ingot");
sanguine_ingot.register();

//Sanguine Gem
var sanguine_gem = VanillaFactory.createItem("sanguine_gem");
sanguine_gem.register();

//Elemental Sanguine Gems
var sanguine_gem_fire = VanillaFactory.createItem("sanguine_gem_fire");
sanguine_gem_fire.rarity = "UNCOMMON";
sanguine_gem_fire.register();

var sanguine_gem_water = VanillaFactory.createItem("sanguine_gem_water");
sanguine_gem_water.rarity = "UNCOMMON";
sanguine_gem_water.register();

var sanguine_gem_air = VanillaFactory.createItem("sanguine_gem_air");
sanguine_gem_air.rarity = "UNCOMMON";
sanguine_gem_air.register();

var sanguine_gem_earth = VanillaFactory.createItem("sanguine_gem_earth");
sanguine_gem_earth.rarity = "UNCOMMON";
sanguine_gem_earth.register();

//Thaumcraft Elemental Dusts
var salis_mundus_fire = VanillaFactory.createItem("salis_mundus_fire");
salis_mundus_fire.rarity = "UNCOMMON";
salis_mundus_fire.register();

var salis_mundus_water = VanillaFactory.createItem("salis_mundus_water");
salis_mundus_water.rarity = "UNCOMMON";
salis_mundus_water.register();

var salis_mundus_air = VanillaFactory.createItem("salis_mundus_air");
salis_mundus_air.rarity = "UNCOMMON";
salis_mundus_air.register();

var salis_mundus_earth = VanillaFactory.createItem("salis_mundus_earth");
salis_mundus_earth.rarity = "UNCOMMON";
salis_mundus_earth.register();

//Embers Elemental Ember Crystals
var crystal_ember_fire = VanillaFactory.createItem("crystal_ember_fire");
crystal_ember_fire.rarity = "UNCOMMON";
crystal_ember_fire.register();

var crystal_ember_water = VanillaFactory.createItem("crystal_ember_water");
crystal_ember_water.rarity = "UNCOMMON";
crystal_ember_water.register();

var crystal_ember_air = VanillaFactory.createItem("crystal_ember_air");
crystal_ember_air.rarity = "UNCOMMON";
crystal_ember_air.register();

var crystal_ember_earth = VanillaFactory.createItem("crystal_ember_earth");
crystal_ember_earth.rarity = "UNCOMMON";
crystal_ember_earth.register();

//Champion Kill Tokens
var champion_token_1 = VanillaFactory.createItem("champion_token_1");
champion_token_1.rarity = "COMMON";
champion_token_1.register();
var champion_token_2 = VanillaFactory.createItem("champion_token_2");
champion_token_2.rarity = "UNCOMMON";
champion_token_2.register();
var champion_token_3 = VanillaFactory.createItem("champion_token_3");
champion_token_3.rarity = "RARE";
champion_token_3.register();
var champion_token_4 = VanillaFactory.createItem("champion_token_4");
champion_token_4.rarity = "EPIC";
champion_token_4.register();

//Custom Food Items
val foodStrings as double[][string] =
{
	"vegemite" : [8.0, 0.8],
	"vegemite_sandwich" : [8.0, 0.8],
	"sushi" : [8.0, 0.8],
	"steak_and_chips" : [8.0, 0.8],
	"pocky" : [8.0, 0.8],
	"meat_pie" : [8.0, 0.8],
	"honey_sandwich" : [8.0, 0.8],
	"fairy_bread" : [8.0, 0.8],
	"chocolate" : [8.0, 0.8]
};

for foodName, foodRestorationArray in foodStrings {
	var foodItem = VanillaFactory.createItemFood(foodName, foodRestorationArray[0]);
	foodItem.saturation = foodRestorationArray[1];

	//Apply potion effects if some types of food are consumed
	if(foodName == "chocolate")
	{
		foodItem.onItemFoodEaten = function(stack, world, player)
		{
			if(!world.isRemote())
			{
				player.addPotionEffect(<potion:minecraft:swiftness>.makePotionEffect(45, 1));
			}
		};
	}

	if(foodName == "fairy_bread")
	{
		foodItem.onItemFoodEaten = function(stack, world, player)
		{
			if(!world.isRemote())
			{
				player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(10, 3));
			}
		};
	}

	foodItem.register();
}
