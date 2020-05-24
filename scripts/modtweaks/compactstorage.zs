print("~~~ Begin Compact Storage Init ~~~");

//Change Chest Builder Recipe
recipes.remove(<compactstorage:chestbuilder>);
recipes.addShaped(scripts.helpers.createRecipeName(<compactstorage:chestbuilder>), <compactstorage:chestbuilder>, [[<ore:ingotIron>, <minecraft:lever>, <ore:ingotIron>], [<ore:ingotIron>, <ore:workbench>, <ore:ingotIron>], [<ore:ingotIron>, <ore:plateDiamond>, <ore:ingotIron>]]);

//Hide Drum and Barrel
scripts.helpers.unstageAndHide(<compactstorage:barrel>);
scripts.helpers.unstageAndHide(<compactstorage:barrel_fluid>);

print("### Compact Storage Init Complete ###");
