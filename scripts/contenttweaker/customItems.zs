#priority 100
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.Commands;

//Life Ingot
var lifeingot = VanillaFactory.createItem("lifeingot");
lifeingot.maxStackSize = 64;
lifeingot.rarity = "UNCOMMON";
lifeingot.register();

//Coal Coke Dust
var cokeDust = VanillaFactory.createItem("coke_dust");
cokeDust.register();

//Steel Blend
var steelBlend = VanillaFactory.createItem("steel_blend");
steelBlend.register();
