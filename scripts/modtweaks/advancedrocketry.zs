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
		<advancedrocketry:blastbrick> * 2 : [[<tconstruct:materials:2>, <ore:powderBlaze>, <tconstruct:materials:2>],[<ore:ingotBrickNether>, <ore:ingotBrickNether>, <ore:ingotBrickNether>], [<tconstruct:materials:2>, <ore:powderBlaze>, <tconstruct:materials:2>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in advancedRocketryRecipes {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Crafting Rudimentary Logic Circuit
mods.forestry.Carpenter.addRecipe(<advancedrocketry:ic> * 2, [[null, <ore:nuggetConductiveIron>, null], [null, <projectred-core:resource_item:342>, null], [null, <ore:nuggetConductiveIron>, null]], 160, <liquid:water> * 200);
mods.extendedcrafting.CombinationCrafting.addRecipe(<advancedrocketry:ic> * 2, 100000, 750, <projectred-core:resource_item:342>, [<ore:nuggetConductiveIron>, <ore:nuggetConductiveIron>]);

//Extended Crafting Recipes (T1 Table)
val advancedRocketry_EXTENDEDCRAFTING = {
	 <libvulpes:holoprojector> : [[<ore:blockGlassColorless>, <ore:dustElectrotine>, <ore:blockGlassColorless>], [<ore:dustElectrotine>, <ore:plateIron>, <ore:dustElectrotine>]],
	 <libvulpes:forgepowerinput> : [[null, <magneticraft:battery_item_low>, null], [<magneticraft:battery_item_low>, <modularmachinery:blockcasing>, <magneticraft:battery_item_low>], [null, <magneticraft:battery_item_low>, null]],
	 <libvulpes:hatch> : [[<ore:chestWood>], [<modularmachinery:blockcasing>]],
	 <libvulpes:hatch:1> : [[<modularmachinery:blockcasing>], [<ore:chestWood>]],
	 <libvulpes:hatch:2> : [[<minecraft:bucket>], [<modularmachinery:blockcasing>]],
	 <libvulpes:hatch:3> : [[<modularmachinery:blockcasing>], [<minecraft:bucket>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in advancedRocketry_EXTENDEDCRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

//Extended Crafting Recipes (T2 Table)
val advancedRocketry_EXTENDEDCRAFTING_T2 = {
	 <advancedrocketry:arcfurnace>	:	[[<ore:ingotBrickNether>, <tconstruct:materials:2>, <ore:ingotBrickNether>],
	 									[<tconstruct:materials:2>, scripts.helpers.CircuitTiers[0], <tconstruct:materials:2>],
										[<ore:ingotBrickNether>, <ore:plateCopper>, <ore:ingotBrickNether>],
										[null, <tconstruct:materials:2>, <ore:ingotBrickNether>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in advancedRocketry_EXTENDEDCRAFTING_T2 {
	recipes.remove(key.withAmount(1));
	scripts.helpers.createAdvancedCraftingRecipe(key, value, value[3][0], value[3][1], value[3][2], "", true);
}

//Arc Furnace Ore Processing Tooltip
<advancedrocketry:arcfurnace>.addTooltip(scripts.helpers.createTierTooltip("Processes up to Tier ", 1, false, " Ores, with a 2.0x output rate."));

//Arc Furnace Alloy Creation
val advancedRocketry = {
	 "Bronze" : ["Copper", "Tin"],
	 "Electrum" : ["Gold", "Silver"],
	 "Constantan" : ["Copper", "Nickel"],
	 "Invar" : ["Iron", "Nickel"],
} as string[][string];

for output, inputs in advancedRocketry {
	var inputCount as int = 1;
	var outputCount as int = 2;
	var inputDust1 = oreDict.get("dust" ~ inputs[0]);
	var inputIngot1 = oreDict.get("ingot" ~ inputs[0]);
	var inputDust2 = oreDict.get("dust" ~ inputs[1]);
	var inputIngot2 = oreDict.get("ingot" ~ inputs[1]);
	var outputIngot = oreDict.get("ingot" ~ output);

	if(inputs[0] == "Copper" && inputs[1] == "Tin")
	{
		inputCount = 3;
	}
	else if(inputs[0] == "Iron" && inputs[1] == "Nickel")
	{
		inputCount = 3;
	}

	if(output == "Bronze")
	{
		outputCount = 4;
	}

	if(output == "Invar")
	{
		outputCount = 3;
	}

	if(!inputDust1.empty && !inputDust2.empty && !inputIngot1.empty && !inputIngot2.empty && !outputIngot.empty)
	{
		for item1 in inputIngot1.items
		{
			for item2 in inputIngot2.items
			{
				mods.advancedrocketry.ArcFurnace.addRecipe(outputIngot.firstItem * outputCount, 600, 2, item1 * inputCount, item2);
			}
		}

		for dust1 in inputDust1.items
		{
			for dust2 in inputDust2.items
			{
				mods.advancedrocketry.ArcFurnace.addRecipe(outputIngot.firstItem * outputCount, 500, 2, dust1 * inputCount, dust2);
			}
		}
	}
}

//Remove Default Arc Furnace Recipes
mods.advancedrocketry.ArcFurnace.removeRecipe(<advancedrocketry:productingot:1>);
mods.advancedrocketry.ArcFurnace.removeRecipe(<libvulpes:productingot:3>);

//Arc Furnace Steel Processing
for dust in <ore:dustCoal>.items //Coal Dust Based Processing
{
	for ingot in <ore:ingotIron>.items
	{
		mods.advancedrocketry.ArcFurnace.addRecipe(<ore:ingotSteel>.firstItem, 1200, 4, ingot, dust * 4);
	}
}
mods.advancedrocketry.ArcFurnace.addRecipe(<ore:ingotSteel>.firstItem, 1200, 4, <ore:ingotIron>.firstItem, <ore:fuelCoke>.firstItem); //Coal Coke based Processing

print("### Advanced Rocketry Init Complete ###");
