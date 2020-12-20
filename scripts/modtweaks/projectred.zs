print("~~~ Begin ProjectRed Init ~~~");

//Hide Unused Items
val unusedItems =
[
	<projectred-transmission:framed_wire:34>,
	<projectred-transmission:wire:34>,
	<projectred-core:resource_item:252>,
	<projectred-core:resource_item:300>,
	<projectred-core:resource_item:250>,
	<projectred-core:drawplate>
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
scripts.helpers.addAlloySmeltingRecipe(<ore:ingotElectrotineAlloy>.firstItem, <ore:ingotConductiveIron>.firstItem, <ore:gemLapis>.firstItem * 4, 4500);
mods.enderio.AlloySmelter.addRecipe(<ore:ingotElectrotineAlloy>.firstItem, [<ore:ingotIron>, <ore:dustRedstone> * 1, <ore:gemLapis> * 4], 4500);

//Remove Furnace Electrotine Recipe
furnace.remove(<ore:ingotElectrotineAlloy>.firstItem, <projectred-core:resource_item:252>);

//Grind Electrotine Ingots into Dust
for electrotineIngot in <ore:ingotElectrotineAlloy>.items
{
  mods.appliedenergistics2.Grinder.addRecipe(<ore:dustElectrotine>.firstItem * 4, electrotineIngot, 2);
}

//Add items to OreDicts
<ore:coilCopper>.add(<projectred-core:resource_item:400>);
<ore:coilIron>.add(<projectred-core:resource_item:401>);
<ore:coilGold>.add(<projectred-core:resource_item:402>);
<ore:waferSilicon>.add(<projectred-core:resource_item:301>);

//Various Crafting Recipes
val projectRedRecipes = {
		<ore:coilCopper>.firstItem * 4 : [[<ore:ingotCopper>, null, null], [null, <ore:plankSealedWood>, null], [null, null, <ore:ingotCopper>]],
		<ore:coilIron>.firstItem * 4 : [[<ore:ingotIron>, null, null], [null, <ore:plankSealedWood>, null], [null, null, <ore:ingotIron>]],
		<ore:coilGold>.firstItem * 4 : [[<ore:ingotGold>, null, null], [null, <ore:plankSealedWood>, null], [null, null, <ore:ingotGold>]],
		<projectred-core:resource_item:310> : [[null, <ore:dustRedstone>, null], [<ore:dustRedstone>, <projectred-core:resource_item:301>, <ore:dustRedstone>], [null, <ore:dustRedstone>, null]],
		<projectred-core:resource_item:311> : [[null, <ore:dustGlowstone>, null], [<ore:dustGlowstone>, <projectred-core:resource_item:301>, <ore:dustGlowstone>], [null, <ore:dustGlowstone>, null]],
		<projectred-core:resource_item:312> : [[null, <ore:dustElectrotine>, null], [<ore:dustElectrotine>, <projectred-core:resource_item:301>, <ore:dustElectrotine>], [null, <ore:dustElectrotine>, null]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in projectRedRecipes {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Craft Silicon Plates with a Hammer/Compactor
recipes.remove(<projectred-core:resource_item:301>);
recipes.addShapeless(scripts.helpers.createRecipeName(<projectred-core:resource_item:301>), <projectred-core:resource_item:301> * 8, [<embers:tinker_hammer>, <ore:itemSilicon>]);
mods.thermalexpansion.Compactor.addPressRecipe(<projectred-core:resource_item:301> * 8, <ore:itemSilicon>.firstItem, 350);


print("### ProjectRed Init Complete ###");
