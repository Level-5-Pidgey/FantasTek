print("~~~ Begin Compact Storage Init ~~~");

//Change Chest Builder Recipe
recipes.removeByRecipeName("compactstorage:chest_builder");
recipes.addShaped("chest_builder", <compactstorage:chestbuilder>, [[<ore:ingotIron>, null, <ore:ingotIron>], [<ore:plateIron>, <ore:workbench>, <ore:plateIron>], [<ore:ingotIron>, <ore:plateDiamond>, <ore:ingotIron>]]);

//Hide Drum and Barrel
scripts.helpers.unstageAndHide(<compactstorage:barrel>);
scripts.helpers.unstageAndHide(<compactstorage:barrel_fluid>);

print("### Compact Storage Init Complete ###");
