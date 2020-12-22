
print("~~~ Begin Dark Utils Init ~~~");

//Remove Recipe for Dark Utils Gluttony Charm (and add tooltip saying it can be bought from Villagers!)
recipes.remove(<darkutils:charm_gluttony>);
scripts.helpers.AddTooltip(<darkutils:charm_gluttony>, ["Can be bought from some Butcher Villagers.", "Makes you eat extremely fast! Sometimes you might eat extra, though."]);

print("### Dark Utils Init Complete ###");
