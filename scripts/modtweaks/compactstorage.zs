print("~~~ Begin Compact Storage Init ~~~");

//Change Chest Builder Recipe
recipes.remove(<compactstorage:chestbuilder>);
recipes.addShaped("chest_builder", <compactstorage:chestbuilder>, [[<ore:ingotIron>, null, <ore:ingotIron>], [<ore:plateIron>, <ore:workbench>, <ore:plateIron>], [<ore:ingotIron>, <ore:plateDiamond>, <ore:ingotIron>]]);

//Hide Drum and Barrel
mods.jei.JEI.removeAndHide(<compactstorage:barrel>);
mods.jei.JEI.removeAndHide(<compactstorage:barrel_fluid>);

print("### Compact Storage Init Complete ###");
