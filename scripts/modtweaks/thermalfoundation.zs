
print("~~~ Begin Thermal Foundation Init ~~~");

//Simple Recipe Changes for crafting bench
val thermalCraftingBenchRecipes = {
	<thermalfoundation:material:657> : [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotIron>, <ore:gearCrudeSteel>, <ore:ingotIron>], [null, <ore:ingotIron>, <ore:ingotIron>]],
	<thermaldynamics:duct_0> * 16 : [[<ore:dustRedstone>, <ore:paneGlassColorless> | <ore:blockGlass>, <ore:dustRedstone>], [<ore:dustElectrotine>, <ore:dustElectrotine>, <ore:dustElectrotine>], [<ore:dustRedstone>, <ore:paneGlassColorless> | <ore:blockGlass>, <ore:dustRedstone>]],
	<thermalfoundation:material:656> : [[null, <ore:ingotIron>, null], [<ore:ingotIron>, <ore:gearCrudeSteel>, <ore:ingotIron>], [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in thermalCraftingBenchRecipes {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Easter egg tooltip for capacitors
scripts.helpers.AddTooltip(<thermalexpansion:capacitor:*>, ["It contains 1.21 gigawatts!", "You can take this thing all sorts of places..."]);

//Post Stage 1 Saw Blade
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<thermalfoundation:material:657>), scripts.helpers.stages.progression2.stage, <thermalfoundation:material:657>, [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotIron>, <ore:gearSteel>, <ore:ingotIron>], [null, <ore:ingotIron>, <ore:ingotIron>]]);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<thermalfoundation:material:656>), scripts.helpers.stages.progression2.stage, <thermalfoundation:material:657>, [[null, <ore:ingotIron>, null], [<ore:ingotIron>, <ore:gearSteel>, <ore:ingotIron>], [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>]]);

print("### Thermal Foundation Init Complete ###");
