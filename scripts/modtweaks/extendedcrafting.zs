
print("~~~ Begin ExtendedCrafting Init ~~~");

//Remove Existing Black Iron Crafting
recipes.removeByRecipeName("extendedcrafting:black_iron_ingot");
recipes.removeByRecipeName("extendedcrafting:black_iron_slate");

//Add New Black Iron Crafting
//Tinkers Melting
mods.tconstruct.Alloy.addRecipe(<liquid:black_iron> * 2, [<liquid:iron> * 1, <liquid:obsidian> * 1]);
mods.tconstruct.Casting.addTableRecipe(<ore:ingotBlackIron>.firstItem, <tconstruct:cast_custom>, <liquid:black_iron>, 144, false);
mods.tconstruct.Casting.addTableRecipe(<ore:nuggetBlackIron>.firstItem, <tconstruct:cast_custom:1>, <liquid:black_iron>, 16, false);
mods.tconstruct.Casting.addTableRecipe(<extendedcrafting:material:2>, <tconstruct:cast_custom:3>, <liquid:black_iron>, 360, false);
mods.tconstruct.Casting.addBasinRecipe(<ore:blockBlackIron>.firstItem, null, <liquid:black_iron>, 1296);
//Machines
scripts.helpers.addAlloySmeltingRecipe(<ore:ingotBlackIron>.firstItem * 2, <ore:ingotIron>.firstItem, <ore:obsidian>.firstItem, 3000);
//Crafting
recipes.addShapeless(scripts.helpers.createRecipeName(<extendedcrafting:material:2>), <extendedcrafting:material:2> * 2, [<embers:tinker_hammer>, <ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotBlackIron>]);
recipes.addShapeless(scripts.helpers.createRecipeName(<ore:ingotBlackIron>.firstItem), <ore:ingotBlackIron>.firstItem, [<embers:tinker_hammer>, <ore:ingotIron>, <ore:obsidian>]);
mods.advancedrocketry.PlatePresser.addRecipe(<extendedcrafting:material:2> * 4, <ore:blockBlackIron>.firstItem);

//Hide Tier 1 Component
scripts.helpers.unstageAndHide(<extendedcrafting:material:8>);
recipes.remove(<extendedcrafting:material:14>);
recipes.addShaped("basic_component", <extendedcrafting:material:14>, [[null, <extendedcrafting:material:7>, null],[<ore:gemQuartz>, <extendedcrafting:material:2>, <ore:gemQuartz>], [null, <extendedcrafting:material:7>, null]]);

//Basic Crafting Table (Tier 1)
recipes.remove(<extendedcrafting:table_basic>);

mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<extendedcrafting:table_basic>) ~ "-botania", scripts.staging.stages.Botania1.stage, <extendedcrafting:table_basic>, [[<ore:ingotBlackIron>, scripts.helpers.GetBotaniaCraftingMaterials(1), <ore:ingotBlackIron>],[<extendedcrafting:material:14>, <ore:ingotUnstable>, <extendedcrafting:material:14>], [<ore:ingotBlackIron>, <ore:workbench>, <ore:ingotBlackIron>]]); //Botania Recipe

mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<extendedcrafting:table_basic>) ~ "-astral", scripts.staging.stages.AstralSorcery1.stage, <extendedcrafting:table_basic>, [[<ore:ingotBlackIron>, scripts.helpers.GetAstralCraftingMaterials(1), <ore:ingotBlackIron>],[<extendedcrafting:material:14>, <ore:ingotUnstable>, <extendedcrafting:material:14>], [<ore:ingotBlackIron>, <ore:workbench>, <ore:ingotBlackIron>]]); //Astral Sorcery Recipe

mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<extendedcrafting:table_basic>) ~ "-embers", scripts.staging.stages.Embers1.stage, <extendedcrafting:table_basic>, [[<ore:ingotBlackIron>, scripts.helpers.GetEmbersCraftingMaterials(1), <ore:ingotBlackIron>],[<extendedcrafting:material:14>, <ore:ingotUnstable>, <extendedcrafting:material:14>], [<ore:ingotBlackIron>, <ore:workbench>, <ore:ingotBlackIron>]]); //Embers Recipe

mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<extendedcrafting:table_basic>) ~ "-bloodmagic", scripts.staging.stages.BloodMagic1.stage, <extendedcrafting:table_basic>, [[<ore:ingotBlackIron>, scripts.helpers.GetBloodMagicCraftingMaterials(1), <ore:ingotBlackIron>],[<extendedcrafting:material:14>, <ore:ingotUnstable>, <extendedcrafting:material:14>], [<ore:ingotBlackIron>, <ore:workbench>, <ore:ingotBlackIron>]]); //Blood Magic Recipe

mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<extendedcrafting:table_basic>) ~ "-thaumcraft", scripts.staging.stages.Thaumcraft1.stage, <extendedcrafting:table_basic>, [[<ore:ingotBlackIron>, scripts.helpers.GetThaumcraftCraftingMaterials(1), <ore:ingotBlackIron>],[<extendedcrafting:material:14>, <ore:ingotUnstable>, <extendedcrafting:material:14>], [<ore:ingotBlackIron>, <ore:workbench>, <ore:ingotBlackIron>]]); //Thaumcraft

//Automation Interface
recipes.remove(<extendedcrafting:interface>);
for item in scripts.helpers.CircuitTiers[0].items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:interface>, [
		[<ore:ingotBlackIron>, item, <ore:ingotBlackIron>],
		[<ore:gearDiamond>, <extendedcrafting:frame>, <ore:gearDiamond>],
		[<ore:ingotBlackIron>, <extendedcrafting:material:2>, <ore:ingotBlackIron>]
	]);
}

//Advanced (T2) Crafting Table + Components
recipes.remove(<extendedcrafting:material:15>);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<extendedcrafting:material:15>), scripts.staging.stages.progression2.stage, <extendedcrafting:material:15>, [[<extendedcrafting:material:2>, <extendedcrafting:material:7>], [<ore:ingotBronze>, <ore:ingotBronze>]]);
recipes.remove(<extendedcrafting:table_advanced>);

for i, unused in scripts.helpers.AllFireT1Items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:table_advanced>, [
		[<ore:ingotBlackIron>, scripts.helpers.AllAirT1Items[i], <ore:ingotBlackIron>],
		[scripts.helpers.AllEarthT1Items[i], <extendedcrafting:material:9>, scripts.helpers.AllWaterT1Items[i]],
		[<ore:ingotBlackIron>, scripts.helpers.AllFireT1Items[i], <ore:ingotBlackIron>]
	]);
}


print("### ExtendedCrafting Init Complete ###");
