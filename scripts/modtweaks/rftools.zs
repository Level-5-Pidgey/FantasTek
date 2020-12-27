
print("~~~ Begin RFTools Init ~~~");

val rftoolsRecipes_CRAFTINGTABLE = {
	//motor as crafttweaker.item.IItemStack * 4 : [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotRedstoneAlloy>, <ore:dustRedstone>, <ore:ingotCrudeSteel>], [<ore:ingotIron>, <ore:ingotIron>, null]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in rftoolsRecipes_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

val rftoolsRecipes_EXTENDEDCRAFTING = {
	<rftools:elevator> : [[<ore:ingotConductiveIron>, <ore:enderpearl>, <ore:ingotConductiveIron>], [<ore:ingotConductiveIron>, scripts.helpers.CircuitTiers[0], <ore:ingotConductiveIron>], [<ore:ingotConductiveIron>, <ore:ingotPulsatingIron>, <ore:ingotConductiveIron>]],
	<rftools:item_filter> : [[<ore:paper>, <minecraft:chest>, <ore:paper>], [<ore:dustRedstone>, scripts.helpers.CircuitTiers[0], <ore:dustRedstone>], [<ore:paper>, <minecraft:redstone_torch>, <ore:paper>]],
	<rftools:screen_controller> : [[<ore:dustRedstone>, <ore:enderpearl>, <ore:dustRedstone>], [<ore:blockGlassColorless>, scripts.helpers.CircuitTiers[0], <ore:blockGlassColorless>], [<ore:dustRedstone>, <ore:blockGlassColorless>, <ore:dustRedstone>]],
	<rftools:screen> : [[<ore:blockGlassColorless>, <ore:nuggetIron>, <ore:blockGlassColorless>], [<ore:blockGlassColorless>, <ore:gearPulsatingIron>, <ore:blockGlassColorless>], [<ore:blockGlassColorless>, <ore:nuggetIron>, <ore:blockGlassColorless>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in rftoolsRecipes_EXTENDEDCRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

print("### RFTools Init Complete ###");
