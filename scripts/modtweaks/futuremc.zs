print("~~~ Begin FutureMC Init ~~~");

//Notify that these blocks are not currently usable.
scripts.helpers.AddTooltip(<minecraftfuture:loom>, ["Currently has no use.", "For display purposes only."]);
scripts.helpers.AddTooltip(<minecraftfuture:fletchingtable>, ["Currently has no use.", "For display purposes only."]);
scripts.helpers.AddTooltip(<minecraftfuture:stonecutter>, ["Currently has no use.", "For display purposes only."]);

//Add Honey Tooltips
scripts.helpers.AddTooltip(<minecraftfuture:honeycomb>, ["Obtained by shearing a Bee Nest or Beehive at level 5 pollination."]);
scripts.helpers.AddTooltip(<minecraftfuture:honey_bottle>, ["Obtained by right-clicking a Bee Nest or Beehive at level 5 pollination with an empty bottle."]);

//Make Bee Hive Recipe Easier
recipes.remove(<minecraftfuture:bee_hive>);
recipes.addShaped(scripts.helpers.createRecipeName(<minecraftfuture:bee_hive>), <minecraftfuture:bee_hive>, [[<ore:plankWood>, <ore:plateWood>, <ore:plankWood>], [<minecraftfuture:honeycomb>, <ore:string>, <minecraftfuture:honeycomb>], [<ore:plankWood>, <ore:plateWood>, <ore:plankWood>]]);

print("### FutureMC Init Complete ###");
