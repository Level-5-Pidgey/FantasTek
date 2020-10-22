
print("~~~ Begin Thaumcraft Init ~~~");

//Hide Iron Plate (since it has no recipes)
scripts.helpers.unstageAndHide(<thaumcraft:plate:1>);

//Thaumonomicon First Recipe
recipes.addShapeless(scripts.helpers.createRecipeName(<thaumcraft:thaumonomicon>), <thaumcraft:thaumonomicon>, [<ore:book>, <thaumcraft:shimmerleaf> | <thaumcraft:cinderpearl> | <thaumcraft:vishroom>]);

//Remove easier Thaumcraft Scribing Tools Recipe
recipes.removeByRecipeName("thaumcraft:scribingtoolscraft2");

//Thaumometer
mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumcraft:thaumometer>);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("thaumometer", "FIRSTSTEPS", 20, [<aspect:aer> * 2, <aspect:terra> * 2, <aspect:aqua> * 2, <aspect:ignis> * 2, <aspect:ordo> * 2, <aspect:perditio> * 2], <thaumcraft:thaumometer>, [[null, <ore:plateGold>, null], [<ore:plateGold>, <ore:blockGlassColorless>, <ore:plateGold>], [null, <ore:plateGold>, null]]);

print("### Thaumcraft Init Complete ###");
