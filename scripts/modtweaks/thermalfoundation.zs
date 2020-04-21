
print("~~~ Begin Thermal Foundation Init ~~~");

//Simple Recipe Changes for crafting bench
val thermalCraftingBenchRecipes = {
	<thermalfoundation:material:657> : [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotIron>, <ore:gearSteel>, <ore:ingotIron>], [null, <ore:ingotIron>, <ore:ingotIron>]]
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in thermalCraftingBenchRecipes {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

print("### Thermal Foundation Init Complete ###");
