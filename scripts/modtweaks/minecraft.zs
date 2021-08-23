import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

print("~~~ Begin Minecraft Init ~~~");

//Buff up Rail Recipe
recipes.removeByRecipeName("minecraft:rail");
recipes.addShaped(scripts.helpers.createRecipeName(<minecraft:rail>) ~ "_1", <minecraft:rail> * 16, [[<ore:ingotIron>, null, <ore:ingotIron>],[<ore:ingotIron>, <ore:stickWood>, <ore:ingotIron>], [<ore:ingotIron>, null, <ore:ingotIron>]]);
recipes.addShaped(scripts.helpers.createRecipeName(<minecraft:rail>) ~ "_2", <minecraft:rail> * 48, [[<ore:ingotCrudeSteel>, null, <ore:ingotCrudeSteel>],[<ore:ingotCrudeSteel>, <ore:plateSealedWood>, <ore:ingotCrudeSteel>], [<ore:ingotCrudeSteel>, null, <ore:ingotCrudeSteel>]]);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<minecraft:rail>) ~ "_3", scripts.helpers.stages.progression2.stage, <minecraft:rail> * 64, [[<ore:ingotSteel>, null, <ore:ingotSteel>],[<ore:ingotSteel>, <ore:plateSealedWood>, <ore:ingotSteel>], [<ore:ingotSteel>, null, <ore:ingotSteel>]]);

//Buffs brick block recipe to 4 per craft
recipes.removeByRecipeName("minecraft:brick_block");
recipes.addShaped(scripts.helpers.createRecipeName(<minecraft:brick_block>), <minecraft:brick_block> * 4, [[<ore:ingotBrick>, <ore:ingotBrick>], [<ore:ingotBrick>, <ore:ingotBrick>]]);
//Then remove the ensuing dupe bugs!
mods.thermalexpansion.Pulverizer.removeRecipe(<minecraft:brick_block>);
mods.nuclearcraft.melter.removeRecipeWithInput(<minecraft:brick_block>);
scripts.helpers.addMeltingRecipe(<liquid:clay> * 144, <minecraft:brick_block>, 500, 1);

//Buffs TNT recipe to 4 per craft
recipes.removeByRecipeName("minecraft:tnt");
recipes.addShaped(scripts.helpers.createRecipeName(<minecraft:tnt>), <minecraft:tnt> * 4, [[<ore:gunpowder>, <ore:sand>, <ore:gunpowder>], [<ore:sand>, <ore:gunpowder>, <ore:sand>], [<ore:gunpowder>, <ore:sand>, <ore:gunpowder>]]);

//Charcoal Creation Removal
furnace.remove(<minecraft:coal:1>);
furnace.addRecipe(<minecraft:coal:1>, <thermalfoundation:material:801>);

//Tooltips
scripts.helpers.AddTooltip(<minecraft:coal:1>, ["Cannot be made in a standard furnace.", "Cover up wood piles with soft blocks and burn them instead!", "See the Foresters Manual for more details. (Or web search!)"]);
scripts.helpers.AddTooltip(<minecraft:redstone_ore>, ["Generates 25% more often compared to vanilla ore spawning."]);
scripts.helpers.AddTooltip(<minecraft:iron_ore>, ["Generates 30% more often compared to vanilla ore spawning."]);

//Painting Acacia Wood
recipes.addShaped(scripts.helpers.createRecipeName(<mowziesmobs:painted_acacia>), <mowziesmobs:painted_acacia> * 8, [[<minecraft:planks:4>, <minecraft:planks:4>, <minecraft:planks:4>], [<minecraft:planks:4>, <ore:dye>, <minecraft:planks:4>], [<minecraft:planks:4>, <minecraft:planks:4>, <minecraft:planks:4>]]);

//Add Furnace Ore Processing Tooltip
<minecraft:furnace>.addTooltip(scripts.helpers.createTierTooltip("Processes up to Tier ", 0, false, " Ores, with a 1.0x output rate."));
<minecraft:tnt>.addTooltip(scripts.helpers.createTierTooltip("Processes up to Tier ", 1, false, " Ores, with a 2.0x output rate."));

//Remove bonemeal crafting, incentivise composting
recipes.removeByRecipeName("minecraft:bone_meal_from_bone");
scripts.helpers.AddTooltip(<minecraft:dye:15>, ["Use a composter to create bone meal!", "Alternatively, use a hand-grinder or pulverizer!"]);

//Make Hoppers Cheaper
recipes.addShaped(scripts.helpers.createRecipeName(<minecraft:hopper>), <minecraft:hopper> * 3, [[<ore:plateIron>, null, <ore:plateIron>],[<ore:ingotIron>, <ore:chestWood>, <ore:ingotIron>], [null, <ore:ingotIron>, null]]);
furnace.remove(<ore:nuggetIron>.firstItem * 15, <minecraft:hopper>);
furnace.addRecipe(<ore:nuggetIron>.firstItem * 13, <minecraft:hopper>, 1.0);

//Remove Sulfur from Blaze Rods
mods.magneticraft.Grinder.removeRecipe(<minecraft:blaze_rod>);
mods.thermalexpansion.Pulverizer.removeRecipe(<minecraft:blaze_rod>);
mods.nuclearcraft.manufactory.removeRecipeWithInput(<minecraft:blaze_rod>);
mods.enderio.SagMill.removeRecipe(<minecraft:blaze_rod>);
scripts.helpers.addCrushingRecipeWithSecondary(<minecraft:blaze_powder> * 4, <minecraft:blaze_rod>, 5000, <jaopca:item_dustsmallsulfur>, 10, 1);

print("### Minecraft Init Complete ###");
