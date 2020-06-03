print("~~~ Begin FutureMC Init ~~~");

//Notify that these blocks are not currently usable.
scripts.helpers.AddTooltip(<futuremc:loom>, ["Currently has no use.", "For display purposes only."]);
scripts.helpers.AddTooltip(<futuremc:fletching_table>, ["Currently has no use.", "For display purposes only."]);

//Add Honey Tooltips
scripts.helpers.AddTooltip(<futuremc:honeycomb>, ["Obtained by shearing a Bee Nest or Beehive at level 5 pollination."]);
scripts.helpers.AddTooltip(<futuremc:honey_bottle>, ["Obtained by right-clicking a Bee Nest or Beehive at level 5 pollination with an empty bottle."]);

//Make Bee Hive Recipe Easier
recipes.remove(<futuremc:beehive>);
recipes.addShaped(scripts.helpers.createRecipeName(<futuremc:beehive>), <futuremc:beehive>, [[<ore:plankWood>, <ore:plateWood>, <ore:plankWood>], [<futuremc:honeycomb>, <ore:string>, <futuremc:honeycomb>], [<ore:plankWood>, <ore:plateWood>, <ore:plankWood>]]);

//Create FutureMC bee combs from forestry ones.
recipes.addShapeless(scripts.helpers.createRecipeName(<futuremc:beehive>) ~ "_futuremc", <futuremc:beehive>, [<ore:beeComb>]);

print("### FutureMC Init Complete ###");
