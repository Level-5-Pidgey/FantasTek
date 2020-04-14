
print("~~~ Begin Minecraft Init ~~~");

//Buff up Rail Recipe
recipes.removeByRecipeName("minecraft:rail");
recipes.addShaped(scripts.helpers.createRecipeName(<minecraft:rail>) ~ "_1", <minecraft:rail> * 24, [[<ore:ingotIron>, null, <ore:ingotIron>],[<ore:ingotIron>, <ore:stickWood>, <ore:ingotIron>], [<ore:ingotIron>, null, <ore:ingotIron>]]);
recipes.addShaped(scripts.helpers.createRecipeName(<minecraft:rail>) ~ "_2", <minecraft:rail> * 48, [[<ore:ingotCrudeSteel>, null, <ore:ingotCrudeSteel>],[<ore:ingotCrudeSteel>, <ore:plateSealedWood>, <ore:ingotCrudeSteel>], [<ore:ingotCrudeSteel>, null, <ore:ingotCrudeSteel>]]);
recipes.addShaped(scripts.helpers.createRecipeName(<minecraft:rail>) ~ "_3", <minecraft:rail> * 64, [[<ore:ingotSteel>, null, <ore:ingotSteel>],[<ore:ingotSteel>, <ore:plateSealedWood>, <ore:ingotSteel>], [<ore:ingotSteel>, null, <ore:ingotSteel>]]);

print("### Minecraft Init Complete ###");
