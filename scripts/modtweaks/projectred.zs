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
	mods.jei.JEI.removeAndHide(item);
}

//Replace Non-OreDicted Redstone Alloy Ingots with properly oreDicted ones.
for item in loadedMods["projectred-transmission"].items {
	recipes.replaceAllOccurences(<projectred-core:resource_item:103>, <ore:ingotRedstoneAlloy>, item);
}
//Replace ingotRedAlloy with ingotRedstoneAlloy.
<ore:ingotRedAlloy>.remove(<projectred-core:resource_item:103>); //Removing ingotRedAlloy oreDict
<ore:ingotRedstoneAlloy>.add(<projectred-core:resource_item:103>); //Adding to ingotRedstoneAlloy

for item in <ore:ingotRedstoneAlloy>.items
{
	mods.inworldcrafting.FluidToItem.transform(<ore:ingotElectrotineAlloy>.firstItem, <liquid:astralsorcery.liquidstarlight>, item, true);
	mods.botania.ManaInfusion.addInfusion(<ore:ingotElectrotineAlloy>.firstItem, item, 800);
	mods.bloodmagic.BloodAltar.addRecipe(<ore:ingotElectrotineAlloy>.firstItem, item, 0, 100, 20, 20);
	scripts.mmhelper.AddEmberAssemblyRecipe(<ore:ingotElectrotineAlloy>.firstItem, [item], 800);
	mods.thaumcraft.Crucible.registerRecipe(scripts.helpers.createRecipeName(<ore:ingotElectrotineAlloy>.firstItem), "FIRSTSTEPS", <ore:ingotElectrotineAlloy>.firstItem, item, [<aspect:potentia> * 8]);
}

print("### ProjectRed Init Complete ###");
