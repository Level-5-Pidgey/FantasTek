print("~~~ Begin ProjectRed Init ~~~");

//Hide Unused Items
val unusedItems =
[
	<projectred-transmission:framed_wire:34>,
	<projectred-transmission:wire:34>
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


print("### ProjectRed Init Complete ###");
