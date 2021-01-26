
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
	<rftools:modular_storage> : [[<ore:plateRedstoneAlloy>, <ore:chestWood>, <ore:plateRedstoneAlloy>], [<minecraft:shulker_shell>, scripts.helpers.FrameTiers[0], <minecraft:shulker_shell>], [<ore:plateRedstoneAlloy>, <ore:chestWood>, <ore:plateRedstoneAlloy>]],
	<rftools:storage_module> : [[null, scripts.helpers.CircuitTiers[0], null], [<ore:ingotGold>, <ore:gearIron>, <ore:ingotGold>], [<ore:gemQuartz>, scripts.helpers.CircuitTiers[0], <ore:gemQuartz>]],
	<rftools:storage_module:1> : [[null, <minecraft:shulker_shell>, null], [<ore:plateGold>, <rftools:storage_module>, <ore:plateGold>], [<ore:gearQuartz>, <ore:chestWood>, <ore:gearQuartz>]],
	<rftools:storage_module:2> : [[<ore:plateRedstoneAlloy>, <minecraft:shulker_shell>, <ore:plateRedstoneAlloy>], [<minecraft:shulker_shell>, <rftools:storage_module:1>, <minecraft:shulker_shell>], [<ore:plateQuartz>, <minecraft:shulker_shell>, <ore:plateQuartz>]],
	<rftools:storage_control_module> : [[null, <ore:workbench>, null], [<ore:dustRedstone>, <ore:ingotIron>, <ore:dustRedstone>], [null, <ore:dyeBlack>, null]],
	<rftools:dump_module> : [[null, <ore:buttonWood>, null], [<ore:dustRedstone>, <ore:ingotIron>, <ore:dustRedstone>], [null, <ore:dyeBlack>, null]],
	<rftools:storage_scanner> : [[<ore:enderpearl>, scripts.helpers.CircuitTiers[0], <ore:paper>], [<ore:plateGold>, scripts.helpers.FrameTiers[0], <ore:plateGold>], [<ore:paper>, scripts.helpers.CircuitTiers[0], <ore:enderpearl>]],
	<rftools:storage_terminal> : [[<ore:paper>, <ore:blockGlassColorless>, <ore:enderpearl>], [<ore:blockGlassColorless>, scripts.helpers.FrameTiers[0], <ore:blockGlassColorless>], [<ore:enderpearl>, scripts.helpers.CircuitTiers[0], <ore:paper>]],
	//<rftools:storage_module_tablet> : [[scripts.helpers.CircuitTiers[1], <ore:ingotSteel>, <ore:enderpearl>], [<ore:ingotSteel>, scripts.helpers.FrameTiers[0], <ore:ingotSteel>], [<ore:enderpearl>, <ore:ingotSteel>, scripts.helpers.CircuitTiers[1]]],
	<rftools:storage_module:6> : [[<extendedcrafting:material:49>, <minecraft:shulker_shell>, <extendedcrafting:material:49>], [scripts.helpers.CircuitTiers[1], scripts.helpers.FrameTiers[0], scripts.helpers.CircuitTiers[1]], [<extendedcrafting:material:49>, <minecraft:shulker_shell>, <extendedcrafting:material:49>]],
	<rftools:storage_terminal> : [[<extendedcrafting:material:36>, <ore:blockGlassColorless>, <extendedcrafting:material:36>], [<ore:blockGlassColorless>, scripts.helpers.FrameTiers[0], <ore:blockGlassColorless>], [<extendedcrafting:material:36>, <ore:blockGlassColorless>, <extendedcrafting:material:36>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in rftoolsRecipes_EXTENDEDCRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

//Extended Crafting Recipes (T2 Table)
val rfTools_EXTENDEDCRAFTING_T2 = {
	<rftools:remote_storage>	:	[[<ore:ingotSteel>, <ore:gearSignalum>, <ore:ingotSteel>],
									[<ore:ingotSteel>, <rftools:modular_storage>, <ore:ingotSteel>],
									[<ore:ingotSteel>, <ore:gearSignalum>, <ore:ingotSteel>],
									[<ore:enderpearl>, <extendedcrafting:material:49>, scripts.helpers.CircuitTiers[1]]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in rfTools_EXTENDEDCRAFTING_T2 {
	recipes.remove(key.withAmount(1));
	scripts.helpers.createAdvancedCraftingRecipe(key, value, value[3][0], value[3][1], value[3][2], "", true);
}


print("### RFTools Init Complete ###");
