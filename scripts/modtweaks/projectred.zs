print("~~~ Begin ProjectRed Init ~~~");

//Hide Unused Items
val unusedItems =
[
	<projectred-transmission:framed_wire:34>,
	<projectred-transmission:wire:34>,
	<projectred-core:resource_item:252>,
	<projectred-core:resource_item:300>,
	<projectred-core:resource_item:250>,
	<projectred-core:drawplate>,
	<projectred-core:resource_item:500>,
	<projectred-core:resource_item:501>,
	<projectred-core:resource_item:502>,
	<projectred-core:resource_item:503>,
	<projectred-core:resource_item:504>,
	<projectred-core:resource_item:505>,
	<projectred-core:resource_item:506>,
	<projectred-core:resource_item:507>,
	<projectred-core:resource_item:508>,
	<projectred-core:resource_item>,
	<projectred-core:resource_item:1>,
	<projectred-core:resource_item:2>,
	<projectred-core:resource_item:3>,
	<projectred-core:resource_item:4>,
	<projectred-core:resource_item:10>,
	<projectred-core:resource_item:11>,
	<projectred-core:resource_item:12>,
	<projectred-core:resource_item:20>,
	<projectred-core:resource_item:21>,
	<projectred-core:resource_item:509>,
	<projectred-core:resource_item:510>,
	<projectred-core:resource_item:511>,
	<projectred-core:resource_item:512>,
	<projectred-core:resource_item:513>,
	<projectred-core:resource_item:514>,
	<projectred-core:resource_item:515>,
] as crafttweaker.item.IItemStack[];

for item in unusedItems
{
	scripts.helpers.unstageAndHide(item);
}

//Remove Silicon Boule -> Sandy Coal Compound Crafting
furnace.remove(<projectred-core:resource_item:300>, <projectred-core:resource_item:250>);

//Replace Non-OreDicted Redstone Alloy Ingots with properly oreDicted ones.
for item in loadedMods["projectred-transmission"].items {
	recipes.replaceAllOccurences(<projectred-core:resource_item:103>, <ore:ingotRedstoneAlloy>, item);
}
//Replace ingotRedAlloy with ingotRedstoneAlloy.
<ore:ingotRedAlloy>.remove(<projectred-core:resource_item:103>); //Removing ingotRedAlloy oreDict
<ore:ingotRedstoneAlloy>.add(<projectred-core:resource_item:103>); //Adding to ingotRedstoneAlloy

//Electrotine Production
var count = 0;
for item in <ore:ingotConductiveIron>.items
{
	count += 1;

	mods.inworldcrafting.FluidToItem.transform(<ore:ingotElectrotineAlloy>.firstItem, <liquid:astralsorcery.liquidstarlight>, [item], false);
	mods.botania.ManaInfusion.addInfusion(<ore:ingotElectrotineAlloy>.firstItem, item, 800);
	mods.bloodmagic.BloodAltar.addRecipe(<ore:ingotElectrotineAlloy>.firstItem, item, 0, 100, 20, 20);
	scripts.mmhelper.AddEmberAssemblyRecipe(scripts.helpers.createRecipeName(<ore:ingotElectrotineAlloy>.firstItem) ~ "_" ~ count, <ore:ingotElectrotineAlloy>.firstItem, [item], 150);
	mods.thaumcraft.Crucible.registerRecipe(scripts.helpers.createRecipeName(<ore:ingotElectrotineAlloy>.firstItem) ~ "_" ~ count, "FIRSTSTEPS", <ore:ingotElectrotineAlloy>.firstItem, item, [<aspect:potentia> * 3]);
}

//Stage 2 Electrotine Smelting
scripts.helpers.addAlloySmeltingRecipe(<ore:ingotElectrotineAlloy>.firstItem, <ore:ingotConductiveIron>.firstItem, <ore:gemLapis>.firstItem * 4, 4500, true);
mods.enderio.AlloySmelter.addRecipe(<ore:ingotElectrotineAlloy>.firstItem, [<ore:ingotIron>, <ore:dustRedstone> * 1, <ore:gemLapis> * 4], 4500);

//Remove Furnace Electrotine Recipe
furnace.remove(<ore:ingotElectrotineAlloy>.firstItem, <projectred-core:resource_item:252>);

//Grind Electrotine Ingots into Dust (and add tooltips!)
for electrotineIngot in <ore:ingotElectrotineAlloy>.items
{
  mods.appliedenergistics2.Grinder.addRecipe(<ore:dustElectrotine>.firstItem * 3, electrotineIngot, 2);
  scripts.helpers.addCrushingRecipe(<ore:dustElectrotine>.firstItem * 6, electrotineIngot, 500, true);
  scripts.helpers.AddTooltip(electrotineIngot, ["A proprietary, electrically conductive magically manufactured alloy.", "Don't give the recipe up to the competition, they're still figuring out how it works!", "Used as an early substitute for the likes of Copper."]);
}

//Add items to OreDicts
<ore:coilCopper>.add(<projectred-core:resource_item:400>);
<ore:coilIron>.add(<projectred-core:resource_item:401>);
<ore:coilGold>.add(<projectred-core:resource_item:402>);
<ore:waferSilicon>.add(<projectred-core:resource_item:301>);

