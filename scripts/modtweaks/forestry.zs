print("~~~ Begin Forestry Init ~~~");

//Add Log Pile to an OreDict for the Coke Oven
<ore:logPile>.add(<forestry:wood_pile>);

//Hide Depreciated Items
val depreciatedForestry = [
	<forestry:greenhouse:3>,
	<forestry:greenhouse:4>,
	<forestry:greenhouse:5>,
	<forestry:climatiser:1>,
	<forestry:climatiser:2>,
	<forestry:climatiser:3>,
	<forestry:climatiser:4>
] as crafttweaker.item.IItemStack[];

for depreciated in depreciatedForestry
{
	mods.jei.JEI.removeAndHide(depreciated);
}
print("### Forestry Init Complete ###");
