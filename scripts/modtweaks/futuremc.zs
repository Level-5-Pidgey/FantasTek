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
recipes.addShapeless(scripts.helpers.createRecipeName(<futuremc:honeycomb>) ~ "_futuremc", <futuremc:honeycomb>, [<ore:beeComb>]);

//Notify about the bug with the blast furnace.
scripts.helpers.AddTooltip(<futuremc:blast_furnace>, ["JEI Entries are bugged, be warned!", "Will only smelt Processing Tier 0 ores,", "and Dense Ore of any tier.", "Putting in higher tiered ore will just delete the ore and give no output!!"]);

print("### FutureMC Init Complete ###");
