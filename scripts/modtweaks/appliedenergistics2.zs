print("~~~ Begin AE2 Init ~~~");

//Make Silicon smelt into an ingot
furnace.addRecipe(<libvulpes:productingot:3>, <ore:itemSilicon>, 0.0);

//Coal Coke Dust Crafting
//Coal Coke Item
for coalCoke in <ore:fuelCoke>.items
{
  mods.appliedenergistics2.Grinder.addRecipe(<contenttweaker:coke_dust>, coalCoke, 2);
}
//Coal Coke Block
for cokeBlock in <ore:blockFuelCoke>.items
{
  mods.appliedenergistics2.Grinder.addRecipe(<contenttweaker:coke_dust> * 9, cokeBlock, 18);
}

//Quartz Grinstone Block
recipes.remove(<appliedenergistics2:grindstone>);
recipes.addShaped(scripts.helpers.createRecipeName(<appliedenergistics2:grindstone>), <appliedenergistics2:grindstone>, [[<ore:cobblestone>, <ore:stickWood>, <ore:cobblestone>], [<ore:cobblestone>, <ore:plateQuartz>, <ore:cobblestone>], [<ore:cobblestone>, <ore:obsidian>, <ore:cobblestone>]]);

//Grindstone Crankshaft
recipes.remove(<appliedenergistics2:crank>);
recipes.addShaped(scripts.helpers.createRecipeName(<appliedenergistics2:crank>), <appliedenergistics2:crank>, [[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>], [<ore:stickWood>, null, null], [<ore:stickWood>, null, null]]);
recipes.addShaped(scripts.helpers.createRecipeName(<appliedenergistics2:crank>) ~ "-alternate", <appliedenergistics2:crank>, [[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>], [null, null, <ore:stickWood>], [null, null, <ore:stickWood>]]);

//Grind Obsidian for Obsidian Dust
for obsidianBlock in <ore:obsidian>.items
{
  mods.appliedenergistics2.Grinder.addRecipe(<ore:dustObsidian>.firstItem, obsidianBlock, 6);
}

print("### AE2 Init Complete ###");
