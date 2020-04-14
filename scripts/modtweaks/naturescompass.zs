print("~~~ Begin Nature's Compass Init ~~~");

//Remove crafting recipe (make purchasable only)
scripts.helpers.AddTooltip(<naturescompass:naturescompass>, ["Can be purchased from an expert Cartographer (Level 3 Trade)."]);
recipes.remove(<naturescompass:naturescompass>);

print("### Nature's Compass Init Complete ###");
