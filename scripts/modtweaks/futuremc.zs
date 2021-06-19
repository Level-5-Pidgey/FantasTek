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

//Add Blast Furnace Ore Processing Tooltips.
<futuremc:blast_furnace>.addTooltip(scripts.helpers.createTierTooltip("Processes up to Tier ", 0, false, " Ores, with a 1.0x output rate."));

//Hide Blast Furnace JEI Category due to recipe removal bugs
mods.jei.JEI.hideCategory("container.jei.futuremc.blast_furnace.name");

//Create Netherite with Netherite Scrap and Gold Ingots in a Smeltery or in an Induction Furnace
recipes.removeByRecipeName("futuremc:netherite_ingot");
recipes.addShapeless(scripts.helpers.createRecipeName(<futuremc:netherite_ingot>), <futuremc:netherite_ingot>, [<ore:ingotDemonicMetal>, <ore:ingotDemonicMetal>, <ore:ingotDemonicMetal>, <ore:ingotDemonicMetal>, <ore:ingotAncientDebris>, <ore:ingotAncientDebris>, <ore:ingotAncientDebris>, <ore:ingotAncientDebris>]);
mods.tconstruct.Alloy.addRecipe(<liquid:netherite> * 1, [<liquid:xu_demonic_metal> * 4, <liquid:ancient_debris> * 4]);
mods.tconstruct.Casting.addTableRecipe(<ore:ingotNetherite>.firstItem, <tconstruct:cast_custom>, <liquid:netherite>, 144, false);
mods.tconstruct.Casting.addBasinRecipe(<ore:blockNetherite>.firstItem, null, <liquid:netherite>, 1296);
scripts.helpers.addAlloySmeltingRecipe(<ore:ingotNetherite>.firstItem * 1, <ore:ingotDemonicMetal>.firstItem * 4, <ore:ingotAncientDebris>.firstItem * 4, 9000, 1);

//Melt Netherite in TCon Smeltery
mods.tconstruct.Melting.addRecipe(<liquid:netherite> * 144, <ore:ingotNetherite>.firstItem);

print("### FutureMC Init Complete ###");
