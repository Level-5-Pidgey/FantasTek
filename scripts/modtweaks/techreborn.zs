
print("~~~ Begin TechReborn Init ~~~");

//Delete the plate bending machine from existence!
mods.jei.JEI.hideCategory("TechReborn.PlateBendingMachine");
recipes.remove(<techreborn:plate_bending_machine>);
mods.jei.JEI.hide(<techreborn:plate_bending_machine>);

print("### TechReborn Init Complete ###");
