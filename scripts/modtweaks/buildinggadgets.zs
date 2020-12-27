
print("~~~ Begin Building Gadgets Init ~~~");

val buildingGadgetsRecipes_CRAFTINGTABLE = {
	//motor as crafttweaker.item.IItemStack * 4 : [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotRedstoneAlloy>, <ore:dustRedstone>, <ore:ingotCrudeSteel>], [<ore:ingotIron>, <ore:ingotIron>, null]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in buildingGadgetsRecipes_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

val buildingGadgetsRecipes_CARPENTER = {
	<buildinggadgets:buildingtool> : [[<ore:ironIngot>, <ore:dustElectrotine>, <ore:ironIngot>], [<ore:gearDiamond>, <ore:dustElectrotine>, <ore:gearDiamond>], [<ore:ironIngot>, <ore:plateLapis>, <ore:ironIngot>]],
	<buildinggadgets:exchangertool> : [[<ore:ironIngot>, <ore:dustElectrotine>, <ore:ironIngot>], [<ore:dustElectrotine>, <ore:gearLapis>, <ore:dustElectrotine>], [<ore:ironIngot>, <ore:gearLapis>, <ore:ironIngot>]],
	<buildinggadgets:copypastetool> : [[<ore:ingotIron>, <ore:dustElectrotine>, <ore:ingotIron>], [<ore:gearEmerald>, <ore:dustElectrotine>, <ore:gearEmerald>], [<ore:ingotIron>, <ore:plateLapis>, <ore:ingotIron>]],
	<buildinggadgets:templatemanager> : [[<ore:ingotIron>, <ore:gearGold>, <ore:ingotIron>], [<ore:gemEmerald>, <ore:gemEmerald>, <ore:gemEmerald>], [<ore:ingotIron>, <ore:gearGold>, <ore:ingotIron>]],
	<buildinggadgets:destructiontool> : [[<ore:gearGold>, scripts.helpers.CircuitTiers[0], <ore:gearGold>], [<ore:plateDiamond>, <minecraft:tnt>, <ore:plateDiamond>], [<ore:gearGold>, scripts.helpers.CircuitTiers[0], <ore:gearGold>]]
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in buildingGadgetsRecipes_CARPENTER {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
	mods.forestry.Carpenter.addRecipe(key, value, 200, <liquid:water> * 1000);
}

print("### Building Gadgets Init Complete ###");