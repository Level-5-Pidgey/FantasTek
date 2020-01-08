
print("~~~ Begin ExtendedCrafting Init ~~~");

//Remove Existing Black Iron Crafting
recipes.removeByRecipeName("extendedcrafting:black_iron_ingot");
recipes.removeByRecipeName("extendedcrafting:black_iron_slate");

//Add New Black Iron Crafting
//Tinkers Melting
mods.tconstruct.Alloy.addRecipe(<liquid:molten_black_iron> * 2, [<liquid:iron> * 1, <liquid:obsidian> * 1]);
mods.tconstruct.Casting.addTableRecipe(<ore:ingotBlackIron>.firstItem, <tconstruct:cast_custom>, <liquid:molten_black_iron>, 144, false);
mods.tconstruct.Casting.addTableRecipe(<ore:nuggetBlackIron>.firstItem, <tconstruct:cast_custom:1>, <liquid:molten_black_iron>, 16, false);
mods.tconstruct.Casting.addTableRecipe(<extendedcrafting:material:2>, <tconstruct:cast_custom:3>, <liquid:molten_black_iron>, 576, false);
mods.tconstruct.Casting.addBasinRecipe(<ore:blockBlackIron>.firstItem, null, <liquid:molten_black_iron>, 1296);
//Machines
mods.thermalexpansion.InductionSmelter.addRecipe(<ore:ingotBlackIron>.firstItem * 2, <ore:ingotIron>.firstItem, <ore:obsidian>.firstItem, 3000);
mods.enderio.AlloySmelter.addRecipe(<ore:ingotBlackIron>.firstItem * 2, [<ore:ingotIron>, <ore:obsidian>], 3000);
//Crafting
recipes.addShapeless("plateCrafting_blackIron", <extendedcrafting:material:2>, [<embers:tinker_hammer>, <ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotBlackIron>]);
recipes.addShapeless("ingotCrafting_blackIron", <ore:ingotBlackIron>.firstItem, [<embers:tinker_hammer>, <ore:ingotIron>, <ore:obsidian>]);
mods.advancedrocketry.PlatePresser.addRecipe(<extendedcrafting:material:2> * 2, <ore:blockBlackIron>.firstItem);

//Hide Tier 1 Component
mods.jei.JEI.removeAndHide(<extendedcrafting:material:8>);
recipes.remove(<extendedcrafting:material:14>);
recipes.addShaped("basic_component", <extendedcrafting:material:14>, [[null, <extendedcrafting:material:7>, null],[<ore:gemQuartz>, <extendedcrafting:material:2>, <ore:gemQuartz>], [null, <extendedcrafting:material:7>, null]]);

//Basic Crafting Table (Tier 1)
recipes.remove(<extendedcrafting:table_basic>);

mods.recipestages.Recipes.addShaped("basic_table_botania", "botania-i", <extendedcrafting:table_basic>, [[<ore:ingotBlackIron>, scripts.helpers.BotaniaT1Runes, <ore:ingotBlackIron>],[<extendedcrafting:material:14>, <ore:ingotUnstable>, <extendedcrafting:material:14>], [<ore:ingotBlackIron>, <ore:workbench>, <ore:ingotBlackIron>]]); //Botania Recipe

mods.recipestages.Recipes.addShaped("basic_table_astral", "astral-i", <extendedcrafting:table_basic>, [[<ore:ingotBlackIron>, scripts.helpers.AstralT1Crystals, <ore:ingotBlackIron>],[<extendedcrafting:material:14>, <ore:ingotUnstable>, <extendedcrafting:material:14>], [<ore:ingotBlackIron>, <ore:workbench>, <ore:ingotBlackIron>]]); //Astral Sorcery Recipe


print("### ExtendedCrafting Init Complete ###");
