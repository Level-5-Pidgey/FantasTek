print("~~~ Begin Antique Atlas Init ~~~");

//Remove crafting recipe (make purchasable only)
scripts.helpers.AddTooltip(<antiqueatlas:empty_antique_atlas>, ["Can be purchased from an expert Cartographer (Level 3 Trade)."]);
recipes.remove(<antiqueatlas:empty_antique_atlas>);

print("### Antique Atlas Init Complete ###");
