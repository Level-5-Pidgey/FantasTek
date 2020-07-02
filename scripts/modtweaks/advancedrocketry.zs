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
	scripts.helpers.unstageAndHide(ARPlate);
}

//Remove Microchip Crafting
mods.advancedrocketry.CuttingMachine.removeRecipe(<advancedrocketry:ic:2> * 4);
mods.advancedrocketry.CuttingMachine.removeRecipe(<advancedrocketry:ic> * 4);

//Change Coil Block OreDicts
val vulpesCoils = {
	"Copper" : <libvulpes:coil0:4>,
	"Titanium" : <libvulpes:coil0:7>,
	"Gold" : <libvulpes:coil0:2>,
	"Aluminum" : <libvulpes:coil0:9>,
	"Aluminium" : <libvulpes:coil0:9>,
	"Iridium" : <libvulpes:coil0:10>
} as crafttweaker.item.IItemStack[string];

for key, value in vulpesCoils {
	//Make the oredict "coilBlockGold" instead of "coilGold" for example
	oreDict.get("coil" ~ key).remove(value);
	oreDict.get("coilBlock" ~ key).add(value);
}

//Crafting Recipes
val advancedRocketryRecipes = {
		<advancedrocketry:platepress> : [[null, <minecraft:piston>, null],[<ore:plateDiamond>, <ore:ingotIron>, <ore:plateEmerald>], [null, <ore:slimeball>, null]],
		<advancedrocketry:blastbrick> * 2 : [[<tconstruct:materials:2>, <ore:powderBlaze>, <tconstruct:materials:2>],[<ore:ingotBrickNether>, <minecraft:magma_cream>, <ore:ingotBrickNether>], [<tconstruct:materials:2>, <ore:powderBlaze>, <tconstruct:materials:2>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in advancedRocketryRecipes {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Crafting Microchips
mods.forestry.Carpenter.addRecipe(<advancedrocketry:ic> * 2, [[null, <ore:nuggetConductiveIron>, null], [null, <projectred-core:resource_item:342>, null], [null, <ore:nuggetConductiveIron>, null]], 160, <liquid:water> * 1000);

print("### Advanced Rocketry Init Complete ###");
