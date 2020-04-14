
print("~~~ Begin Thaumcraft Init ~~~");

//Hide Iron Plate (since it has no recipes)
scripts.helpers.unstageAndHide(<thaumcraft:plate:1>);

//Thaumonomicon First Recipe
recipes.addShapeless(scripts.helpers.createRecipeName(<thaumcraft:thaumonomicon>), <thaumcraft:thaumonomicon>, [<ore:book>, <thaumcraft:shimmerleaf> | <thaumcraft:cinderpearl> | <thaumcraft:vishroom>]);

print("### Thaumcraft Init Complete ###");
