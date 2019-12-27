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