//Various Crafting Recipes
val projectRedRecipes = {
	//Add Here
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in projectRedRecipes {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

recipes.remove(<projectred-core:resource_item:310>);
recipes.remove(<projectred-core:resource_item:311>);
recipes.remove(<projectred-core:resource_item:312>);
recipes.addShapeless(scripts.helpers.createRecipeName(<projectred-core:resource_item:310>), <projectred-core:resource_item:310>, [<projectred-core:resource_item:301>, <ore:dustRedstone>]);
recipes.addShapeless(scripts.helpers.createRecipeName(<projectred-core:resource_item:311>), <projectred-core:resource_item:311>, [<projectred-core:resource_item:301>, <ore:dustGlowstone>]);
recipes.addShapeless(scripts.helpers.createRecipeName(<projectred-core:resource_item:312>), <projectred-core:resource_item:312>, [<projectred-core:resource_item:301>, <ore:dustElectrotine>]);

//Craft Silicon Plates with a Hammer/Compactor
recipes.remove(<projectred-core:resource_item:301>);
recipes.addShapeless(scripts.helpers.createRecipeName(<projectred-core:resource_item:301>), <projectred-core:resource_item:301> * 4, [<embers:tinker_hammer>, <ore:itemSilicon>]);
for silicon in <ore:itemSilicon>.items
{
	mods.thermalexpansion.Sawmill.addRecipe(<projectred-core:resource_item:301> * 8, silicon, 7500);
	mods.mekanism.sawmill.addRecipe(silicon, <projectred-core:resource_item:301> * 8);
}

//Use Chisel to get logic Gates
mods.chisel.Carving.addGroup("logic-gates");
mods.chisel.Carving.addVariation("logic-gates", <minecraft:comparator>);
val logicGates =
[
	<projectred-integration:gate:1>,
	<projectred-integration:gate:2>,
	<projectred-integration:gate:3>,
	<projectred-integration:gate:4>,
	<projectred-integration:gate:5>,
	<projectred-integration:gate:6>,
	<projectred-integration:gate:7>,
	<projectred-integration:gate:8>,
	<projectred-integration:gate:9>,
	<projectred-integration:gate:10>,
	<projectred-integration:gate:11>,
	<projectred-integration:gate:12>,
	<projectred-integration:gate:13>,
	<projectred-integration:gate:14>,
	<projectred-integration:gate:15>,
	<projectred-integration:gate:16>,
	<projectred-integration:gate:17>,
	<projectred-integration:gate:18>,
	<projectred-integration:gate:19>,
	<projectred-integration:gate:20>,
	<projectred-integration:gate:21>,
	<projectred-integration:gate:22>,
	<projectred-integration:gate:23>,
	<projectred-integration:gate:24>,
	<projectred-integration:gate:25>,
	<projectred-integration:gate:26>,
	<projectred-integration:gate:27>,
	<projectred-integration:gate:28>,
	<projectred-integration:gate:29>,
	<projectred-integration:gate:30>,
	<projectred-integration:gate:31>,
	<projectred-integration:gate:32>,
	<projectred-integration:gate:33>,
	<projectred-integration:gate>
] as crafttweaker.item.IItemStack[];

for item in logicGates
{
	recipes.remove(item);
	mods.chisel.Carving.addVariation("logic-gates", item);
	scripts.helpers.AddTooltip(item, ["Crafted using a chisel on a Redstone Comparator."]);
}

recipes.remove(<ore:coilCopper>.firstItem);
recipes.remove(<ore:coilIron>.firstItem);
recipes.remove(<ore:coilGold>.firstItem);
mods.forestry.Carpenter.addRecipe(<ore:coilCopper>.firstItem * 4, [[<ore:ingotCopper>, null, null], [null, <ore:plankSealedWood>, null], [null, null, <ore:ingotCopper>]], 20, <liquid:water> * 100);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<ore:coilCopper>.firstItem), scripts.helpers.stages.progression2.stage, <ore:coilCopper>.firstItem * 2, [[<ore:ingotCopper>, null, null], [null, <ore:plankSealedWood>, null], [null, null, <ore:ingotCopper>]]);
mods.forestry.Carpenter.addRecipe(<ore:coilIron>.firstItem * 4, [[<ore:ingotIron>, null, null], [null, <ore:plankSealedWood>, null], [null, null, <ore:ingotIron>]], 20, <liquid:water> * 100);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<ore:coilIron>.firstItem), scripts.helpers.stages.progression2.stage, <ore:coilIron>.firstItem * 2, [[<ore:ingotIron>, null, null], [null, <ore:plankSealedWood>, null], [null, null, <ore:ingotIron>]]);
mods.forestry.Carpenter.addRecipe(<ore:coilGold>.firstItem * 4, [[<ore:ingotGold>, null, null], [null, <ore:plankSealedWood>, null], [null, null, <ore:ingotGold>]], 20, <liquid:water> * 100);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<ore:coilGold>.firstItem), scripts.helpers.stages.progression2.stage, <ore:coilGold>.firstItem * 2, [[<ore:ingotGold>, null, null], [null, <ore:plankSealedWood>, null], [null, null, <ore:ingotGold>]]);

print("### ProjectRed Init Complete ###");
