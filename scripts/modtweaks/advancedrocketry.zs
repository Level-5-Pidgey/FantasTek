print("~~~ Begin Advanced Rocketry Init ~~~");

//Remove tool forge crafting recipes
val platePress =
[
	<libvulpes:productdust:10>,
	<libvulpes:productdust:9>,
	<libvulpes:productdust:5>,
	<libvulpes:productdust:4>,
	<libvulpes:productdust:2>,
	<libvulpes:productdust:1>,
	<libvulpes:productdust>,
	<contenttweaker:material_part:847>,
	<contenttweaker:material_part:605>,
	<contenttweaker:material_part:595>,
	<contenttweaker:material_part:857>,
	<contenttweaker:material_part:837>,
	<magneticraft:dusts:4>,
	<draconicevolution:draconium_dust>,
	<thermalfoundation:material:67>,
	<thermalfoundation:material:72>,
	<contenttweaker:material_part:615>,
	<thermalfoundation:material:69>,
	<mekanism:dust:2>,
	<thermalfoundation:material:70>,
	<thermalfoundation:material:66>,
	<contenttweaker:material_part:576>,
	<magneticraft:dusts:5>,
	<astralsorcery:itemcraftingcomponent:2>,
	<jaopca:item_dustardite>
] as crafttweaker.item.IItemStack[];

for item in platePress
{
	mods.advancedrocketry.PlatePresser.removeRecipe(item);
}

//Hide AR plates (since they aren't craftable)
val ARPlates =
[
	<libvulpes:productplate:1>,
	<libvulpes:productplate:2>,
	<libvulpes:productplate:5>,
	<libvulpes:productplate:6>,
	<libvulpes:productplate:4>,
	<libvulpes:productplate:9>,
	<libvulpes:productplate:10>
] as crafttweaker.item.IItemStack[];

for ARPlate in ARPlates
{
	mods.jei.JEI.hide(ARPlate);
}

print("### Advanced Rocketry Init Complete ###");
