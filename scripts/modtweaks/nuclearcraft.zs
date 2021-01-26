print("~~~ Begin NuclearCraft Init ~~~");

//Change earlygame gelatin production
mods.tconstruct.Melting.removeRecipe(<liquid:gelatin>);
mods.tconstruct.Melting.addRecipe(<liquid:gelatin> * 36, <minecraft:dye:15>, 90);

//Early game cocoa butter production
mods.inworldcrafting.FluidToFluid.transform(<liquid:cocoa_butter>, <liquid:water>, [<nuclearcraft:ground_cocoa_nibs> * 10]);

//Geiger Counter Recipe
recipes.remove(<nuclearcraft:geiger_counter>);
mods.forestry.Carpenter.addRecipe(<nuclearcraft:geiger_counter>, [[<ore:ingotElectrotineAlloy>, <ore:ingotIron>, <ore:ingotIron>],[<ore:ingotElectrotineAlloy>, <ore:ingotGold>, <ore:ingotGold>],[<ore:dustRedstone>, <ore:ingotIron>, <ore:ingotIron>]], 160, <liquid:water> * 500);

print("### NuclearCraft Init Complete ###");
