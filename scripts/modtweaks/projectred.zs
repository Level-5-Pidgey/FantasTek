print("~~~ Begin ProjectRed Init ~~~");

//Hide Unused Items
val unusedItems =
[
	<projectred-transmission:framed_wire:34>,
	<projectred-transmission:wire:34>,
	<projectred-core:resource_item:252>
] as crafttweaker.item.IItemStack[];

for item in unusedItems
{
	scripts.helpers.unstageAndHide(item);
}

//Replace Non-OreDicted Redstone Alloy Ingots with properly oreDicted ones.
for item in loadedMods["projectred-transmission"].items {
	recipes.replaceAllOccurences(<projectred-core:resource_item:103>, <ore:ingotRedstoneAlloy>, item);
}
//Replace ingotRedAlloy with ingotRedstoneAlloy.
<ore:ingotRedAlloy>.remove(<projectred-core:resource_item:103>); //Removing ingotRedAlloy oreDict
<ore:ingotRedstoneAlloy>.add(<projectred-core:resource_item:103>); //Adding to ingotRedstoneAlloy

var count = 0;
for item in <ore:ingotRedstoneAlloy>.items
{
	count += 1;

	mods.inworldcrafting.FluidToItem.transform(<ore:ingotElectrotineAlloy>.firstItem, <liquid:astralsorcery.liquidstarlight>, item, true);
	mods.botania.ManaInfusion.addInfusion(<ore:ingotElectrotineAlloy>.firstItem, item, 800);
	mods.bloodmagic.BloodAltar.addRecipe(<ore:ingotElectrotineAlloy>.firstItem, item, 0, 100, 20, 20);
	scripts.mmhelper.AddEmberAssemblyRecipe(scripts.helpers.createRecipeName(<ore:ingotElectrotineAlloy>.firstItem) ~ "_" ~ count, <ore:ingotElectrotineAlloy>.firstItem, [item], 800);
	mods.thaumcraft.Crucible.registerRecipe(scripts.helpers.createRecipeName(<ore:ingotElectrotineAlloy>.firstItem) ~ "_" ~ count, "FIRSTSTEPS", <ore:ingotElectrotineAlloy>.firstItem, item, [<aspect:potentia> * 8]);
}

//Remove Furnace Electrotine Recipe
furnace.remove(<ore:ingotElectrotineAlloy>.firstItem, <projectred-core:resource_item:252>);

//Grind Electrotine Ingots into Dust

for electrotineIngot in <ore:ingotElectrotineAlloy>.items
{
  mods.appliedenergistics2.Grinder.addRecipe(<ore:dustElectrotine>.firstItem * 3, electrotineIngot, 2);
}

print("### ProjectRed Init Complete ###");
